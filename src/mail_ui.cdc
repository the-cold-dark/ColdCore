
new object $mail_ui: $mail_list, $user_interfaces;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $has_commands local = \
  #[["@sub?scribed", [["@sub?scribed", "*", "@sub?scribed <any>", 'subscribe_cmd, #[[1, ['any, []]]]]]],\
  ["@unsub?scribed",\
    [["@unsub?scribed", "*", "@unsub?scribed <any>", 'unsubscribe_cmd, #[[1, ['any, []]]]]]],\
  ["@mail-list?s",\
    [["@mail-list?s", "", "@mail-list?s", 'mail_lists_cmd, #[]]]], ["@read", [["@read", "*", "@read <any>", 'mail_read_cmd, #[[1, ['any, []]]]]]],\
  ["@remove-m?ail|@rmm?ail",\
    [["@remove-m?ail|@rmm?ail", "*", "@remove-m?ail|@rmm?ail <any>", 'mail_remove_cmd, #[[1, ['any, []]]]]]],\
  ["@mail",\
    [["@mail", "*", "@mail <any>", 'mail_on_cmd, #[[1, ['any, []]]]]]],\
  ["@reply",\
    [["@reply", "*", "@reply <any>", 'reply_cmd, #[[1, ['any, []]]]]]],\
  ["@send",\
    [["@send", "*", "@send <any: +e?dit>", 'send_to_cmd, #[[1, ['any_opt, ["e?dit"]]]]]]],\
  ["@nn|@next-new",\
    [["@nn|@next-new", "*", "@nn|@next-new <any>", 'next_new_cmd, #[[1, ['any, []]]]]]]];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Mail User Interface", "Mail User Interface"];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$mail_ui];
var $mail_list readers = [];
var $mail_list senders = 1;
var $mail_ui current = 0;
var $mail_ui subscribed = #[];
var $root created_on = 796268969;
var $root defined_settings = #[["@send-editor", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['methods, 'code, 'core, 'variables];
var $root help_node = $help_mail;
var $root inited = 1;
var $root managed = [$mail_ui];
var $root manager = $mail_ui;
var $root settings = #[["@send-editor", 1]];

root method .init_mail_ui() {
    current = #[['list, this()]];
    .subscribe(this());
    .new_list(this());
    (| .subscribe($mail_list_news) |);
    
    // now change the 'news' subscription so it notifies them NOW
    subscribed = subscribed.add($mail_list_news, [0, 0]);
};

