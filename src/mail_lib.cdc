
new object $mail_lib: $libraries, $mail_root;

var $mail_lib mail_system = [$mail_message, $mail_list, $mail_ui, $mail_lib, $pop3_interface];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$mail_lib];
var $root manager = $mail_lib;

public method .generate_unique_id() {
    arg message;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> message.perms(sender()) <);
    return crypt(toliteral([message.time(), message.from(), message.recipients(), message.subject(), message.body()]), "POP3").subrange(9);
};

public method .has_mail_perms() {
    arg @args;
    var obj;
    
    for obj in (args) {
        if ((!(obj in mail_system)) && (!($sys.is_system(obj))))
            return 0;
    }
};

public method .indent_reply() {
    arg text;
    var l, out;
    
    out = [];
    for l in (text) {
        if (!(l.match_begin(">")))
            out += l.wrap_lines(65, "> ", 1);
        else
            out += [">" + l];
    }
    return out;
};

public method .mail_name() {
    arg obj;
    var name;
    
    if (!(obj.has_ancestor($mail_list)))
        throw(~type, "Object is not a child of $mail_recipient");
    name = (obj.name()).replace(" ", "-");
    if (obj.has_ancestor($user))
        return "~" + name;
    return "*" + name;
};

public method .match_mail_recipient() {
    arg name;
    
    catch ~namenf {
        if (name) {
            if (name == "me")
                return sender();
            if ((name[1]) == "*")
                return (> $mail_db.search(substr(name, 2)) <);
            if ((name[1]) == "~")
                return (> $user_db.search(substr(name, 2)) <);
            return (| $mail_db.search(name) |) || (> $user_db.search(name) <);
        }
    }
    throw(~listnf, ("No mail recipient found by the name \"" + name) + "\".");
};

public method .range_to_actual() {
    arg rng, current;
    var start, end, out, listm, m, x, list;
    
    list = current['list];
    listm = list.mail();
    if (type(rng[1]) == 'integer) {
        start = rng[1];
    } else {
        switch (rng[1]) {
            case 'end:
                if (type(rng[2]) != 'symbol)
                    throw(~range, "Backwards range.");
                start = ((current['list]).mail()).length();
            case 'start:
                start = 1;
            case 'current:
                start = (current['location]) in listm;
            case 'specific:
                out = [];
                for m in ((rng[2]).explode_english_list()) {
                    if ((!(x = toint(m))) || (x < 1)) {
                        sender().tell(("Ignoring list range element '" + m) + "'.");
                    } else {
                        catch ~range
                            out = setadd(out, (> listm[x] <));
                        with
                            sender().tell(((((("List range #" + x) + " is higher than the messages in ") + (list.mail_name())) + " (") + (listm.length())) + ")");
                    }
                }
                return out || throw(~range, "No elements in list range.");
        }
    }
    if (type(rng[2]) == 'integer) {
        end = rng[2];
    } else {
        switch (rng[2]) {
            case 'end:
                end = ((current['list]).mail()).length();
            case 'single:
                end = start;
            case 'start:
                throw(~range, "Backwards range.");
            case 'current:
                end = (current['location]) in ((current['list]).mail());
        }
    }
    if (start > end)
        throw(~range, "Backwards range.");
    out = [];
    for m in [start .. end] {
        catch ~range
            out = setadd(out, (> listm[m] <));
        with
            sender().tell(((((("List range #" + m) + " is higher than the messages in ") + (list.mail_name())) + " (") + (listm.length())) + ")");
    }
    return out || throw(~range, "No elements in list range.");
};


