
new object $smtp_interface: $connection_interface, $has_name;

var $command_cache commands = 0;
var $command_cache shortcuts = 0;
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "smtp_interface", "smtp_interface"];
var $root created_on = 849172060;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$smtp_interface];
var $root manager = $smtp_interface;
var $root quota_exempt = 1;
var $root trusted_by = [$no_one];
var $smtp_interface cmd_help = #[["HELP", ["HELP [<topic>]", "    For more help on any command type 'help <cmd>'"]], ["QUIT", ["QUIT", "    Ends your mail session"]], ["EXPN", ["EXPN <recipient>", "   Expand an address."]], ["VRFY", ["VRFY <recipient>", "   Verify an address."]], ["HELO", ["HELO <hostname>", "   Introduce yourself."]], ["MAIL", ["MAIL FROM: <sender>", "   Specify sender/return path."]], ["NOOP", ["NOOP", "   Do nothing"]], ["RCPT", ["RCPT TO:<recipient>", "   Specifies the recipient.  Can be used any number of times."]], ["DATA", ["DATA", "   Following data is collected as the message", "   End with a single dot"]]];
var $smtp_interface cmds = #[["HELP", 'help_cmd], ["QUIT", 'quit_cmd], ["VRFY", 'verify_cmd], ["EXPN", 'verify_cmd], ["HELO", 'hello_cmd], ["MAIL", 'mail_from_cmd], ["NOOP", 'noop_cmd], ["RCPT", 'recipient_cmd], ["DATA", 'data_cmd]];
var $smtp_interface given_hostname = "";
var $smtp_interface header = [];
var $smtp_interface mail_body = [];
var $smtp_interface mail_from = "";
var $smtp_interface mail_status = 'idle;
var $smtp_interface mail_to = [];
var $smtp_interface read_header = 0;