protected method .mail_lists_cmd() {
    arg @args;
    var l, output;
    
    if (caller() != $mail_ui)
        (> .perms(caller(), 'command) <);
    output = map l in (($mail_db.database()).values()) to ($cml_lib.format_tr_tag($cml_lib.format_td_tag(l.mail_name()), $cml_lib.format_td_tag(dict_contains(subscribed, l) ? "[subscribed]" : " "), $cml_lib.format_td_tag((l.list_is_sendable_by(this())) ? "[sendable]" : " "), $cml_lib.format_td_tag((l.list_is_readable_by(this())) ? "[readable]" : " ")));
    return $ctext_frob.new_with(["All Available Mail Lists:", $cml_lib.format_table_tag("53%,17%,15%,15%", @output), $cml_lib.format_sep_tag()]);
};

protected method .mail_on_cmd() {
    arg cmdstr, cmd, str;
    var args, lmail, mail, rng, start, end, line, list, len, out, m, rows, o, from, subj, now_read;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template(str, "* on *"))) {
        rng = args[1];
        list = args[3];
    } else if (match_template(str, "* to *")) {
        return "Please use the @send command instead.";
    } else {
        rng = "";
        list = str;
    }
    if (!list) {
        list = current['list];
    } else {
        catch ~listnf, ~perm, ~ambig, ~objnf {
            list = (> $mail_lib.match_mail_recipient(list) <);
            (> .new_list(list) <);
        } with {
            if (error() == ~ambig)
                return ((("The list '" + list) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
            else
                return (traceback()[1])[2];
        }
    }
    if (!rng) {
        mail = list.mail();
        end = mail.length();
    
        // minus two for the head and tail
        rows = (.get_rows()) - 2;
        if (end > rows) {
            if (0 == (| ((.subscribed())[list])[2] |)) {
                now_read = 1;
            } else {
                now_read = 1;
                for m in (mail) {
                    if (m == (| ((.subscribed())[list])[2] |))
                        break;
                    else
                        now_read++;
                }
            }
            if ((now_read + rows) > end)
                start = end - rows;
            else if (now_read > (rows / 2))
                start = now_read - (rows / 2);
            else
                start = 1;
            end = (start + rows) - 1;
            mail = sublist(mail, start, rows);
        } else {
            start = 1;
        }
        rng = (start + "-") + end;
    } else {
        catch ~range
            mail = $mail_lib.range_to_actual($parse_lib.range(rng), current);
        with
            return (traceback()[1])[2];
    }
    if (!mail)
        return "No mail on " + (list.mail_name());
    len = (.linelen()) - 36;
    out = [((("Mail from " + rng) + " on ") + (list.mail_name())) + ":"];
    lmail = list.mail();
    o = [];
    for m in (mail) {
        if (!valid(m)) {
            list.notify_bad_mail(m);
        } else {
            from = $object_lib.get_name(m.from(), 'name);
            if ((args = regexp(from, "<([^>]+)>")))
                from = explode(args[1], "@")[1];
            subj = m.subject();
            subj = strsed(subj, "^\[[^]]+\] *", "");
            o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag((m == (| (subscribed[list])[2] |)) ? "=>" : " "), $cml_lib.format_td_tag(m in lmail), $cml_lib.format_td_tag((m.has_read(this())) ? " " : "!"), $cml_lib.format_td_tag(subj), $cml_lib.format_td_tag(from), $cml_lib.format_td_tag(m.lines()), $cml_lib.format_td_tag($time.format("%d-%h-%Y", m.time())))];
        }
    }
    return $ctext_frob.new_with((out + [$cml_lib.format_table_tag("5%,5%,2%,50%,17%,5%,15%", o)]) + [$cml_lib.format_sep_tag()]);
};

protected method .mail_read_cmd() {
    arg cmdstr, cmd, str;
    var mail, m, args, opts, lname, list, rng, args, meta;
    
    (> .perms(caller(), 'command) <);
    [args, opts] = (> $parse_lib.opt(str, "m?eta") <);
    str = args.join(" ");
    meta = [];
    if ((m = "m?eta" in (opts.slice(1)))) {
        if ((opts[m])[3])
            meta = [1];
    }
    if ((args = match_template(str, "* on *"))) {
        rng = args[1];
        catch ~listnf, ~ambig {
            list = (> $mail_lib.match_mail_recipient(args[3]) <);
        } with {
            if (error() == ~listnf) {
                return (traceback()[1])[2];
            } else {
                // error == ~ambig
                return ((("The list '" + (args[3])) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
            }
        }
    } else {
        rng = str;
        list = current['list];
    }
    catch ~perm
        (> .new_list(list) <);
    with
        return (traceback()[1])[2];
    if (((list.mail()).length()) == 0)
        return ("There is no mail on " + (list.mail_name())) + ".";
    if (!rng)
        return ("You must specify a message to read on " + (list.mail_name())) + ".";
    catch ~range {
        if (rng == "next") {
            .read_mail((> list.mail_list_next((subscribed[list])[2]) <), list, @meta);
        } else if (rng == "prev") {
            .read_mail((> list.mail_list_prev((subscribed[list])[2]) <), list, @meta);
        } else {
            for m in ($mail_lib.range_to_actual($parse_lib.range(rng), current))
                .read_mail(m, list, @meta);
        }
    } with {
        return ((("Mail message " + rng) + " does not exist on ") + (list.mail_name())) + ".";
    }
};

protected method .mail_remove_cmd() {
    arg cmdstr, cmd, str;
    var mail, args, lmail, list, rng, m, x, name, lname, offset, ans;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template(str, "* on|from *"))) {
        rng = args[1];
        list = args[3];
    } else if (!str) {
        return "You must specify a message and list.";
    } else {
        // grr, be hacky
        args = explode(str);
        if ((args.length()) > 1) {
            list = args.last();
            if (!(| $mail_lib.match_mail_recipient(list) |)) {
                rng = str;
                list = "";
            } else {
                rng = (args.delete(args.length())).join();
            }
        } else {
            rng = str;
            list = "";
        }
    }
    if (!rng)
        return ("You must specify a message to remove from " + lname) + ".";
    if (!list) {
        list = current['list];
        ans = (> .prompt(((("Remove mail " + rng) + " from ") + (list.mail_name())) + "?  ") <);
        if (match_regexp(ans, "no|n"))
            return "Ok, aborting..";
    } else {
        catch ~listnf, ~ambig {
            list = (> $mail_lib.match_mail_recipient(list) <);
        } with {
            if (error() == ~listnf)
                return (traceback()[1])[2];
            else
                return ((("The list '" + list) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
        }
    }
    lname = list.mail_name();
    catch any
        (> .new_list(list) <);
    with
        return (traceback()[1])[2];
    if (rng == "$") {
        mail = (> $mail_lib.range_to_actual(['end, 'single], current) <);
    } else if (rng && ((rng[1]) == "$")) {
        catch ~namenf
            mail = [(> $object_lib.to_dbref(rng) <)];
        with
            return (traceback()[1])[2];
    } else {
        catch ~range
            mail = (> $mail_lib.range_to_actual($parse_lib.range(rng), current) <);
        with
            return (traceback()[1])[2];
    }
    lmail = list.mail();
    if ((mail[1]) != (| lmail[1] |)) {
        offset = (mail[1]) in lmail;
        lmail = sublist(lmail, offset);
        offset--;
    }
    for m in (mail) {
        catch ~perm {
            x = (m in lmail) + offset;
            name = ((((("#" + x) + " \"") + (m.subject())) + "\" (") + m) + ")";
            list.del_mail(m);
            .tell(((("Removed message " + name) + " from ") + (list.mail_name())) + ".");
        } with {
            .tell((traceback()[1])[2]);
        }
    }
};

protected method .new_list() {
    arg list;
    
    // check here so we can assume later that this error will not bite us
    if (!(list.list_is_readable_by(this())))
        throw(~perm, "You cannot read mail on " + (list.mail_name()));
    
    // set the current list
    if (list != (current['list]))
        current = current.add('list, list);
};

protected method .next_new_cmd() {
    arg cmdstr, cmd, str;
    var mail, list, keys, start;
    
    (> .perms(caller(), 'command) <);
    str = strsed(str, "^ *on +", "");
    if (str) {
        catch any {
            list = (> $mail_lib.match_mail_recipient(str) <);
        } with {
            if (error() == ~ambig)
                return ((("The list '" + str) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
            else
                return (traceback()[1])[2];
        }
        .new_list(list);
        mail = (| list.mail_list_next((subscribed[list])[2]) |);
        while (mail && (mail.has_read(this()))) {
            refresh();
            mail = (| list.mail_list_next(mail) |);
        }
        if (!mail)
            return ("No new mail on " + ($mail_lib.mail_name(list))) + ".";
        .read_mail(mail, list);
    } else {
        keys = dict_keys(subscribed);
        if (!keys)
            return "You are not subscribed to any lists.";
        if (!((current['list]) in keys))
            current = current.add('list, keys[1]);
        start = (list = current['list]);
        while (1) {
            // anything left on this list?
            mail = (| list.mail_list_next((subscribed[list])[2]) |);
            while (mail && (mail.has_read(this()))) {
                refresh();
                mail = (| list.mail_list_next(mail) |);
            }
            if (mail)
                break;
    
            // pick a new list
            catch any
                list = (> keys[(list in keys) + 1] <);
            with
                list = (| keys[1] |);
    
            // die?
            if ((!list) || (list == start))
                return "No new mail.";
        }
        .new_list(list);
        .read_mail(mail, list);
    }
};

public method .old_mail_lists_cmd() {
    arg @args;
    var l, line;
    
    if (caller() != $mail_ui)
        (> .perms(caller(), 'command) <);
    for l in (($mail_db.database()).values()) {
        line = "";
        if (l.list_is_readable_by(this()))
            line = "[Readable]";
        if (l.list_is_sendable_by(this()))
            line = ("[Sendable]" + (line ? " " : "")) + line;
        .tell((((l.mail_name()).pad(((.linelen()) - (line.length())) - 1)) + " ") + line);
    }
};

public method .old_mail_on_cmd() {
    arg cmdstr, cmd, str;
    var args, lmail, mail, rng, start, end, line, list, len, out, m, rows;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template(str, "* on *"))) {
        rng = args[1];
        list = args[3];
    } else if (match_template(str, "* to *")) {
        return (> .send_to_cmd(cmdstr, cmd, str) <);
    } else {
        rng = "";
        list = str;
    }
    if (!list) {
        list = current['list];
    } else {
        catch ~listnf, ~perm {
            list = (> $mail_lib.match_mail_recipient(list) <);
            (> .new_list(list) <);
        } with {
            return (traceback()[1])[2];
        }
    }
    if (!rng) {
        mail = list.mail();
        end = mail.length();
    
        // minus two for the head and tail
        rows = (.get_rows()) - 2;
        if (end > rows) {
            start = end - rows;
            mail = sublist(mail, start);
        } else {
            start = 1;
        }
        rng = (start + "-") + end;
    } else {
        catch ~range
            mail = $mail_lib.range_to_actual($parse_lib.range(rng), current);
        with
            return (traceback()[1])[2];
    }
    if (!mail)
        return "No mail on " + (list.mail_name());
    len = (.linelen()) - 36;
    out = [((("Mail from " + rng) + " on ") + (list.mail_name())) + ":"];
    lmail = list.mail();
    for m in (mail) {
        if (!valid(m))
            list.notify_bad_mail(m);
        else
            out += [strfmt("%s%3r:%s%*L %12L%5l%11l", (m == (| (subscribed[list])[2] |)) ? "=>" : "  ", m in lmail, (m.has_read(this())) ? " " : "!", len, m.subject(), $object_lib.get_name(m.from(), 'name), m.lines(), $time.format("%d-%h-%Y", m.time()))];
    }
    .tell(out + ["------"]);
};

public method .old_read_mail() {
    arg mail, list;
    var loc;
    
    loc = mail in (list.mail());
    .tell(strfmt("Message %l (%l) on %s:", loc, mail.name(), list.mail_name()));
    .tell(mail.format());
    mail.did_read();
    subscribed = subscribed.add(list, [time(), mail]);
};

protected method .parse_mail_recipient_list() {
    arg str;
    var recip, lists;
    
    lists = [];
    for recip in (str.explode_english_list()) {
        catch ~listnf, ~ambig {
            recip = (> $mail_lib.match_mail_recipient(recip) <);
            if (recip.list_is_sendable_by(this()))
                lists += [recip];
            else
                .tell("You cannot send to " + (recip.mail_name()));
        } with {
            if (error() == ~listnf)
                .tell(("The recipient \"" + recip) + "\" is invalid.");
            else
                .tell(((("The list '" + recip) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".");
        }
    }
    return lists;
};

protected method .read_mail() {
    arg mail, list, @metainfo;
    var loc, out;
    
    loc = mail in (list.mail());
    out = $ctext_frob.new_with([strfmt("Message %l (%l) on %s:", loc, mail.name(), list.mail_name())]);
    .tell(out.append(mail.format(@metainfo)));
    mail.did_read();
    if (subscribed.contains(list))
        subscribed = subscribed.add(list, [time(), mail]);
};

protected method .reply_cmd() {
    arg cmdstr, cmd, str;
    var list, msg, args, i, subj, text, recip;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template(str, "to *")))
        str = args[2];
    if ((args = match_template(str, "* on *")))
        [msg, str, list] = args;
    else
        msg = str;
    if (!list) {
        list = current['list];
    } else {
        catch ~listnf, ~perm, ~ambig {
            list = (> $mail_lib.match_mail_recipient(list) <);
            (> .new_list(list) <);
        } with {
            if (error() == ~ambig)
                return ((("The list '" + list) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
            else
                return (traceback()[1])[2];
        }
    }
    if (!msg) {
        if (!valid((msg = (| (subscribed[list])[2] |))))
            return "No current message to reply to.";
    } else {
        catch ~range
            msg = $mail_lib.range_to_actual($parse_lib.range(msg), current);
        with
            return (traceback()[1])[2];
        msg = msg[1];
    }
    i = msg in (list.mail());
    if (list.is($user))
        recip = msg.from();
    else
        recip = list;
    if (!(recip.is($mail_list)))
        return (list.namef('ref)) + " is not a valid mail recipient.";
    .tell(((("Replying to message " + i) + " on ") + (list.mail_name())) + ".");
    text = msg.body();
    if (text == ["", "(no message)", ""])
        text = [];
    text = $mail_lib.indent_reply(text);
    text = [((("On " + ($time.format("%d-%b-%Y", msg.time()))) + " ") + ((msg.from()).namef('ref))) + " said: "] + text;
    if (.active_editor()) {
        .tell("Storing active editor..");
        .store_editor();
    }
    subj = msg.subject();
    if (!(subj.match_begin("Re:")))
        subj = "Re: " + subj;
    (> .invoke_editor(this(), '_edit_mail_callback, text, ['mail, [recip], subj, i, msg]) <);
    if (.active_editor()) {
        .tell(("Editor invoked with " + ((.active_editor()).session_name())) + ".");
        .tell("Type 'help' for available commands.");
    }
};

protected method .send_to_cmd() {
    arg cmdstr, cmd, str;
    var subj, lists, note, list, x, mail, text, args, edit;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template((str[1]).join(" "), "* to *"))) {
        note = args[1];
        args = args[3];
    } else {
        note = "";
        args = (str[1]).join(" ");
    }
    if (args) {
        if (!(lists = .parse_mail_recipient_list(args)))
            return "No (valid) lists specified.";
    } else {
        lists = [current['list]];
        .tell(("No recipient specified, using current recipient (" + ((lists[1]).mail_name())) + ")");
    }
    edit = "e?dit" in ((str[2]).slice(1));
    edit = edit ? (((str[2])[edit])[3]) : (.get_setting("@send-editor", $mail_ui));
    
    // get the text of the message
    if ((!note) && edit) {
        if (.active_editor()) {
            .tell("Storing active editor..");
            .store_editor();
        }
        subj = "";
        text = [];
        (> .invoke_editor(this(), '_edit_mail_callback, text, ['mail, lists, subj, 0, 0]) <);
        if (.active_editor()) {
            .tell(("Editor invoked with " + ((.active_editor()).session_name())) + ".");
            .tell("Type 'help' for available commands.");
        }
    } else {
        if (note) {
            text = (> (.match_env_nice(note)).get_raw_text() <);
        } else {
            text = .read("-- Enter text for mail message, \".\" when done or \"@abort\" to abort --");
            if (text == 'aborted)
                return;
            if (text == 'engaged)
                return "** Already reading - mail send aborted **";
        }
        subj = (> .prompt("Subject: ") <);
        mail = $mail_message.new_mail();
        mail.set_subject(subj);
        mail.set_text(text);
        catch any
            mail.send(@lists);
        with
            return (traceback()[1])[2];
        return "Mail sent.";
    }
};

protected method .subscribe() {
    arg list;
    
    if (!subscribed)
        subscribed = #[];
    subscribed = subscribed.add(list, [time(), 0]);
    (| list.add_sender_to_notification() |);
};

protected method .subscribe_cmd() {
    arg cmdstr, cmd, str;
    var list, mname, l, args, line, len, out;
    
    (> .perms(caller(), 'command) <);
    
    // this is ugly bad bad
    args = (> $parse_lib.opt(str, "n?ew") <);
    if (!(args[1])) {
        if ("n?ew" in ((args[2]).slice(1))) {
            out = [];
            for l in ((subscribed.keys()).setremove(this())) {
                if ((l.last_received_on()) > ((subscribed[l])[1]))
                    out += ["  " + (l.mail_name())];
            }
            if (out)
                .tell(["New mail on:"] + out);
            else
                .tell(["No new mail on the lists you are subscribed to."]);
            return;
        }
        .tell("Currently Subscribed Lists:");
        len = (.linelen()) / 3;
        for l in ((subscribed.keys()).setremove(this())) {
            if (!valid(l)) {
                subscribed = dict_del(subscribed, l);
            } else {
                line = "  " + (l.mail_name());
                if ((l.last_received_on()) > ((subscribed[l])[1]))
                    line += " (new mail)";
                .tell(line);
            }
        }
        .tell("---");
        return;
    }
    catch ~listnf, ~ambig {
        list = $mail_lib.match_mail_recipient(str);
    } with {
        if (error() == ~listnf)
            return (traceback()[1])[2];
        else
            return ((("The list '" + str) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
    }
    mname = $mail_lib.mail_name(list);
    if (list in (subscribed.keys()))
        return .tell(("You are already subscribed to " + mname) + ".");
    if (!(list.list_is_readable_by(this())))
        return .tell(mname + " is not subscribeable by you.");
    .subscribe(list);
    .tell(("Successfully subscribed to " + mname) + ".");
};

protected method .subscribed() {
    return subscribed;
};

root method .uninit_mail_ui() {
    var l;
    
    for l in ((subscribed || #[]).keys())
        (| .unsubscribe(l) |);
};

protected method .unsubscribe() {
    arg list;
    
    subscribed = subscribed.del(list);
    (| list.del_sender_from_notification() |);
};

protected method .unsubscribe_cmd() {
    arg cmdstr, cmd, str;
    var list, line, mname;
    
    (> .perms(caller(), 'command) <);
    if (!str)
        return .mail_lists_cmd();
    catch ~listnf, ~ambig {
        list = (> $mail_lib.match_mail_recipient(str) <);
    } with {
        if (error() == ~listnf)
            return (traceback()[1])[2];
        else
            return ((("The list '" + str) + "' could match ") + ((((traceback()[1])[3]).mmap('mail_name)).to_english("nothing", " or "))) + ".";
    }
    if (list == this())
        return "You cannot unsubscribe yourself.";
    mname = list.mail_name();
    if (!(list in (subscribed.keys())))
        return "You are not subscribed to " + mname;
    .unsubscribe(list);
    return ("Successfully unsubscribed from " + mname) + ".";
};


