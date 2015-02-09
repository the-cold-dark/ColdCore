
new object $pop3_interface: $connection_interface;

var $command_cache commands = 0;
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $pop3_interface commands = #[["QUIT", 'quit_cmd], ["STAT", 'stat_cmd], ["LIST", 'list_cmd], ["RETR", 'retr_cmd], ["DELE", 'dele_cmd], ["NOOP", 'noop_cmd], ["RSET", 'rset_cmd], ["TOP", 'top_cmd], ["UIDL", 'uidl_cmd], ["USER", 'user_cmd], ["PASS", 'pass_cmd], ["APOP", 'apop_cmd]];
var $pop3_interface deleted = [];
var $pop3_interface mail_objects = [];
var $pop3_interface maildrop = 0;
var $pop3_interface state = 0;
var $root created_on = 871668198;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$pop3_interface];
var $root manager = $pop3_interface;
var $root quota_exempt = 1;

protected method .check_state() {
    arg command, st;
    
    if (state != st)
        throw(~stop, ((("-ERR " + command) + " command only valid in ") + st) + " state");
};

protected method .check_valid_message() {
    arg num;
    
    if ((num < 1) || (num > (mail_objects.length())))
        throw(~stop, ("-ERR no such message, only " + (mail_objects.length())) + " messages in maildrop");
    else if (num in deleted)
        throw(~stop, "-ERR ", x, " refers to a deleted message");
};

public method .connection_starting() {
    arg host, port;
    
    (> .perms(caller(), $connection) <);
    state = 'authorization;
    deleted = [];
    .print("+OK Cold POP3 Server ready");
};

protected method .dele_cmd() {
    arg argstr;
    var msgnum;
    
    (> .check_state("DELE", 'transaction) <);
    (> .check_valid_message((msgnum = toint(argstr))) <);
    deleted += [msgnum];
    .print("+OK message deleted");
};

protected method .invalid_cmd() {
    arg line;
    
    .print("-ERR unimplemented or unrecognized command");
};

protected method .list_cmd() {
    arg argstr;
    var x, m;
    
    (> .check_state("LIST", 'transaction) <);
    if (argstr) {
        (> .check_valid_message((x = toint(argstr))) <);
        .print("+OK " + ((mail_objects[x]).rfc822_size()));
    } else {
        .print(((("+OK " + ((m = .live_messages()).length())) + " messages (") + (.mailbox_size())) + " octets)");
        for x in [1 .. mail_objects.length()] {
            if (!(x in deleted))
                .print((x + " ") + ((mail_objects[x]).rfc822_size()));
        }
        .print(".");
    }
};

protected method .live_messages() {
    var x, r;
    
    r = [];
    for x in [1 .. mail_objects.length()] {
        if (!(x in deleted))
            r += [mail_objects[x]];
    }
    return r;
};

protected method .mailbox_size() {
    var x;
    
    return map x in (mail_objects) to (x.rfc822_size()).sum();
};

protected method .noop_cmd() {
    arg argstr;
    
    (> .check_state("NOOP", 'transaction) <);
    .print("+OK");
};

protected method .null_cmd() {
    arg line;
    
    return .invalid_cmd(line);
};

public method .parse_line() {
    arg line;
    var cmd, argstr, meth;
    
    (> .perms(caller(), $connection) <);
    cmd = line.word(1);
    argstr = (" " in line) ? (line.subrange((" " in line) + 1)) : "";
    if (!cmd)
        meth = 'null_cmd;
    else
        meth = (| default_var('commands)[cmd] |) || 'invalid_cmd;
    catch any {
        return .(meth)(argstr);
    } with {
        if (error() == ~stop) {
            .print((traceback()[1])[2]);
        } else {
            .print("-ERR Unrecoverable internal error");
            return 'disconnect;
        }
    }
};

protected method .pass_cmd() {
    arg argstr;
    var x;
    
    (> .check_state("USER", 'authorization) <);
    if (!maildrop)
        throw(~stop, "-ERR issue USER command first");
    if (maildrop.check_password(argstr)) {
        catch any
            mail_objects = maildrop.mail();
        with
            throw(~stop, "-ERR could not open maildrop");
        state = 'transaction;
        .print(((((("+OK " + (maildrop.namef('ref))) + " has ") + (mail_objects.length())) + " messages (") + (.mailbox_size())) + " octets)");
    } else {
        throw(~stop, "-ERR authentication failed");
    }
};

protected method .print() {
    arg @args;
    
    (.connection()).write(@args);
};

protected method .quit_cmd() {
    arg argstr;
    var errors, x;
    
    if (state != 'transaction) {
        .print("+OK Cold POP3 server signing off.");
    } else {
        for x in (deleted) {
            catch any
                maildrop.del_mail(mail_objects[x]);
            with
                errors++;
        }
        if (errors)
            .print("-ERR some messages could not be deleted");
        else
            .print(("+OK Cold POP3 server signing off (" + ((maildrop.mail()) ? (((maildrop.mail()).length()) + " messages left") : "maildrop empty")) + ")");
    }
    return 'disconnect;
};

protected method .retr_cmd() {
    arg argstr;
    var msgnum, x;
    
    (> .check_state("RETR", 'transaction) <);
    (> .check_valid_message((msgnum = toint(argstr))) <);
    .print(("+OK " + ((mail_objects[msgnum]).rfc822_size())) + " octets");
    for x in ((mail_objects[msgnum]).format_rfc822()) {
        refresh();
        if (!x)
            .print(x);
        else
            .print(((x[1]) == ".") ? ("." + x) : x);
    }
    .print(".");
};

protected method .rset_cmd() {
    arg argstr;
    
    (> .check_state("RSET", 'transaction) <);
    deleted = [];
    .print(((("+OK maildrop has " + (mail_objects.length())) + " messages (") + (.mailbox_size())) + " octets)");
};

protected method .stat_cmd() {
    arg argstr;
    var x, m;
    
    (> .check_state("STAT", 'transaction) <);
    .print((("+OK " + ((m = .live_messages()).length())) + " ") + (.mailbox_size()));
};

protected method .top_cmd() {
    arg argstr;
    var args, m, n, x, b;
    
    (> .check_state("TOP", 'transaction) <);
    if (((args = argstr.explode()).length()) != 2)
        throw(~stop, "-ERR command needs two arguments");
    if ((n = toint(args[2])) < 0)
        throw(~stop, "-ERR second argument must be a non-negative integer");
    (> .check_valid_message((m = toint(args[1]))) <);
    .print("+OK");
    for x in ((mail_objects[m]).format_rfc822()) {
        if (x)
            .print(((x[1]) == ".") ? ("." + x) : x);
        else
            .print(x);
        if (b) {
            if (--n <= 0)
                break;
        } else if (!x) {
            b++;
        }
    }
    .print(".");
};

protected method .uidl_cmd() {
    arg argstr;
    var x;
    
    (> .check_state("UIDL", 'transaction) <);
    if (argstr) {
        (> .check_valid_message((x = toint(argstr))) <);
        .print((("+OK " + x) + " ") + ((mail_objects[x]).unique_id()));
    } else {
        .print("+OK");
        for x in [1 .. mail_objects.length()] {
            if (!(x in deleted))
                .print((x + " ") + ((mail_objects[x]).unique_id()));
        }
        .print(".");
    }
};

protected method .user_cmd() {
    arg argstr;
    
    (> .check_state("USER", 'authorization) <);
    catch any
        maildrop = $user_db.exact_match(argstr);
    with
        throw(~stop, "-ERR unknown user");
    .print("+OK " + (maildrop.namef('ref)));
};


