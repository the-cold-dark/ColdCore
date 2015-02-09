
new object $smtp: $network;

var $root created_on = 845213524;
var $root defined_settings = #[["aliases", #[['get, ['get_aliases_setting]], ['set, ['set_aliases_setting]], ['parse, ['parse_itemlist, 'parse_alias_setting]], ['format, ['fmt_aliases_setting]]]], ["hosts", #[['get, ['get_hosts_setting]], ['set, ['set_hosts_setting]], ['parse, ['parse_itemlist, 'parse_host_setting]], ['format, ['format_itemlist]]]], ["maildrop", #[['get, ['get_maildrop_setting]], ['set, ['set_maildrop_setting]], ['parse, ['parse_maildrop_setting]], ['format, ['fmt_maildrop_setting]]]], ["cold-relay-recip", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$smtp];
var $root manager = $smtp;
var $root settings = #[["cold-relay-recip", 0]];
var $root trusted = [$login_interface, $user_info, $mail_message];
var $root trusted_by = [$outbound_connection];
var $smtp hosts = 0;
var $smtp mail_aliases = #[["postmaster", $mail_postmaster], ["admin", $mail_admin], ["abuse", $mail_admin], ["MAILER-DAEMON", $mail_postmaster]];
var $smtp maildrop = "127.0.0.1";
var $smtp postmaster = 0;
var $smtp timeouts = #[];
var $smtp valid_email_regexp = "^[-a-z0-9_!.%+$'=]+[^.]$";

protected method .DATA() {
    arg c, body;
    var lines, code, line, i;
    
    .set_timeout(c, 120);
    c.write("DATA");
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if (code != 354)
        throw(~error, (lines.slice(2)).join(), code);
    
    // escape period DATA termination
    while ((i = find i in (body) where (i == ".")))
        body = replace(body, i, "..");
    
    // send it
    c.write(body + ["."]);
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if (code != 250)
        throw(~error, (lines.slice(2)).join(), code);
};

protected method .MAIL_FROM() {
    arg c, address;
    var lines, code, line;
    
    .set_timeout(c, 120);
    c.write(("MAIL FROM: <" + address) + ">");
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if (code == 250)
        return lines.slice(2);
    throw(~error, (("ERROR FROM " + maildrop) + ": ") + ((lines.slice(2)).join()), code);
};

protected method .QUIT() {
    arg c;
    var lines, code, line, i;
    
    .set_timeout(c, 120);
    c.write("QUIT");
    
    // get it, but ignore it
    lines = (> .get_response(c) <);
};

protected method .RCPT_TO() {
    arg c, address;
    var lines, code, line;
    
    .set_timeout(c, 120);
    c.write(("RCPT TO: <" + address) + ">");
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if ((code < 300) && (code >= 200))
        return [code, lines.slice(2)];
    throw(~error, (lines.slice(2)).join(), code);
};

protected method .RSET() {
    arg c;
    var lines, code, line, i;
    
    .set_timeout(c, 120);
    c.write("RSET");
    
    // get it, but ignore it
    lines = (> .get_response(c) <);
};

protected method .VRFY() {
    arg c, address;
    var lines, code, line;
    
    .set_timeout(c, 120);
    c.write("VRFY " + address);
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if ((code < 300) && (code >= 200))
        return [code, lines.slice(2)];
    throw(~error, (lines.slice(2)).join(), code);
};