public method .connection_starting() {
    arg addr, port;
    
    (.connection()).write((("220 " + ($sys.server_info('server_hostname))) + " SMTP ColdMail 1.0/1.0; ") + ($time.format("%a, %d %b %Y %T %Z")));
};

public method .data_cmd() {
    arg rest;
    var conn;
    
    conn = .connection();
    if (mail_from == "") {
        conn.write("503 Need MAIL command");
    } else if (mail_to == []) {
        conn.write("503 Need RCPT command");
    } else {
        conn.write("354 Enter mail, end with \".\" on a line by itself");
        mail_status = 'read_body;
    }
};

public method .get_cmd() {
    arg cmd;
    
    return (> cmds[cmd] <);
};

public method .get_cmd_help() {
    arg help;
    
    return (> cmd_help[help] <);
};

public method .get_cmds() {
    return cmds.keys();
};

public method .hello_cmd() {
    arg rest;
    var conn;
    
    conn = .connection();
    if ((rest.length()) == 0) {
        conn.write("501 HELO requires domain address");
    } else if (given_hostname == 0) {
        conn.write(((("250 " + ($sys.server_info('server_hostname))) + " Hello ") + (conn.address())) + ", pleased to meet you");
        given_hostname = rest;
    } else {
        conn.write("503 portland.puremagic.com Duplicate HELO");
    }
};

public method .help_cmd() {
    arg rest;
    var i, conn;
    
    conn = .connection();
    if ((rest.length()) == 0) {
        conn.write(["214-This is ColdMail 0.01.", "214-Valid Commands:"]);
        for i in (definer().get_cmds())
            conn.write("214-  " + i);
        conn.write("214 End of Help");
    } else {
        catch ~keynf {
            rest = definer().get_cmd_help(rest);
            for i in (rest)
                conn.write("214-" + i);
            conn.write("214 End of Help");
        } with {
            conn.write(("504 HELP topic '" + rest) + "' not found.");
        }
    }
};

public method .init_smtp_interface() {
    .reset_interface();
    mail_status = 'idle;
};

public method .mail_from_cmd() {
    arg rest;
    var conn, i;
    
    conn = .connection();
    if (((rest.length()) <= 5) || (((i = ":" in rest) != 5) || ((| rest.subrange(1, 5) |) != "from:"))) {
        conn.write(("501 Syntax error in \"" + (rest.subrange(1, (i == 0) ? (rest.length()) : (i - 1)))) + "\"");
    } else if (mail_from != "") {
        conn.write("503 Sender already specified");
    } else {
        .reset_interface();
        mail_from = (rest.subrange(6)).trim();
        header = [["MAIL FROM", mail_from]];
        conn.write(("250 " + mail_from) + "... sender ok");
    }
};

public method .noop_cmd() {
    arg rest;
    
    (.connection()).write("250 Ok");
};

public method .parse_line() {
    arg line;
    var method, cmd, args, name, rest, m, last;
    
    if (mail_status == 'read_body) {
        if (line == ".") {
            .send_mail();
            mail_status = 'idle;
            return;
        } else {
            if (read_header) {
                mail_body += [line];
            } else if (!line) {
                read_header = 1;
            } else if ((m = regexp(line, "^([^ ][^:]+) *: *(.*)$"))) {
                header += [m];
            } else if (header) {
                last = header[listlen(header)];
                header = sublist(header, 1, listlen(header));
                last = replace(last, 2, (last[2]) + line);
                header += [last];
            }
            return;
        }
    }
    cmd = line.word(1);
    if ((line.length()) >= ((cmd.length()) + 2))
        args = line.subrange((cmd.length()) + 2);
    else
        args = "";
    catch ~keynf {
        method = definer().get_cmd(cmd);
    } with {
        (.connection()).write("500 unrecognized command");
        return 'disconenct;
    }
    return .(method)(args);
};

public method .quit_cmd() {
    arg rest;
    
    (.connection()).write(("221 " + ($sys.server_info('server_hostname))) + " closing connection");
    return 'disconnect;
};

public method .recipient_cmd() {
    arg rest;
    var conn, i, user;
    
    conn = .connection();
    if (mail_from == "") {
        conn.write("503 Need MAIL before RCPT");
    } else if (((rest.length()) <= 3) || (((i = ":" in rest) != 3) || ((| rest.subrange(1, 3) |) != "to:"))) {
        conn.write(("501 Syntax error in \"" + (rest.subrange(1, (i == 0) ? (rest.length()) : (i - 1)))) + "\"");
    } else {
        catch any {
            user = $smtp.parse_recipient(rest.subrange(4));
            mail_to += [user];
            conn.write(("250 " + user) + "... recipient ok");
        } with {
            if (error() == ~ambig)
                conn.write("553 Ambiguous Recipient");
            else
                conn.write(((((traceback()[1])[3]) || 550) + " ") + ((traceback()[1])[2]));
        }
    }
};

public method .reset_interface() {
    header = [];
    read_header = 0;
    mail_from = "";
    mail_to = [];
    mail_body = [];
};

public method .send_mail() {
    var l, subj, from;
    
    .set_name(mail_from, 'prop);
    subj = "<NO SUBJECT>";
    for l in (header) {
        if ((l[1]) == "Subject")
            subj = l[2];
        if ((l[1]) == "From")
            from = l[2];
    }
    from ?= mail_from;
    catch any {
        $no_one.mail_as(from, header, subj, mail_body, @mail_to);
        (.connection()).write(("250 " + ($smtp_daemon.get_msg_id())) + " Message accepted for delivery");
    } with {
        .log_traceback(traceback(), "SMTP: DATA");
        (.connection()).write("550 Requested action not taken: Error delivering mail");
    }
    .reset_interface();
};

public method .uninit_smtp_interface() {
    header = 0;
    read_header = 0;
    mail_from = 0;
    mail_to = 0;
    mail_body = 0;
    mail_status = 0;
};

public method .verify_cmd() {
    arg rest;
    var conn, user, i, out;
    
    conn = .connection();
    if ((rest.length()) == 0) {
        conn.write("501 Argument required");
    } else {
        if (!($smtp.allowed('VRFY))) {
            conn.write("252 VRFY not allowed");
            return;
        }
        out = [];
        for i in (rest.explode()) {
            catch any {
                out = setadd(out, $smtp.parse_recipient(i));
            } with {
                switch (error()) {
                    case ~ambig:
                        conn.write("553 Ambiguous Recipient");
                    default:
                        conn.write(((((traceback()[1])[3]) || 550) + " ") + ((traceback()[1])[2]));
                        return;
                }
            }
        }
        for i in [1 .. (out.length()) - 1]
            conn.write("250-" + ($smtp.format_email_address(out[i])));
        if (out)
            conn.write("250 " + ($smtp.format_email_address(out.last())));
    }
};


