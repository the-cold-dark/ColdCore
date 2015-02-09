
new object $login_interface: $connection_interface;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $has_commands local = \
  #[["@who", [["@who", "", "@who", 'who_cmd, #[]]]], ["m?otd", [["m?otd", "", "m?otd", 'motd_cmd, #[]]]], ["h?elp", [["h?elp", "", "h?elp", 'help_cmd, #[]]]], ["guest|connect-guest", [["guest|connect-guest", "*", "guest|connect-guest <any>", 'connect_guest_cmd, #[[1, ['any, []]]]]]],\
  ["c?onnect",\
    [["c?onnect", "*", "c?onnect <any>", 'connect_cmd, #[[1, ['any, []]]]]]],\
  ["@quit|QUIT",\
    [["@quit|QUIT", "", "@quit|QUIT", 'quit_cmd, #[]]]], ["cr?eate", [["cr?eate", "*", "cr?eate <any>", 'create_cmd, #[[1, ['any, []]]]]]]];
var $root created_on = 809051864;
var $root flags = ['methods, 'code, 'core, 'variables, 'command_cache];
var $root inited = 1;
var $root managed = [$login_interface];
var $root manager = $login_interface;
var $root quota_exempt = 1;
var $root trusted_by = [$smtp];

protected method .connect_cmd() {
    arg cmdstr, cmd, args;
    var syn, stderr, passwd, name, user;
    
    syn = cmd + " <name> <password>";
    stderr = "Either that user does not exist or has a different password.";
    args = args.explode();
    if ((args.length()) < 2)
        (> .tell_error("Last word is taken as the password.", syn) <);
    passwd = args[args.length()];
    name = (args.subrange(1, (args.length()) - 1)).join();
    user = (| $user_db.search(name) |) || (> .tell_error(syn, stderr) <);
    if (!(user.check_password(passwd, (.connection()).address())))
        (> .tell_error(syn, stderr) <);
    if ($sys.user_denied(user)) {
        .print(("Access to user " + (user.namef('ref))) + " is currently denied.");
        .print(("Contact " + ($smtp.get_email_address('admin))) + " for more information.");
    } else {
        (.connection()).change_interface(user);
    }
};

protected method .connect_guest_cmd() {
    arg cmdstr, cmd, args;
    var syn, msg, c, email, name, result, semail, user;
    
    if (!($login_daemon.get_setting("guests-allowed", $login_daemon)))
        return (> .tell_error("", $login_daemon.get_setting("guests-disabled-msg", $login_daemon)) <);
    syn = cmd + " <your name> <your email>";
    semail = $smtp.get_email_address('login);
    args = args.explode();
    c = .connection();
    if ((args.length()) < 2)
        (> .tell_error(syn) <);
    name = (args.subrange(1, (args.length()) - 1)).join();
    email = args[args.length()];
    if ($sys.validate_email_addresses()) {
        catch any {
            .print("Verifying Email Address..");
            msg = $smtp.verify_email_address(email);
            .print("SMTP Response: " + (msg.join(" ")));
        } with {
            .print("Aborting: " + ((traceback()[1])[2]));
            return;
        }
    }
    catch any
        user = (> $sys.create_user(name, 0, email, 'anonymous_user_class) <);
    with
        (> .tell_error(syn, (traceback()[1])[2], "If there is a problem contact: " + semail) <);
    c.change_interface(user);
};

public method .connection_starting() {
    arg host, port;
    
    (> .perms(caller(), $connection) <);
    .cache_client_init();
    .print(.motd());
};

protected method .create_cmd() {
    arg cmdstr, cmd, args;
    var syn, msg, user, semail, len, name, pwd, email, result;
    
    if (!($login_daemon.get_setting("creation-allowed", $login_daemon)))
        return (> .tell_error("", $login_daemon.get_setting("creation-disabled-msg", $login_daemon)) <);
    syn = cmd + " <name> <password> <email@host>";
    semail = $smtp.get_email_address('login);
    args = args.explode_quoted();
    if ((args.length()) < 3)
        (> .tell_error(syn) <);
    if ((args.length()) > 3) {
        len = listlen(args);
        args = [sublist(args, 1, len - 2).join(), args[len - 1], args[len]];
    }
    [name, pwd, email] = args;
    if ((| $user_db.search(name) |))
        (> .tell_error(syn, ("The name '" + name) + "' is already taken.") <);
    if ($sys.validate_email_addresses()) {
        catch any {
            .print("Verifying Email Address..");
            msg = $smtp.verify_email_address(email);
            .print("SMTP Response: " + (msg.join(" ")));
        } with {
            .print("Aborting: " + ((traceback()[1])[2]));
            return;
        }
    }
    catch any {
        user = $sys.create_user(name, pwd, email);
    } with {
        if (user)
            (| user.destroy() |);
        .log_traceback(traceback(), "LOGIN: " + cmdstr);
        msg = ["There was a problem creating you:"];
    
        //// Too verbose.
        // msg += $parse_lib.traceback(traceback());
        // msg += ["If there is a problem contact: " + semail];
        (> .tell_error(syn, (msg + ["  " + ((traceback()[1])[2])]).prefix("!  ")) <);
        return;
    }
    (.connection()).change_interface(user);
};

protected method .help_cmd() {
    arg cmdstr, cmd;
    
    .print($motd.connect_help());
    if (!($login_daemon.get_setting("creation-allowed", $login_daemon)))
        .print(["", "NOTE: User creation is disabled, connect as a guest first."]);
};

protected method .invalid_cmd() {
    arg @args;
    var line;
    
    line = (((($login_interface.command_cache()).values()).slice(1)).slice(1)).compress();
    if (!($login_daemon.get_setting("creation-allowed", $login_daemon)))
        line = line.del("cr?eate");
    .print("Try: " + (line.to_english("", " or ")));
};

protected method .motd() {
    var out;
    
    // out = $motd.build('default) + ["", " ** Use 'H?elp' for a list of commands **".center(79), ""];
    out = $motd.build(@$motd.get_setting("login-sequence", $motd));
    return out;
};

protected method .motd_cmd() {
    arg cmdstr, cmd;
    
    .print(.motd());
};

protected method .null_cmd() {
    arg @args;
    
    return (> .invalid_cmd(@args) <);
};

public method .parse_line() {
    arg line;
    var cmd, c, match, parsed, i, m, a, u;
    
    catch any {
        while (line && ((line[1]) == " "))
            line = line.subrange(2);
        if (!line) {
            return .null_cmd(line);
        } else {
            cmd = line.explode();
            cmd = [line, cmd[1], ((cmd.subrange(2)).join()) || ""];
            c = (| $login_interface.match_command(@cmd) |);
            if (c && ((c[1]) == 'command)) {
                // screw duplicates, take the first match
                match = (c[2])[1];
                m = match[2];
                i = match[6];
                parsed = i.keys();
                for a in [1 .. m.length()] {
                    if (a in parsed)
                        m = m.replace(a + 2, (> $command_parser.convert_arg(cmd[2], (i[a])[1], m[a + 2], $no_one, ((i[a])[2]) ? (((i[a])[2])[1]) : $no_one, $no_one) <));
                }
                return (> .(match[5])(@m) <);
            }
            return (> .invalid_cmd(line) <);
        }
    } with {
        if (error() == ~stop) {
            if ((traceback()[1])[2])
                .print((traceback()[1])[2]);
        } else {
            .print($parse_lib.traceback(traceback()));
            return 'disconnect;
        }
    }
};

protected method .print() {
    arg what;
    
    (.connection()).write(what);
};

protected method .quit_cmd() {
    arg cmdstr, cmd;
    
    .print("Goodbye.");
    return 'disconnect;
};

protected method .tell_error() {
    arg syntax, @problem;
    var problem, line, sprefix, prefix, length;
    
    length = 79;
    if (syntax)
        .print(("=> Syntax: `" + syntax) + "`");
    if (problem) {
        for line in (problem) {
            if (type(line) == 'string)
                line = line.wrap_lines(length, "!  ", 1);
            .print(line);
        }
    }
    throw(~stop, "!  ** use h?elp for a list of commands and their usages **");
};

protected method .who_cmd() {
    arg cmdstr, cmd;
    
    .print($code_lib.generate_listing($user_db.connected()));
};