public method .add_mail_alias() {
    arg alias, recip;
    var name;
    
    if (type(alias) != 'string)
        throw(~type, "First argument must be a string name for the alias");
    if ((type(recip) != 'objnum) || (!(recip.is($mail_list))))
        throw(~type, "Second argument is not a valid $mail_list");
    name = alias;
    name = strsed(alias, "[^a-z0-9\.-]+", "", "g");
    if (name != alias)
        throw(~type, "Alias may only be alphanumeric characters, or a period or dash");
    mail_aliases = dict_add(mail_aliases, alias, recip);
};

public method .allowed() {
    arg cmd;
    
    return 1;
};

protected method .close_session() {
    arg c;
    
    (| c.close() |);
    .set_timeout(c, 0);
};

protected method .connect_to_smtp_host() {
    arg ip, @host;
    var line, c;
    
    if (host)
        host = host[1];
    else
        host = ip;
    c = $outbound_connection.new();
    catch any {
        c.open_connection(ip, 25);
        (> .negotiate_connect(c) <);
    } with {
        (| c.close() |);
        if (error() == ~refused)
            throw(~refused, "Unable to open SMTP connection to " + host);
        else
            rethrow(error());
    }
    return c;
};

public method .connection_going_away() {
    arg addr, port;
    
};

public method .connection_starting() {
    arg addr, port;
    
};

root method .core_smtp(): nooverride  {
    maildrop = "127.0.0.1";
    hosts = 0;
    .set_setting("cold-relay-recip", $smtp, "no");
};

public method .del_mail_alias() {
    arg alias;
    
    return dict_del(mail_aliases, alias);
};

public method .fmt_aliases_setting() {
    arg data;
    var a;
    
    return map a in (data) to (((a[1]) + ":") + ((a[2]).mail_name())).join(", ");
};

public method .fmt_maildrop_setting() {
    arg data;
    
    return (| (($dns.hostname(data)) + "/") + data |) || data;
};

public method .format_email_address() {
    arg recip, @notfull;
    var host, mailname;
    
    host = (| (.get_hosts_setting())[1] |);
    mailname = recip.mail_name();
    if ((| .lookup_alias((recip.name()).replace(" ", "-")) |)) {
        mailname = strsed(mailname, "^[*~]", "");
    } else {
        mailname = strsub(recip.mail_name(), "*", "list-");
        if (.get_setting("cold-relay-recip", $smtp))
            mailname = strsub(mailname, "~", "user-");
        else
            mailname = strsub(mailname, "~", "");
    }
    if (host) {
        if (notfull)
            return (mailname + "@") + host;
        return ((((((recip.name()).capitalize()) + " <") + mailname) + "@") + host) + ">";
    } else {
        if (notfull)
            return mailname;
        return ((((recip.name()).capitalize()) + " <") + mailname) + ">";
    }
};

protected method .get_aliases_setting() {
    arg @args;
    
    return mail_aliases;
};

public method .get_email_address() {
    arg type;
    var email, r, host;
    
    if (type(type) == 'objnum)
        (| (type = type.name()) |);
    if (type(type) != 'string)
        type = tostr(type);
    return .format_email_address((| .parse_recipient(type) |) || $mail_admin);
};

public method .get_hosts_setting() {
    arg @args;
    
    return hosts || [$dns.hostname("")];
};

public method .get_maildrop_setting() {
    arg @args;
    
    return maildrop;
};

protected method .get_response() {
    arg c;
    var line, code, m, more, out;
    
    if (c.is_reading_block())
        throw(~engaged, "Connection is already reading.");
    more = 1;
    out = [];
    while (more) {
        line = c.start_reading_block('one);
        if (line == 'disconnected)
            throw(~aborted, "Connection read aborted.");
        line = line[1];
        if (line == 'aborted)
            throw(~aborted, "Connection read aborted.");
        m = regexp(line, "^([0-9]+)([- ])(.*)$");
        if (listlen(m) != 3)
            throw(~invalid, "Unexpected response from server: " + line);
        more = (m[2]) == "-";
        out += [[toint(m[1]), m[3]]];
    }
    return out;
};

public method .get_system_email() {
    arg type;
    var email, r, host;
    
    if (type(type) != 'string)
        type = tostr(type);
    
    // format aliases here, so .format_email_address() doesn't confuse them
    if ((r = (| .lookup_alias(type) |))) {
        if ((host = (| (.get_hosts_setting())[1] |)))
            return (type + "@") + host;
        return type;
    }
    if ((r = (| .parse_recipient(type) |)))
        return .format_email_address(r, 'notfull);
    r = $mail_admin;
    if ((host = (| (.get_hosts_setting())[1] |)))
        return "admin@" + host;
    return "admin";
};

public method .lookup_alias() {
    arg name;
    
    return (> mail_aliases[name] <);
};

public method .mail_aliases() {
    return mail_aliases;
};

protected method .negotiate_connect() {
    arg c;
    var lines, code, line;
    
    .set_timeout(c, 120);
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if (code == 421)
        throw(~notavail, (lines.slice(2)).join());
    if (code != 220)
        throw(~invalid, (("Unknown response from server: " + code) + " ") + line);
    .set_timeout(c, 120);
    c.write("HELO " + ($sys.server_info('server_hostname)));
    lines = (> .get_response(c) <);
    [code, line] = lines[1];
    if (code == 250)
        return;
    if ((code % 500) < 100)
        throw(~syntax, "I'm doing something wrong: " + line);
    if (code == 421)
        throw(~notavail, (lines.slice(2)).join());
    throw(~invalid, (("Unknown response from server: " + code) + " ") + line);
};

public method .parse_alias() {
    arg alias;
    var tmp, obj, o;
    
    tmp = explode(alias, ":");
    if (listlen(tmp) != 2)
        throw(~type, ("Invalid alias pair '" + alias) + "', should be ALIAS:OBJ");
    [alias, obj] = tmp;
    tmp = strsed(alias, "[^a-z0-9\.-]+", "", "g");
    if (tmp != alias)
        throw(~type, "Alias must be composed of a-z, 0-9, a period or a dash");
    if (obj && ((obj[1]) == "$")) {
        if (!(o = (| $object_lib.to_dbref(obj) |)))
            throw(~type, "Invalid object: " + obj);
    } else if (!(o = (| $mail_lib.match_mail_recipient(obj) |))) {
        throw(~type, "Invalid mail recipient: " + obj);
    }
    if (!(o.is($mail_list)))
        throw(~type, ("Object " + o) + " is not a valid mail recipient.");
    return [alias, o];
};

public method .parse_alias_setting() {
    arg value, action, @args;
    var a;
    
    if (action == 'del) {
        value = explode(value, ":")[1];
        a = strsed(value, "[^a-z0-9\.-]+", "", "g");
        if (a != value)
            throw(~type, "Alias must be composed of a-z, 0-9, a period or a dash");
        if (!dict_contains(mail_aliases, value))
            throw(~failed, ("The alias '" + value) + "' is not set, and thus cannot be removed");
        return value;
    } else {
        return (> .parse_alias(value) <);
    }
};

public method .parse_email_address() {
    arg address, @lookup;
    var name, host, ip, h;
    
    if (!address)
        throw(~invemail, "No email address supplied.");
    address = explode(address, "@");
    if (listlen(address) != 2)
        throw(~invemail, ("\"" + (address.join("@"))) + "\" is not a valid email address.");
    [name, host] = address;
    if (!match_regexp(name, valid_email_regexp))
        throw(~invemail, ("'" + name) + "' is not a valid Internet mail username");
    if (lookup) {
        ip = $dns.ip(host);
        if ((!ip) || (ip == "-1"))
            throw(~invemail, ("'" + host) + "' does not resolv to an IP address");
        h = $dns.hostname(ip);
        if (!($dns.valid_hostname(h)))
            throw(~invemail, (("Invalid DNS entry for: " + host) + "/") + ip);
        host = h;
    } else if (!($dns.valid_hostname(host))) {
        throw(~invemail, ("Invalid hostname \"" + host) + "\"");
    }
    return [name, host, ip];
};

public method .parse_host_setting() {
    arg value, action, @args;
    
    if (action == 'del) {
        if (!(value in hosts))
            throw(~failed, ("The host '" + value) + "' is not set, and thus cannot be removed");
        return value;
    } else {
        (> $dns.ip(value) <);
        return lowercase(value);
    }
};

public method .parse_maildrop_setting() {
    arg value, @args;
    var name, ip;
    
    [(name ?= ""), (ip ?= "")] = explode(value, "/");
    if (!ip) {
        if (!name)
            name = "localhost";
        ip = (> $dns.ip(name) <);
    } else {
        (> $dns.hostname(ip) <);
    }
    return ip;
};

public method .parse_recipient() {
    arg user;
    var x, host;
    
    if (mail_aliases.contains(user))
        return mail_aliases[user];
    if (((user[1]) == "<") && ((user[user.length()]) == ">"))
        user = user.subrange(2, (user.length()) - 2);
    if ("@" in user) {
        [user, host] = explode(user, "@");
        if (!(host in ($smtp.get_hosts_setting())))
            throw(~perm, "Unwilling to accept or relay mail for: " + host, 571);
    }
    user = user.trim();
    user = strsed(user, "^list-", "*");
    user = strsed(user, "^user-", "~");
    return (| $smtp.lookup_alias(user) |) || (> $mail_lib.match_mail_recipient(user) <);
};

public method .remove_aliases() {
    var x;
    
    (> .perms(caller(), $mail_list) <);
    for x in (mail_aliases) {
        if ((x[2]) == sender())
            mail_aliases = dict_del(mail_aliases, x[1]);
    }
};

public method .sendmail() {
    arg from, recip, subj, body;
    var mailagent, header, c;
    
    if ((!(.trusts(caller()))) && (!(.trusts(sender()))))
        throw(~perm, ("Permission Denied: " + sender()) + " is not trusted.");
    mailagent = ((((($motd.server_name()) + " (") + ((| (.get_hosts_setting())[1] |) || "")) + ":") + ($login_daemon.current_port())) + ")";
    (> .parse_email_address(recip) <);
    if (!from)
        from = 'postmaster;
    if (type(from) == 'symbol)
        from = .get_email_address(from);
    header = ["Date: " + ($time.format("%a, %d %b %Y %H:%M:%S %Z")), "From: " + from, "To: " + recip, "Subject: " + subj, "Errors-to: " + (.get_email_address('postmaster)), "X-Mail-Agent: " + mailagent];
    
    // connect to maildrop
    c = (> .connect_to_smtp_host(maildrop) <);
    
    // send it off
    catch any {
        (> .MAIL_FROM(c, from) <);
        (> .RCPT_TO(c, recip) <);
        (> .DATA(c, (header + [""]) + body) <);
        (> .QUIT(c) <);
        .close_session(c);
    } with {
        .close_session(c);
        rethrow(error());
    }
};

protected method .set_aliases_setting() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            mail_aliases = value[2];
        case 'add:
            mail_aliases = dict_add(mail_aliases, @value[2]);
        case 'del:
            mail_aliases = dict_del(mail_aliases, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_hosts_setting() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            hosts = value[2];
        case 'add:
            hosts = setadd(hosts, value[2]);
        case 'del:
            hosts = setremove(hosts, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_maildrop_setting() {
    arg name, definer, value;
    
    maildrop = value;
};

protected method .set_timeout() {
    arg c, timeout;
    var task;
    
    task = (| timeouts[task_id()] |);
    if (task)
        (| $scheduler.del_task(task) |);
    if (timeout) {
        task = $scheduler.add_task(timeout, 'timeout, [c]);
        timeouts = dict_add(timeouts || #[], task_id(), task);
    } else if (dict_contains(timeouts || #[], task_id())) {
        timeouts = dict_del(timeouts, task_id());
    }
};

protected method .timeout() {
    arg conn;
    
    (| conn.close() |);
};

public method .verify_email_address() {
    arg address;
    var c, lines, code, email, name, m;
    
    if (!(| .perms(caller(), 'trusts) |))
        (> .perms(sender(), 'trusts) <);
    
    // connect
    address = (> .parse_email_address(address, 'resolv_host) <);
    c = (> .connect_to_smtp_host(address[3], address[2]) <);
    
    // VRFY enabled?
    catch ~error {
        [code, lines] = (> .VRFY(c, address[1]) <);
        if (code == 250) {
            .QUIT(c);
            .close_session(c);
    
            // munch on it a little
            if ((m = regexp(lines[1], "^([^<]+)<([^>]+)>"))) {
                [name, email] = m;
            } else if ((m = regexp(lines[1], "<([^>]+)>"))) {
                email = m[1];
                name = strsed(lines[1], " *<[^>]+> *", "");
            } else {
                [email, (name ?= "")] = lines;
            }
            return [email.trim(), name.trim()];
        }
    }
    
    // nope, try RCPT..
    catch any {
        (> .MAIL_FROM(c, $smtp.get_email_address('postmaster)) <);
        [code, lines] = (> .RCPT_TO(c, address[1]) <);
        .QUIT(c);
        .close_session(c);
        if ((m = regexp(lines[1], "<([^>]+)>")))
            email = m[1];
        else
            email = lines[1];
        return [email.trim()];
    } with {
        .QUIT(c);
        .close_session(c);
        rethrow(error());
    }
};


