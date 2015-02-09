
new object $mail_list: $mail_root, $has_name;

var $has_name name = ['uniq, "mail_list", "the mail_list"];
var $mail_list last_received_on = 0;
var $mail_list mail = [];
var $mail_list notify = [];
var $mail_list readers = [];
var $mail_list senders = [];
var $root created_on = 796268969;
var $root defined_settings = #[["inet-list", #[['parse, ['parse_inet_list_setting]]]], ["mail-readers", #[['get, ['get_maillist_setting]], ['set, ['set_maillist_setting]], ['parse, ['parse_maillist_setting]], ['format, ['fmt_maillist_setting]]]], ["mail-senders", #[['get, ['get_maillist_setting]], ['set, ['set_maillist_setting]], ['parse, ['parse_maillist_setting]], ['format, ['fmt_maillist_setting]]]], ["mail-notify", #[['get, ['get_maillist_setting]], ['set, ['set_maillist_setting]], ['parse, ['parse_maillist_setting]], ['format, ['fmt_maillist_setting]]]]];
var $root flags = ['methods, 'code, 'core, 'variables, 'fertile];
var $root help_node = $help_obj_mail_list;
var $root inited = 1;
var $root managed = [$mail_list];
var $root manager = $mail_list;
var $root settings = #[["inet-list", ""]];
var $root trusted_by = [$mail_db];

protected method ._announce_new_mail() {
    arg new_mail;
    var line, who, n;
    
    if (!notify)
        return;
    line = ((((.mail_name()) + " has been sent new mail by ") + ((new_mail.from()).name())) + ": ") + (new_mail.subject());
    for who in (notify)
        (| who.tell(line.chop(who.linelen())) |);
};

public method .add_mail() {
    var new_mail;
    
    (> .perms(caller(), $mail_message) <);
    last_received_on = time();
    new_mail = sender();
    
    // make sure we do not already have it
    if (new_mail in mail)
        return;
    
    // add it
    mail = mail.add(new_mail);
    ._announce_new_mail(new_mail);
};

public method .add_sender_to_notification() {
    var who;
    
    if (caller() != $mail_ui)
        throw(~perm, "Permission Denied");
    who = sender();
    if (!(who.has_ancestor($user)))
        throw(~type, "Sender is not a user.");
    if (!(.list_is_readable_by(who)))
        throw(~perm, ((who.name()) + " cannot read ") + (.mail_name()));
    notify = setadd(notify, who);
};

root method .core_mail_list() {
    var o;
    
    if (type(senders) == 'list)
        senders = filter o in (senders) where (valid(o));
    if (type(notify) == 'list)
        notify = filter o in (notify) where (valid(o));
    if (type(readers) == 'list)
        readers = filter o in (readers) where (valid(o));
};

public method .del_mail() {
    arg old_mail, @reason;
    
    [(reason ?= 0)] = reason;
    if ((caller() == $mail_message) && (reason == 'mail_destroyed)) {
        // being called by $mail_message.uninit_mail_message()
    } else if (sender() == this()) {
        // this is ok too
    } else if (caller() == $pop3_interface) {
        // so is this--ugh, hardcoding
    } else if ((!(| old_mail.perms(sender()) |)) && (!(| .perms(sender()) |))) {
        throw(~perm, ((sender().namef('ref)) + " cannot remove mail from ") + (.mail_name()));
    }
    if (old_mail == (mail.last()))
        last_received_on = (| (mail[(mail.length()) - 1]).time() |) || 0;
    (| old_mail.del_recipient(this()) |);
    mail = mail.del(old_mail);
};

public method .del_sender_from_notification() {
    var who;
    
    who = sender();
    if (!(who.has_ancestor($user)))
        throw(~type, "Sender is not a user.");
    if (!(.has_flag('sender, who)))
        throw(~perm, ((who.name()) + " cannot read ") + (.mail_name()));
    notify = notify.setremove(who);
};

public method .fmt_maillist_setting() {
    arg data;
    
    if (type(data) == 'list)
        return join(data, ", ");
    else if (data)
        return "anybody";
    else
        return "writers";
};

public method .get_maillist_setting() {
    arg name, definer;
    
    name = tosym(substr(name, 6));
    if ((name == 'readers) || ((name == 'senders) || (name == 'notify)))
        return get_var(name);
    throw(~perm, "Permission Denied");
};

root method .init_mail_list() {
    mail = [];
    senders = 1;
    if (!(.has_ancestor($user))) {
        readers = 1;
        notify = [];
        (| $mail_db.insert(.name(), this()) |);
    } else {
        readers = [.manager()];
        notify = [.manager()];
    }
};

public method .last_received_on() {
    return last_received_on;
};

public method .list_is_inet() {
    return (.get_setting("inet-list", $mail_list)) ? 1 : 0;
};

public method .list_is_readable_by() {
    arg who;
    
    if (.is_writable_by(who))
        return 1;
    if (type(readers) == 'list)
        return who in readers;
    return readers;
};

public method .list_is_sendable_by() {
    arg who;
    
    if (.is_writable_by(who))
        return 1;
    if (type(senders) == 'list)
        return who in senders;
    return senders;
};

public method .mail() {
    //  if (!.list_is_sendable_by(sender()))
    //      throw(~perm, "Sender cannot read " + .mail_name() + ".");
    return mail;
};

public method .mail_list_next() {
    arg cur;
    
    if (!(.list_is_readable_by(sender())))
        throw(~perm, "Sender cannot read this list.");
    return (> mail[(cur in mail) + 1] <);
};

public method .mail_list_prev() {
    arg cur;
    
    if (!(.list_is_readable_by(sender())))
        throw(~perm, "Sender cannot read this list.");
    return (> mail[(cur in mail) - 1] <);
};

public method .mail_name() {
    return $mail_lib.mail_name(this());
};

public method .notify() {
    (> .perms(sender(), 'manager) <);
    return notify;
};

public method .notify_bad_mail() {
    arg badmail;
    
    // this is a hack, we shouldn't ever get bad mail if things worked right
    (> .perms(caller(), $mail_ui) <);
    mail = setremove(mail, badmail);
};

public method .parse_inet_list_setting() {
    arg value, @args;
    
    if (!($sys.is_system(user())))
        throw(~nope, "Only administrators can set internet mail list proxies.");
    return value;
};

public method .parse_maillist_setting() {
    arg value;
    var action, list, item, out;
    
    value = value.trim();
    if (value.is_positive())
        return ['set, 1];
    else if ((value.is_negative()) || (value == "writers"))
        return ['set, 0];
    if (value && ((value[1]) in ["+", "-"])) {
        if ((value[1]) == "-")
            action = 'del;
        else
            action = 'add;
        list = [substr(value, 2)];
    } else {
        action = 'set;
        list = value.explode_english_list();
    }
    out = [];
    for item in (list)
        out += [(> $object_lib.to_dbref(item) <)];
    if (action == 'set)
        return [action, out];
    else
        return [action, out[1]];
};

public method .recent_mail() {
    arg @diff;
    
    if (!(.list_is_readable_by(sender())))
        throw(~perm, ("Sender cannot read " + (.mail_name())) + ".");
    [(diff ?= 20)] = diff;
    if ((mail.length()) < diff)
        return [0, mail];
    return [((mail.length()) - diff) - 1, mail.subrange((mail.length()) - diff)];
};

public method .senders() {
    (> .perms(sender(), 'manager) <);
    return senders;
};

protected method .set_maillist_setting() {
    arg name, definer, value;
    var action;
    
    name = tosym(substr(name, 6));
    [action, value] = value;
    if ((name != 'readers) && ((name != 'senders) && (name != 'notify)))
        throw(~perm, "Permission Denied");
    switch (action) {
        case 'set:
            set_var(name, value);
        case 'add:
            set_var(name, setadd(get_var(name), value));
        case 'del:
            set_var(name, setremove(get_var(name), value));
    }
};

public method .set_name() {
    arg new_name, @args;
    var old_name;
    
    old_name = .name('noarticle);
    if (new_name && ((new_name[1]) == "*"))
        new_name = new_name.subrange(2);
    (> pass(new_name, @args) <);
    (| $mail_db.key_changed(old_name, new_name) |);
};

public method .set_notify() {
    arg new_value;
    
    (> .perms(sender(), 'manager) <);
    if ((type(new_value) != 'integer) && (type(new_value) != 'list))
        throw(~type, "new value must be submitted as a list of users or boolean integer.");
    notify = new_value;
};

public method .set_senders() {
    arg new_value;
    
    (> .perms(sender(), 'manager) <);
    if ((type(new_value) != 'integer) && (type(new_value) != 'list))
        throw(~type, "new value must be submitted as a list of users or boolean integer.");
    senders = new_value;
};

public method .start() {
    if (!(.list_is_readable_by(sender())))
        throw(~perm, ("Sender cannot read " + (.mail_name())) + ".");
    if (mail)
        return mail[1];
    return 0;
};

root method .uninit_mail_list() {
    var m;
    
    for m in (mail)
        .del_mail(m);
    mail = [];
    senders = 1;
    readers = [.manager()];
    notify = [];
    if (!(.has_ancestor($user)))
        (| $mail_db.remove(.name()) |);
    $smtp.remove_aliases();
};


