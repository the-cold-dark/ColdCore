
new object $user: $body, $mail_ui, $command_aliases, $bad_commands, $help_ui, $editor_reference, $channel_ui, $user_info, $menu, $www_preferences;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $described prose = [];
var $has_commands local = \
  #[["@quit", [["@quit", "", "@quit", 'quit_cmd, #[]]]], ["i?nventory", [["i?nventory", "", "i?nventory", 'inventory_cmd, #[]]]], ["@audit", [["@audit", "*", "@audit <any>", 'audit_cmd, #[[1, ['any, []]]]]]],\
  ["@who",\
    [["@who", "*", "@who <any>", 'who_cmd, #[[1, ['any, []]]]]]],\
  ["@del-command-a?lias|@dca?lias",\
    [["@del-command-a?lias|@dca?lias", "*", "@del-command-a?lias|@dca?lias <any>", 'del_command_alias_cmd, #[[1, ['any, []]]]]]],\
  ["@command-a?liases|@ca?liases",\
    [["@command-a?liases|@ca?liases", "*", "@command-a?liases|@ca?liases <any>", 'command_aliases_cmd, #[[1, ['any, []]]]]]],\
  ["@add-command-a?lias|@aca?lias",\
    [["@add-command-a?lias|@aca?lias", "*", "@add-command-a?lias|@aca?lias <any>", 'add_command_alias_cmd, #[[1, ['any, []]]]]]],\
  ["@com?mands",\
    [["@com?mands", "*", "@com?mands <any>", 'commands_cmd, #[[1, ['any, []]]]]]],\
  ["@news",\
    [["@news", "", "@news", 'news_cmd, #[]]]], ["@forget", [["@forget", "*", "@forget <any>", 'forget_cmd, #[[1, ['any, []]]]]]],\
  ["@whereis|@where-is",\
    [["@whereis|@where-is", "*", "@whereis|@where-is <any>", 'whereis_cmd, #[[1, ['any, []]]]]]],\
  ["@password|@passwd",\
    [["@password|@passwd", "*", "@password|@passwd <any>", 'password_cmd, #[[1, ['any, []]]]]]],\
  ["@age",\
    [["@age", "*", "@age <object>", 'age_cmd, #[[1, ['object, []]]]]]],\
  ["@context",\
    [["@context", "", "@context", 'context_cmd, #[]]]], ["@rename", [["@rename", "*", "@rename <any>", 'rename_cmd, #[[1, ['any, []]]]]]],\
  ["@add-writer|@aw",\
    [["@add-writer|@aw", "*", "@add-writer|@aw <any>", 'add_writer_cmd, #[[1, ['any, []]]]]]],\
  ["@del-writer|@dw",\
    [["@del-writer|@dw", "*", "@del-writer|@dw <any>", 'del_writer_cmd, #[[1, ['any, []]]]]]],\
  ["@manage?d",\
    [["@manage?d", "*", "@manage?d <any>", 'managed_cmd, #[[1, ['any, []]]]]]],\
  ["@remember",\
    [["@remember", "* as *", "@remember <object> as <any>", 'remember_cmd, #[[1, ['object, []]], [3, ['any, []]]]]]],\
  ["@remembered",\
    [["@remembered", "*", "@remembered <any>", 'remembered_cmd, #[[1, ['any, []]]]]]],\
  ["discard",\
    [["discard", "*", "discard <object>", 'discard_cmd, #[[1, ['object, []]]]]]],\
  ["@writes",\
    [["@writes", "*", "@writes <object>", 'writes_cmd, #[[1, ['object, []]]]]]],\
  ["@trusted?-by",\
    [["@trusted?-by", "*", "@trusted?-by <object>", 'trusted_by_cmd, #[[1, ['object, []]]]]]],\
  ["@del-trust?ee|@dt",\
    [["@del-trust?ee|@dt", "*", "@del-trust?ee|@dt <object:>", 'del_trustee_cmd, #[[1, ['object_opt, []]]]]]],\
  ["@monitor",\
    [["@monitor", "*", "@monitor <any>", 'monitor_cmd, #[[1, ['any, []]]]]]],\
  ["@ex?amine",\
    [["@ex?amine", "*", "@ex?amine <object:+c?hop>", 'examine_cmd, #[[1, ['object_opt, ["c?hop"]]]]]]],\
  ["@map",\
    [["@map", "", "@map", 'map_cmd, #[]]]], ["@finger|@ustat", [["@finger|@ustat", "*", "@finger|@ustat <user>", 'finger_cmd, #[[1, ['user, []]]]]]],\
  ["@trusts|@trustee?s",\
    [["@trusts|@trustee?s", "*", "@trusts|@trustee?s <object>", 'trusts_cmd, #[[1, ['object, []]]]]]],\
  ["@writers",\
    [["@writers", "*", "@writers <object>", 'writers_cmd, #[[1, ['object, []]]]]]],\
  ["@manager",\
    [["@manager", "*", "@manager <object>", 'manager_cmd, #[[1, ['object, []]]]]]],\
  ["@desc?ribe|@prose",\
    [["@desc?ribe|@prose", "*", "@desc?ribe|@prose <any>", 'description_cmd, #[[1, ['any, []]]]]]],\
  ["l?ook|exam?ine",\
    [["l?ook|exam?ine", "*", "l?ook|exam?ine <any>", 'look_cmd, #[[1, ['any, []]]]]]],\
  ["walk|go",\
    [["walk|go", "*", "walk|go <any>", 'go_cmd, #[[1, ['any, []]]]]]],\
  ["@ant|@add-name-template",\
    [["@ant|@add-name-template", "*", "@ant|@add-name-template <any>", 'add_name_template_cmd, #[[1, ['any, []]]]]]],\
  ["@dnt|@del-name-template",\
    [["@dnt|@del-name-template", "*", "@dnt|@del-name-template <any>", 'del_name_template_cmd, #[[1, ['any, []]]]]]],\
  ["@name-template?s|@template?s",\
    [["@name-template?s|@template?s", "*", "@name-template?s|@template?s <object>", 'name_templates_cmd, #[[1, ['object, []]]]]]],\
  ["@register|@register-name",\
    [["@register|@register-name", "*", "@register|@register-name <any>", 'register_name_cmd, #[[1, ['any, []]]]]]],\
  ["@unregister|@unregister-name",\
    [["@unregister|@unregister-name", "*", "@unregister|@unregister-name <any>", 'unregister_name_cmd, #[[1, ['any, []]]]]]],\
  ["@registered",\
    [["@registered", "", "@registered", 'registered_cmd, #[]]]], ["@page", [["@page", "* with *", "@page <any> with <any>", 'remote_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["@paste?-to",\
    [["@paste?-to", "*", "@paste?-to <any>", 'paste_cmd, #[[1, ['any, []]]]]]],\
  ["@new",\
    [["@new", "*", "@new <any>", 'new_cmd, #[[1, ['any, []]]]]]],\
  ["@status|@uptime",\
    [["@status|@uptime", "*", "@status|@uptime <any>", 'status_cmd, #[[1, ['any, []]]]]]],\
  ["@msg?s|@message?s",\
    [["@msg?s|@message?s", "*", "@msg?s|@message?s <any>", 'msg_cmd, #[[1, ['any, []]]]]]],\
  ["@date|@time",\
    [["@date|@time", "*", "@date|@time <any>", 'date_cmd, #[[1, ['any, []]]]]]],\
  ["@set",\
    [["@set", "*", "@set <any>", 'set_cmd, #[[1, ['any, []]]]]]],\
  ["PUEBLOCLIENT",\
    [["PUEBLOCLIENT", "*", "PUEBLOCLIENT <any>", 'pueblo_cmd, #[[1, ['any, []]]]]]],\
  ["@ways|@exits",\
    [["@ways|@exits", "*", "@ways|@exits <any>", 'ways_cmd, #[[1, ['any, []]]]]]],\
  ["@tut?orial",\
    [["@tut?orial", "*", "@tut?orial <any>", 'tutorial_cmd, #[[1, ['any, []]]]]]],\
  ["null",\
    [["null", "*", "null <any>", 'null_cmd, #[[1, ['any, []]]]]]],\
  ["@away",\
    [["@away", "*", "@away <any>", 'away_cmd, #[[1, ['any, []]]]]]],\
  ["@back",\
    [["@back", "", "@back", 'back_cmd, #[]]]], ["@add-trust?ee|@at", [["@add-trust?ee|@at", "*", "@add-trust?ee|@at <object:>", 'add_trustee_cmd, #[[1, ['object_opt, []]]]]]],\
  ["@player-breakdown|@pb|@user-breakdown|@ub",\
    [["@player-breakdown|@pb|@user-breakdown|@ub", "", "@player-breakdown|@pb|@user-breakdown|@ub", 'player_breakdown_cmd, #[]]]]];
var $has_commands shortcuts = #[["--*", ['remote_cmd, ["@page ", "", " with ", 1]]], ["-* *", ['remote_cmd, ["@page ", 1, " with ", 2]]], ["/*", ['null_cmd, ["null ", 1]]]];
var $has_name name = ['prop, "Generic User Object", "Generic User Object"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$user];
var $mail_list readers = [];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $user]];
var $mail_ui subscribed = #[[$user, [791485891, 0]]];
var $root created_on = 796268969;
var $root defined_settings = #[["experienced", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["global-tell", #[['get, ['get_global_tell]], ['set, ['set_global_tell]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["cols", #[['get, ['get_cols]], ['set, ['set_cols]], ['parse, ['is_type, 'integer]]]], ["rows", #[['get, ['get_rows]], ['set, ['set_rows]], ['parse, ['is_type, 'integer]]]], ["prompt", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["auto-look", #[['get, ['get_auto_look]], ['set, ['set_auto_look]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["content-type", #[['set, ['set_content_type]], ['parse, ['parse_content_type]], ['format, ['format_content_type]], ['clear, ['clear_content_type]], ['get, ['get_content_type]]]], ["extended-parsers", #[['parse, ['parse_ext_parsers]], ['format, ['format_ext_parsers]]]], ["exit-style", #[['parse, ['parse_exit_style]]]], ["title", #[['get, ['title]], ['set, ['set_title]]]], ["@who-options", #[]], ["away", #[['get, ['get_away]], ['set, ['set_away]], ['clear, ['clear_away]]]]];
var $root flags = ['methods, 'core, 'code, 'variables, 'general_cache];
var $root inited = 1;
var $root managed = [$user];
var $root manager = $user;
var $root quota = 76800;
var $root settings = #[["experienced", 0], ["exit-style", 'brief], ["home", $body_cave], ["prompt", 0], ["extended-parsers", []], ["@who-options", ""]];
var $root trusted_by = [$user_db];
var $thing gender = $gender_neuter;
var $user action = "";
var $user activity = 0;
var $user auto_look = 0;
var $user away = 0;
var $user away_time = 0;
var $user cols = 0;
var $user connected_at = 0;
var $user connected_seconds = 0;
var $user connection_options = 0;
var $user connections = [];
var $user content_type = 'plain;
var $user context = 0;
var $user evaluator = 0;
var $user ext_parsers = 0;
var $user failed = 0;
var $user formatter = $plain_format;
var $user global_tell = 0;
var $user last_command_at = 0;
var $user monitor = 0;
var $user parsers = [$command_parser, $channel_parser];
var $user password = "*";
var $user reap_notified = 0;
var $user registered = 0;
var $user remembered = 0;
var $user rows = 0;
var $user task_connections = #[];
var $user title = 0;

public method ._edit_mail_callback() {
    arg text, cdata;
    var list, subj, err, mail, nosend, sent;
    
    // not necessarily safe perm checks
    (> .perms(caller(), $editor_session, $editor_reference) <);
    list = cdata[2];
    subj = cdata[3];
    if (!subj)
        subj = (> .prompt("Subject: ") <);
    mail = $mail_message.new_mail();
    mail.set_subject(subj);
    mail.set_text(text);
    catch any
        nosend = mail.send(@list);
    with
        return ['failed, [(traceback()[1])[2]]];
    if (nosend) {
        sent = list.set_difference(nosend);
        if (sent)
            err = ["Mail sent to " + (sent.map_to_english('mail_name))];
        else
            err = [];
        nosend = list.set_difference(sent);
        err += ["Mail NOT sent to " + (nosend.map_to_english('mail_name))];
        return ['failure, err];
    }
    return ['success, ["Mail sent to " + (list.map_to_english('mail_name))]];
};

protected method ._exam_sub() {
    arg name, plural, cmd, chop, obj, meth, @args;
    var list, line;
    
    list = (| obj.(meth)(@args) |) || [];
    if (!plural)
        line = pad(((name + " (") + cmd) + "):", 21) + (list.to_english("(none)"));
    else if (listlen(list) != 1)
        line = pad(((name + "s (") + cmd) + "):", 21) + (list.to_english("(none)"));
    else
        line = pad(((name + " (") + cmd) + "):", 21) + ((list[1]).namef('ref));
    if (chop)
        line = line.chop(chop);
    return line;
};

public method ._list_objects() {
    arg objs, multi, @args;
    var line, obj, c2, name, fmt, out, c1;
    
    if (!objs) {
        out = ["** None **"];
    } else {
        c2 = ((| sender().linelen() |) || 79) / 10;
        c1 = c2 * 4;
        fmt = "%5L%*L %*L %*L";
        out = [strfmt(fmt, "#", c1, "Name", c2, "Flags", c2, "Size") + "Manager"];
        for obj in (objs) {
            line = strfmt(fmt, obj.(multi)(@args).length(), c1, obj.namef('xref), c2, $object_lib.see_perms(obj, ["", ""]), c2, obj.size());
            name = (obj.manager()).namef('xref);
            if ((name.length()) > c1)
                name = name.pad(c1);
            out += [line + name];
        }
    }
    return out;
};

public method ._reap__notified() {
    return reap_notified;
};

protected method ._tell() {
    arg what, @args;
    var line, conn, type, f;
    
    switch (type(what)) {
        case 'frob:
            what = $parse_lib.filter_ctext(what, #[['formatter, formatter], ["viewer", this()]]);
        case 'string:
            if (!(args && ((args[1]).contains('nomod)))) {
                if (content_type == 'html)
                    what = (((what.replace("&", "&amp;")).replace("<", "&lt;")).replace(">", "&gt;")) + "<br>";
                else if (content_type == 'tkmoo)
                    what = (what.replace("}", "\}")).replace("{", "\{");
    
                //           if (content_type == 'wrapped) {
                //              what = strsub(what, "\\", "\\\\");
                //              what = str_to_buf(what.wrap_line(.linelen(), " ") + "\n");
                //          }
            }
        case 'list:
            for line in (what)
                ._tell(line, @args);
            return;
        case 'buffer:
            throw(~nobuf, "You are not allowed to send buffers.");
    }
    conn = (| .task_connection() |);
    if (conn && (!global_tell)) {
        conn.write(what);
    } else {
        for conn in (connections)
            (| conn.write(what) |);
    }
};

public method ._tmp_wwmmmww() {
    $world.hook_into_event('realm_announce);
};

protected method ._who__admins() {
    arg args, all;
    var out, admins, a, x, t;
    
    admins = [];
    if (args && (!all)) {
        for a in (args) {
            x = $user_db.search(a);
            if (!x)
                .tell(("I don't know who \"" + a) + "\" is.");
            else
                admins += [x];
        }
        t = (("Admin" + (admins.length())) == 1) ? "" : "s";
    } else if (all) {
        t = "All Admins";
        admins = $sys.admins();
    } else {
        t = "Connected Admins";
        for a in ($user_db.connected()) {
            if (a.has_ancestor($admin))
                admins += [a];
        }
    }
    if (!admins)
        return 0;
    return [admins, t];
};

protected method ._who__at_place() {
    arg str;
    var place, thing, who, args;
    
    if (str == "home")
        place = .home();
    else
        place = (| .match_environment(str) |);
    
    // try the place db
    if (!place) {
        catch any {
            place = $place_db.search(str);
        } with {
            switch (error()) {
                case ~ambig:
                    .tell("Several places match that name: " + ((((traceback()[1])[3]).mmap('namef)).to_english()));
                case ~namenf:
                    .tell(("The place \"" + str) + "\" cannot be located.");
                    return 0;
                default:
                    .tell((traceback()[1])[2]);
                    return 0;
            }
        }
    }
    who = [];
    for thing in (place.contents()) {
        if (thing.has_ancestor($user))
            who += [thing];
    }
    if (!who) {
        .tell(("Nobody is in " + (place.name())) + ".");
        return 0;
    }
    args = [who, "Users in " + (place.name())];
    args = [@args, [['namef, 'titled], ['idle_time]]];
    args = [@args, ["Name", "Times (idle)"], [1, 1]];
    return args;
};

protected method ._who__is() {
    arg people, @args;
    var person, p, who, x;
    
    who = [];
    if (type(people) == 'string)
        people = ($string.explode_english_list(people, @args)) || [];
    for p in (people) {
        catch any {
            person = $user_db.search(p);
        } with {
            switch (error()) {
                case ~ambig:
                    .tell(((("The name \"" + p) + "\" can match any of: ") + ($list.to_english(filter x in ($user_db.users()) where (x.match_begin(p))))) + ".");
                    continue;
                default:
                    // hack, look for robots..
                    catch any {
                        person = ($robot.children()).match_object(p);
                    } with {
                        .tell(("I don't know who \"" + p) + "\" is.");
                        continue;
                    }
            }
        }
        who += [person];
    }
    if (!who)
        return 0;
    return [who, ((who.length()) == 1) ? "User" : "Users"];
};

protected method ._who__programmers() {
    arg args, all;
    var out, progs, p, x, t;
    
    progs = [];
    if (args && (!all)) {
        for p in (args) {
            x = $user_db.search(p);
            if (!x)
                .tell(("I don't know who \"" + p) + "\" is.");
            else
                progs += [x];
        }
        t = (("Programmer" + (progs.length())) == 1) ? "" : "s";
    } else if (all) {
        t = "All Programmers";
        progs = $programmer.descendants();
        progs = progs.setremove($admin);
    } else {
        t = "Connected Programmers";
        for p in ($user_db.connected()) {
            if (p.has_ancestor($programmer))
                progs += [p];
        }
    }
    if (!progs)
        return 0;
    return [progs, t];
};

protected method ._who__short() {
    arg people, title, @rest;
    var user, tmp, who, namestr, total;
    
    who = [];
    total = people.length();
    .tell((((title + " (total: ") + tostr(total)) + ((total == 1) ? " person" : " people")) + "):");
    for user in (people) {
        //     namestr = " " + user.name() + " (" + $time.elapsed(time()
        // - user.connected_at())
        //+ " " + $time.dhms(user.idle_seconds()) + ")";
        namestr = (((((" " + (user.name())) + " (") + ($time.dhms(time() - (user.connected_at())))) + "/") + ($time.dhms(user.idle_seconds()))) + ")";
        who += [namestr];
        if (tmp < ((namestr.length()) + 2))
            tmp = (namestr.length()) + 2;
    }
    .tell($list.vcolumnize(who, (.linelen()) / (tmp + 1), .linelen()));
};

public method .action() {
    // different from activity, returns a more accurate second to second action
    if (.connected())
        return action || "";
    else
        return "(asleep)";
};

public method .activity() {
    arg @noidle;
    var idle, r;
    
    // different from action, returns a broader version of your doings
    if (!(.connected()))
        return "asleep";
    if (activity)
        return activity;
    if (!noidle) {
        idle = .idle_seconds();
        if (idle >= 180) {
            if (idle < 300)
                r = "daydreaming";
            if (idle < 900)
                r = "zoned";
            else
                r = "long gone";
        }
        if (away)
            return ((((r ? (r + ", ") : "") + "away for ") + ($time.dhms(time() - away_time, 1))) + ": ") + away;
    }
    return r;
};

public method .add_command_alias() {
    arg alias, actual;
    
    (> .perms(sender()) <);
    (> pass(alias, actual) <);
    if ((.command_aliases()) && (!($command_aliases_parser in (.parsers())))) {
        .tell("Adding $command_aliases_parser to your list of parsers..");
        .add_parser($command_aliases_parser);
    }
};

protected method .add_command_alias_cmd() {
    arg cmdstr, cmd, input;
    
    (> .perms(caller(), 'command) <);
    input = input.explode_quoted();
    if (listlen(input) == 3)
        input = input.delete(2);
    if (listlen(input) != 2)
        return ("Syntax: `" + cmd) + " \"<alias>\" [to] \"<actual command>\"`";
    catch any
        (> .add_command_alias(@input) <);
    with
        return (traceback()[1])[2];
    return strfmt("New command alias %d => %d added.", @input);
};

protected method .add_name_template_cmd() {
    arg cmdstr, cmd, args;
    var obj, template;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    if ((listlen(args) > 2) && ((args[2]) == "to"))
        args = delete(args, 2);
    if (listlen(args) > 2)
        args = [args[1], sublist(args, 2).join()];
    if ((!args) || (listlen(args) != 2))
        return ("Syntax: `" + cmd) + " \"<template>\" [to] \"<object>\"`";
    obj = (> .match_env_nice(args[2]) <);
    template = args[1];
    if (!(obj.has_ancestor($has_name)))
        return obj + " cannot have regular names.";
    catch any
        obj = (> obj.add_name_template(template) <);
    with
        return (traceback()[1])[2];
    return ((((("Added name template \"" + template) + "\" to ") + (obj.namef('ref))) + ", templates: ") + ((obj.name_templates()).to_english())) + ".";
};

protected method .add_parser() {
    arg parser, @over_pr;
    var x, pr;
    
    [(pr ?= parser.priority())] = over_pr;
    
    // does it exist?  If so remove it.
    while (parser in parsers)
        parsers = setremove(parsers, parser);
    for x in [1 .. listlen(parsers)] {
        if (((parsers[x]).priority()) > pr) {
            parsers = insert(parsers, x, parser);
            return;
        }
    }
    parsers += [parser];
};

protected method .add_remembered() {
    arg what, name;
    
    remembered = (remembered || #[]).add(name, what);
};

protected method .add_trustee_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, trustee;
    
    (> .perms(caller(), 'command) <);
    trustee = args[1];
    args = args[2];
    if (args && ((args[1]) == "to"))
        args = delete(args, 1);
    args = join(args);
    if (!args)
        throw(~stop, ("Syntax: " + cmd) + " <trustee> to <object>");
    obj = (> .match_env_nice(args) <);
    catch any {
        (> obj.add_trusted(trustee) <);
        return [(("Added trustee " + (trustee.namef('ref))) + " to ") + (obj.namef('ref)), (((obj.namef('ref)) + " now trusts: ") + ((((obj.trusted('literal)).compress()).mmap('namef, 'ref)).to_english("nobody"))) + "."];
    } with {
        return (traceback()[1])[2];
    }
};

protected method .add_writer_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, writer;
    
    (> .perms(caller(), 'command) <);
    args = (args.replace(" to ", " ")).explode();
    if ((!args) || ((args.length()) != 2))
        (> .tell_error(cmd + " <writer> [to] <object>") <);
    writer = (> .match_env_nice(args[1]) <);
    obj = (> .match_env_nice(args[2]) <);
    catch any {
        obj.add_writer(writer);
        return [(("Sucessfully added writer " + (writer.namef('xref))) + " to ") + (obj.namef('xref)), ("New writers list: " + ((((obj.writers('literal)).compress()).mmap('namef, 'xref)).to_english())) + "."];
    } with {
        .tell((traceback()[1])[2]);
    }
};

protected method .age_cmd() {
    arg cmdstr, com, obj;
    var time, gender, out;
    
    (> .perms(caller(), 'command) <);
    time = obj.created_on();
    if (obj.is($thing))
        gender = (obj.gender()).pronoun('psc);
    else
        gender = "It";
    out = [((obj.name()) + " was created on ") + ($time.format("%A %B %d %Y", time)), ((gender + " is ") + ($time.to_english(time() - time))) + " old."];
    if (obj.is($user))
        out += [((gender + " has logged ") + ($time.to_english(obj.connected_seconds()))) + " online."];
    return out;
};

protected method .audit_cmd() {
    arg cmdstr, cmd, args;
    var who, obj, col, str, out, total, line, syntax, loc, size, full, s, o;
    
    (> .perms(caller(), 'command) <);
    o = (> $parse_lib.opt(args, "f?ull") <);
    args = (o[1]).join();
    full = (| "f?ull" in ((o[2]).slice(1)) |);
    if (full)
        full = ((o[2])[full])[3];
    who = (| .match_environment(args) |);
    if (!who) {
        who = (| $user_db.search(args) |);
        if (!who)
            return ("Unable to find \"" + args) + "\".";
    }
    if (full) {
        col = (.linelen()) / 2;
        out = [(((("Objects managed by " + (who.namef('ref))) + ":").pad(col)) + ("bytes".pad(-10))) + " Location"];
        for obj in (who.managed()) {
            if (!valid(obj)) {
                .tell(("  ** invalid object (" + toliteral(obj)) + ") **");
                continue;
            }
            line = ("  " + (obj.namef('xref))).pad(col);
            s = obj.size();
            size = s.to_english();
            line = (line + (size.pad(-(((size.length()) > 10) ? (size.length()) : 10)))) + " ";
            loc = (obj.has_ancestor($located)) ? (("[" + ((obj.location()).name())) + "]") : "";
            out += [(line + loc).pad(.linelen())];
            total += s;
        }
    } else {
        if ((who != this()) && (!(.is($admin))))
            return "Only admins can get quota usage information from other users.";
        out = [("Quota information on " + (who.namef('ref))) + ":"];
        for obj in (who.managed()) {
            if (valid(obj))
                total += obj.size();
        }
    }
    if ((who == this()) || (.is($admin))) {
        out += [("Total usage: " + ($integer.to_english(total))) + " bytes"];
        size = who.get_quota();
        line = ("Total quota: " + ($integer.to_english(size))) + " bytes";
        out += [line, ("Remaining:   " + ($integer.to_english(size - total))) + " bytes"];
    }
    if (!(who.quota_valid())) {
        if (who == this())
            out += ["*** You are over quota! ***"];
        else
            out += [("*** " + (who.name())) + " is over quota! ***"];
    }
    if (who.quota_exempt()) {
        if (who == this())
            out += ["*** You are exempt from quota! ***"];
        else
            out += [("*** " + (who.name())) + " is exempt from quota! ***"];
    }
    return out;
};

protected method .away() {
    return away;
};

public method .away_cmd() {
    arg cmdstr, cmd, msg;
    
    (> .perms('command, caller()) <);
    if (msg) {
        away = msg;
        away_time = time();
        return "You are now marked as being away.";
    } else if (away) {
        return "You are marked as being away.  Message: " + away;
    } else {
        return "You are not marked as being away.";
    }
};

public method .away_time() {
    return away_time;
};

public method .back_cmd() {
    arg cmdstr, cmd;
    
    (> .perms('command, caller()) <);
    if (away) {
        clear_var('away);
        return "You are no longer marked as being away.";
    } else {
        return "You are not marked as being away.";
    }
};

public method .check_password() {
    arg str, @cinfo;
    var match, warn;
    
    (> .perms(caller(), definer(), $login_interface, $security_lib, $pop3_interface) <);
    
    // no password means always match
    if (!password)
        return 1;
    
    // "*" means never match
    if (password == "*")
        return 0;
    match = match_crypted(password, str);
    
    // keep track of failed attempts, if its from a connection
    if ((!match) && cinfo) {
        if (.connected())
            .tell("<Login> Failed Login Attempt from " + (cinfo[1]));
        else
            failed++;
    }
    
    // update old DES passwords to newer SHA passwords
    if (match && (!match_begin(password, "$2$")))
        password = crypt(str);
    
    // done
    return match;
};

protected method .clear_away() {
    arg name;
    
    clear_var('away);
};

public method .clear_content_type() {
    arg name;
    
    content_type = 'plain;
};

protected method .command_aliases_cmd() {
    arg cmdstr, com, what;
    var aliases, a, line, str, num, out, left, right;
    
    (> .perms(caller(), 'command) <);
    if (!what)
        what = this();
    else
        what = (> .match_env_nice(what) <);
    if ((what != this()) && (!(what.is_writable_by(this()))))
        return ("You are not allowed to read the command aliases on " + (what.namef('ref))) + ".";
    if (!(what.has_ancestor($command_aliases)))
        return "Command aliases are not applicable to " + (what.namef('ref));
    out = [("--- Command aliases on " + (what.namef('ref))) + ":"];
    aliases = what.command_aliases();
    if (aliases) {
        for a in (aliases) {
            str = a[1];
            num = 0;
            while ("*" in str) {
                num++;
                left = str.subrange(1, ("*" in str) - 1);
                right = str.subrange(("*" in str) + 1);
                str = ((left + "%") + tostr(num)) + right;
            }
            out += [strfmt("  %30d => %d", str, $command_lib.format_relation(a[2]))];
        }
    } else {
        out += ["  <none>"];
    }
    return out + ["---"];
};

protected method .commands_cmd() {
    arg cmdstr, cmd, args;
    var s, full, o, opt, lcmds, rcmds, len, obj, shorts, m, c, local, remote, short, all;
    
    (> .perms(caller(), 'command) <);
    s = cmd + " [options] <object>";
    args = (> $parse_lib.opt(args, "f?ull", "a?ll", "l?ocal", "r?emote", "s?hortcuts") <);
    o = args[2];
    local = (remote = (short = 1));
    if ((opt = "f?ull" in (o.slice(1))))
        full = (o[opt])[3];
    if ((opt = "a?ll" in (o.slice(1))))
        all = (o[opt])[3];
    if ((opt = "r?emote" in (o.slice(1))))
        remote = (o[opt])[3];
    if ((opt = "s?hortcuts" in (o.slice(1))))
        short = (o[opt])[3];
    if ((opt = "l?ocal" in (o.slice(1))))
        local = (o[opt])[3];
    args = (args[1]).join();
    if ((!args) && (!all)) {
        (| .tell_error(cmd + " <object> [options]") |);
        return "!  Defaults: -f?ull -a?ll +l?ocal +r?emote +s?hortcuts";
    } else {
        args = args || "me";
        obj = (> .match_env_nice(args) <);
    }
    if (!(obj.has_ancestor($has_commands)))
        return "Sorry, that object has no commands.";
    lcmds = (rcmds = #[]);
    shorts = [];
    if (all) {
        if (local)
            lcmds = obj.all_local_commands();
        if (remote)
            rcmds = obj.all_remote_commands();
        if (short)
            shorts = obj.all_shortcuts();
    } else {
        if (local) {
            c = obj.local_commands();
            if (c)
                lcmds = #[[obj, c]];
        }
        if (remote) {
            c = obj.remote_commands();
            if (c)
                rcmds = #[[obj, c]];
        }
        if (short)
            shorts = (obj.shortcuts()).to_list();
    }
    if (full) {
        m = 'format_commands_long;
        len = ((.linelen()) / 3) * 2;
    } else {
        m = 'format_commands_short;
        len = .linelen();
    }
    o = [];
    if (lcmds)
        o += $command_lib.(m)(lcmds, "Local", len);
    if (rcmds)
        o += $command_lib.(m)(rcmds, "Remote", len);
    if (shorts) {
        o += ["Shortcuts:"];
        if (full)
            m = 'unparse_shortcut_full;
        else
            m = 'unparse_shortcut;
        for c in (shorts)
            o += ["  " + $command_lib.(m)(c)];
    }
    return o || ("No commands defined on " + (obj.namef('ref)));
};

protected method .conn_options() {
    arg conn;
    
    return (| connection_options[conn] |) || [];
};

public method .connected() {
    return connections ? 1 : 0;
};

public method .connected_at() {
    return connected_at;
};

public method .connected_seconds() {
    return connected_seconds;
};

public method .connected_time() {
    arg @args;
    
    [(args ?= 'dhms)] = args;
    if (connected_at < 0)
        return "Last on: " + ctime(abs(connected_at));
    switch (args) {
        case 'dhms:
            return $time.dhms(time() - connected_at, 'long);
        case 'elapsed:
            return $time.elapsed(time() - connected_at);
        case 'seconds:
            return time() - connected_at;
    }
};

public method .connection_going_away() {
    arg addr, port;
    var con, line, opt;
    
    catch any {
        (> .perms(caller(), $connection) <);
        for con in (connections) {
            if (!valid(con))
                connections = connections.setremove(con);
        }
        con = sender() in connections;
        connections = connections.setremove(sender());
        catch any {
            for opt in (connection_options) {
                if (!((opt[1]) in connections))
                    connection_options = connection_options.del(opt[1]);
            }
        }
        if (!connections)
            .logout(sender());
        else
            .logout_connection(sender());
        line = ((((((("DISCONNECT " + tostr(con)) + " (") + ((.parents())[1])) + "): ") + this()) + " <") + addr) + ">";
        (| $sys.log(line) |);
    } with {
        $sys.log($parse_lib.traceback(traceback()));
    }
};

public method .connection_starting() {
    arg addr, port;
    var line, c;
    
    (> .perms(caller(), $connection) <);
    
    // shutoff our connection's timeout
    sender().set_timeout(0);
    
    // cleanup our connections list
    for c in (connections) {
        if (!valid(c))
            connections = setremove(connections, c);
    }
    connections = setadd(connections, sender());
    if ((connections.length()) == 1)
        (| .login(sender()) |);
    else
        (| .login_again(sender()) |);
    line = ("CONNECT " + tostr(sender() in connections)) + " (";
    line = (line + ((.parents())[1])) + "): ";
    line = (((line + this()) + " <") + (sender().address())) + "> ";
    (| $sys.log(line) |);
};

public method .connections() {
    return connections;
};

public method .context() {
    return context;
};

protected method .context_cmd() {
    arg @args;
    var out;
    
    (> .perms(caller(), 'command) <);
    out = ["Last thing: " + ((| (context['last]).name() |) || "(nothing)")];
    out += ["Last it:    " + ((| (context["it"]).name() |) || "(nothing)")];
    out += ["Last her:   " + ((| (context["her"]).name() |) || "(nothing)")];
    out += ["Last him:   " + ((| (context["him"]).name() |) || "(nothing)")];
    return out;
};

root method .core_user() {
    // for now we dont core the bug system
    (| .del_command("@rep?ort", 'report_cmd) |);
    (| .del_method('report_cmd) |);
    if (this() == definer())
        context = 0;
    else
        (| clear_var('context) |);
};

protected method .date_cmd() {
    arg @args;
    var fmt, l, d, out, rtime;
    
    fmt = "%I:%M %p";
    l = "%25r ";
    rtime = $time.realm_time((.location()).realm(), 'with_season);
    out = [strfmt(l, "Server Time:") + ($time.format(fmt + " %A, %B %d %Y %Z"))];
    out += [strfmt(l, ((rtime[2]).name()) + " Time:") + (rtime[1])];
    return out;
};

public method .del_command_alias() {
    arg alias;
    
    (> .perms(sender()) <);
    (> pass(alias) <);
    if ((!(.command_aliases())) && ($command_aliases_parser in (.parsers()))) {
        .tell("Removing $command_aliases_parser from your list of parsers.");
        .del_parser($command_aliases_parser);
    }
};

protected method .del_command_alias_cmd() {
    arg cmdstr, com, template;
    
    (> .perms(caller(), 'command) <);
    template = template.explode_quoted();
    if (listlen(template) == 0)
        return ("Syntax: " + com) + " <template>";
    template = template[1];
    catch ~aliasnf
        (> .del_command_alias(template) <);
    with
        return ("No command alias found matching \"" + template) + "\".";
    return ("Deleted command alias \"" + template) + "\".";
};

protected method .del_name_template_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, template;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    if ((listlen(args) > 2) && ((args[2]) == "from"))
        args = delete(args, 2);
    if (listlen(args) > 2)
        args = [args[1], sublist(args, 2).join()];
    if ((!args) || (listlen(args) != 2))
        return ("Syntax: `" + cmd) + " \"<template>\" [from] \"<object>\"`";
    obj = (> .match_env_nice(args[2]) <);
    template = args[1];
    if (!(obj.has_ancestor($has_name)))
        return obj + " cannot have regular names.";
    if (!(template in (obj.name_templates())))
        return (((obj.name()) + " does not have the name template \"") + template) + "\"";
    catch any
        obj = (> obj.del_name_template(template) <);
    with
        return (traceback()[1])[2];
    return ((((("Deleted name template \"" + template) + "\" from ") + (obj.namef('ref))) + ", templates: ") + ((obj.name_templates()).to_english("none"))) + ".";
};

public method .del_parser() {
    arg parser;
    var keepers;
    
    // removes a parser.  Cannot remove $command_parser (put things in
    // front of it instead).
    if (parser == $command_parser)
        throw(~no, "You must always have the $command_parser.");
    parsers = parsers.setremove(parser);
};

protected method .del_remembered() {
    arg name;
    
    remembered = (remembered || #[]).del(name);
    if (!remembered)
        clear_var('remembered);
};

protected method .del_trustee_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, trustee;
    
    (> .perms(caller(), 'command) <);
    trustee = args[1];
    args = args[2];
    if (args && ((args[1]) == "from"))
        args = delete(args, 1);
    obj = (> .match_env_nice(args.join()) <);
    catch any {
        (> obj.del_trusted(trustee) <);
        return [(("Removed trustee " + (trustee.namef('ref))) + " from ") + (obj.namef('ref)), (((obj.namef('ref)) + " now trusts: ") + ((((obj.trusted('literal)).compress()).mmap('namef, 'ref)).to_english("nobody"))) + "."];
    } with {
        .tell((traceback()[1])[2]);
    }
};

protected method .del_writer_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, writer;
    
    (> .perms(caller(), 'command) <);
    args = (args.replace(" from ", " ")).explode();
    if ((!args) || ((args.length()) != 2))
        (> .tell_error(cmd + " <writer> [from] <object>") <);
    writer = .match_env_nice(args[1]);
    obj = .match_env_nice(args[2]);
    catch any {
        obj.del_writer(writer);
        return [(("Sucessfully removed writer " + (writer.namef('xref))) + " from ") + (obj.namef('xref)), ("New writers list: " + ((((obj.writers('literal)).compress()).mmap('namef, 'xref)).to_english())) + "."];
    } with {
        .tell((traceback()[1])[2]);
    }
};

public method .description() {
    arg flags;
    var c, contents, ctext, pronoun, lines, p, br;
    
    br = $cml_lib.format_br_tag();
    pronoun = (.gender()).pronoun('psc);
    if (connections)
        lines = [((pronoun + " is ") + ((.activity()) || "awake")) + ".", br];
    else
        lines = [(pronoun + " is asleep, and was last connected ") + ($time.format("%d %B %y %H:%M", abs(connected_at))), br];
    if ((contents = .contents())) {
        lines += [pronoun + " is holding:"];
        lines += [(<$format, ["dfn", [["nobound", 1]], [(<$generator, ["join", [["separator", br]], map c in (contents) to ($cml_lib.format_obj_tag('look, c, c.name(), 'contained)), 'gen_join]>)], 'do_dfn]>)];
    }
    return (> pass(flags) <) + [$ctext_frob.new_with(lines)];
};

protected method .description_cmd() {
    arg cmdstr, cmd, str;
    var args, obj, desc, long;
    
    (> .perms(caller(), 'command) <);
    if ((args = match_template(str, "* as *"))) {
        obj = (> .match_env_nice(args[1]) <);
        desc = ((args[3]).trim()).unquote();
    } else {
        obj = (> .match_env_nice(str) <);
        if ((desc = .read()) == 'aborted)
            return;
        desc = join(desc.flatten()).trim();
    }
    if (!desc)
        desc = 0;
    catch any
        obj.set_prose(desc);
    with
        return (traceback()[1])[2];
    return ("Description for " + (obj.namef('ref))) + " set.";
};

public method .did_move() {
    arg @args;
    
    (> pass(@args) <);
    if (auto_look != 'no)
        .tell((.location()).get_description(#[['actor, this()], ['exclude, [this()]]]));
};

protected method .discard_cmd() {
    arg cmdstr, cmd, target;
    var msg, s, name;
    
    (> .perms(caller(), 'command) <);
    if ((cmdstr.trim()) == "discard") {
        s = (> .prompt(("Are you sure you want to discard " + (target.name())) + "? ") <);
        if (!(s in ["yes", "y"]))
            return ("Ok, not discarding " + (target.name())) + ".";
    }
    if (((target.location()) != this()) && (!(target.is($path))))
        return ("You are not holding " + (target.name())) + ".";
    name = target.name();
    if (type(target) == 'frob) {
        catch ~perm
            target.discard();
        with
            return (traceback()[1])[2];
    } else if ((target.manager()) == this()) {
        target.destroy();
    } else {
        target.move_to($trash);
        msg = $mail_message.new_mail();
        msg.set_subject("Discarded Object");
        msg.set_text([(((((((target.name()) + " has been discarded by ") + (.name())) + ". It currently exists in ") + ($trash.namef('ref))) + ", and will be destroyed in 15 days.  You may retrieve it with the command `@move ") + target) + " to me`."]);
        (| msg.send(target.manager()) |);
    }
    return ("Discarding " + name) + ".";
};

public method .evaluator() {
    return evaluator;
};

protected method .examine_cmd() {
    arg cmdstr, cmd, args;
    var obj, opts, i, chop, out, m, cmds, c, desc, notfrobby, frobhandler;
    
    (> .perms(caller(), $user) <);
    obj = args[1];
    opts = args[3];
    chop = .linelen();
    if (type(obj) != 'frob)
        notfrobby = 1;
    if (notfrobby)
        c = obj.created_on();
    if ((i = "ch?op" in (opts.slice(1))) && (!((opts[i])[3])))
        chop = 0;
    out = ["Object (@rename):    " + (obj.namef('ref)), "Templates (@ant):    " + ((| (obj.name_templates()).to_english("none") |) || "none")];
    if (notfrobby)
        out += ["Created:             " + (c ? ctime(c) : "(Before Time)"), (("Quota:               " + ((obj.quota()).to_english())) + " bytes") + ((obj.quota_exempt()) ? " ** exempt **" : "")];
    out += [("Size:                " + ((notfrobby ? (obj.size()) : size(obj)).to_english())) + " bytes (on disk)"];
    if (notfrobby)
        out += ["Perms (@chmod):      " + (((obj.flags()).prefix("+")).join())];
    out += ["Manager (@chmanage): " + ($object_lib.get_name(obj.manager(), 'namef, ['ref])), ._exam_sub("Writer", 1, "@aw/@dw", chop, obj, 'writers, 'literal)];
    if (notfrobby)
        out += [._exam_sub("Trusted", 0, "@at/@dt", chop, obj, 'trusted, 'literal), ._exam_sub("Parent", 1, "@ap/@dp", chop, obj, 'parents)];
    if (!notfrobby) {
        out += ["Frob Class:          " + frob_class(obj)];
        if ((frobhandler = (| frob_handler(obj) |)))
            out += ["Frob Handler:        " + frobhandler];
    }
    if (obj.has_ancestor($located))
        out += ["Location (@move):    " + ($object_lib.get_name(obj.location(), 'namef, ['xref]))];
    if ((desc = (| obj.prose() |)))
        out += ["Description:", "@describe " + ((type(obj) == 'frob) ? (obj.name()) : obj), @(type(desc) == 'frob) ? (desc.uncompile()) : ((type(desc) == 'list) ? desc : [desc]), "."];
    if ((cmds = (| obj.remote_commands() |)))
        out += $command_lib.format_commands_short(#[[obj, cmds]], "Remote", .linelen());
    if ((cmds = (| obj.local_commands() |)))
        out += $command_lib.format_commands_short(#[[obj, cmds]], "Local", .linelen());
    return out + ((| obj.examine() |) || []);
};

public method .find_object() {
    arg str, @args;
    var trace, match;
    
    // comprehensive matching method.
    // args define what to match.
    if (!args)
        args = ['environment];
    while (args) {
        switch (args[1]) {
            case 'environment:
                match = (| .match_environment(str) |);
            case 'user:
                match = (| $user_db.search(str) |);
            case 'grasp:
                match = (| $object_lib.to_dbref(str) |);
        }
        if (match)
            return match;
        args = args.delete(1);
    }
    throw(~objnf, ("No object found by the reference \"" + str) + "\".");
};

public method .find_object_nice() {
    arg str, @args;
    var match;
    
    catch any {
        match = .find_object(str, @args);
    } with {
        .tell("!  " + ((traceback()[1])[2]));
        throw(~stop, "");
    }
    return match;
};

protected method .finger_cmd() {
    arg cmdstr, cmd, who;
    var out, awaymsg;
    
    (> .perms(caller(), 'command) <);
    out = ([("Information on " + (who.name())) + " (use @set to change):"] + ((who.display_info('no_blanks)).prefix("  "))) + ((.age_cmd("", "", who)).prefix("  "));
    if (who.connected()) {
        if ((| (awaymsg = who.away()) |))
            return out + [(((("  " + (who.name())) + " has been away for ") + ($time.dhms(time() - (who.away_time()), 1))) + ": ") + awaymsg];
        return out + [("  " + (who.name())) + " is currently connected."];
    } else {
        return out + [(((("  " + (who.name())) + " was last connected at ") + ($time.format("%r", abs(who.connected_at())))) + " ") + ($time.format("%A %B %d %Y", abs(who.connected_at())))];
    }
};

protected method .follow_path() {
    arg @path;
    var e, oal;
    
    if (!path)
        throw(~badpath, "Walk nowhere?");
    oal = .get_auto_look();
    .set_auto_look($user, "", 0);
    catch any {
        for e in (path) {
            e.invoke();
            pause();
        }
        .set_auto_look(0, 0, oal);
    } with {
        .set_auto_look(0, 0, oal);
        rethrow(error());
    }
};

protected method .forget_cmd() {
    arg cmdstr, cmd, str;
    var what;
    
    (> .perms(caller(), 'command) <);
    what = (| remembered[str] |);
    if (!what)
        return ("You don't remember what \"" + str) + "\" is...";
    .del_remembered(str);
    return ((("Forgetting " + (what.namef('xref))) + " as \"") + str) + "\".";
};

protected method .forget_place() {
    arg place;
    
    if (type(place) != 'objnum)
        throw(~type, "Place must be submitted as an object.");
    remembered_places = remembered_places.setremove(place);
};

public method .format_content_type() {
    arg value;
    
    return "text/" + value;
};

public method .format_ext_parsers() {
    arg value;
    
    return value.to_english();
};

public method .format_messages() {
    arg target, @what;
    var messages, out, b, branches, m;
    
    catch ~methodnf
        messages = target.all_msgs();
    with
        return [("[" + (target.name())) + " does not have settable messages]"];
    out = [];
    for m in ((messages.keys()).sort()) {
        branches = messages[m];
        if (branches.contains("general")) {
            out += [("  " + m) + " = "].affix((branches["general"]).uncompile());
            branches = dict_del(branches, "general");
        }
        for b in ((branches.keys()).sort())
            out += [((("  " + m) + ".") + b) + " = "].affix((branches[b]).uncompile());
    }
    return out;
};

public method .format_settings() {
    arg target, @showdef;
    var sets, out, m, s, value, defs;
    
    if (showdef)
        showdef = showdef[1];
    catch ~perm {
        if (type(showdef) == 'objnum)
            sets = hash s in (showdef.defined_settings()) to ([s[1], showdef]);
        else
            sets = target.all_defined_settings();
    } with {
        return ["** Permission Denied"];
    }
    out = sets;
    for s in (sets) {
        catch any
            value = target.format_setting(@s, target.get_setting(@s));
        with
            value = (((traceback()[1])[1]) + ": ") + ((traceback()[1])[2]);
        out = dict_add(out, s[1], value);
    }
    if ((type(showdef) != 'objnum) && showdef) {
        defs = #[];
        for s in (sets)
            defs = defs.setadd_elem(tostr(s[2]), s[1]);
        sets = out;
        out = [];
        for m in (defs) {
            out += [(m[1]) + ":"];
            out += map s in ((m[2]).sort()) to ([(("  " + s) + " = ") + (sets[s])]);
        }
        return out;
    } else if (type(showdef) == 'objnum) {
        return [showdef + ":"] + map s in ((out.keys()).sort()) to ([(("  " + s) + " = ") + (out[s])]);
    } else {
        return map s in ((out.keys()).sort()) to ([(("  " + s) + " = ") + (out[s])]);
    }
};

public method .get_auto_look() {
    arg @args;
    
    // invert the logic, most people want it on (less clutter this way)
    return !auto_look;
};

protected method .get_away() {
    arg name, def;
    
    return away;
};

public method .get_base_parsers() {
    if (.command_aliases())
        return [$command_aliases_parser, $command_parser, $channel_parser];
    return [$command_parser, $channel_parser];
};

public method .get_cols() {
    arg @args;
    
    return cols || 80;
};

public method .get_content_type() {
    arg name, definer;
    
    return content_type || 'plain;
};

public method .get_global_tell() {
    arg @args;
    
    return global_tell;
};

public method .get_rows() {
    arg @args;
    
    return rows || 19;
    
    // 19 is the number of display rows you have in tf, in
    // visual mode with a default display/terminal.
};

protected method .go_cmd() {
    arg cmdstr, cmd, path;
    var m, route, loc;
    
    (> .perms(caller(), 'command) <);
    if ((m = match_template(path, "to *"))) {
        path = m[2];
        if (!path) {
            .tell("Specify a destination.");
            return;
        }
        if (path == "home")
            loc = .home();
        else
            loc = (| .match_environment(path) |);
    
        // if we have still not found a location...
        if (!loc) {
            catch any {
                loc = $place_db.search(path);
            } with {
                switch (error()) {
                    case ~ambig:
                        .tell("Several rooms match that name: " + ((((traceback()[1])[3]).mmap('namef)).to_english()));
                    case ~namenf:
                        .tell(("Unable to find place \"" + path) + "\".");
                        return;
                    default:
                        return (traceback()[1])[2];
                }
            }
        }
        if (!loc) {
            .tell(("Unable to find place \"" + path) + "\".");
            return;
        }
        if (loc == (.location())) {
            .tell("You are already there!");
            return;
        }
        if (!(route = (| $place_lib.bfs(.location(), loc) |)))
            throw(~stop, ("I can't find a route to " + path) + ".");
        return .follow_path(@route);
    }
    path = path.explode_quoted();
    catch any
        .walk_path(@path);
    with
        .tell((traceback()[1])[2]);
    if (auto_look != 'no)
        .tell((.location()).get_description(#[['actor, this()], ['exclude, [this()]]]));
    return "You arrive";
};

public method .home() {
    arg @args;
    var home;
    
    if ((home = pass(@args)) == $lost_and_found)
        return $body_cave;
    return home;
};

public method .idle_seconds() {
    return time() - last_command_at;
};

public method .idle_time() {
    arg @args;
    var idle;
    
    [(args ?= 'dhms)] = args;
    idle = .idle_seconds();
    if ((connected_at < 0) || (idle < 30))
        return "";
    switch (args) {
        case 'dhms:
            return $time.dhms(idle, 'long);
        case 'elapsed:
            return $time.elapsed(idle);
        case 'seconds:
            return idle;
    }
};

root method .init_user() {
    var n;
    
    password = "*";
    connected_at = 0;
    last_command_at = 0;
    connections = [];
    parsers = [$command_parser, $channel_parser];
    action = "";
    context = #[];
    .set_quota($sys.get_starting('quota));
    $user_db.insert(.name(), this());
    .set_flags([]);
    .move_to($body_cave);
    task_connections = #[];
    formatter = $plain_format;
};

protected method .inventory_cmd() {
    arg @args;
    var i;
    
    (> .perms(caller(), 'command) <);
    if (.contents()) {
        .tell("Carrying:");
        for i in (.contents())
            .tell(" " + (i.name()));
    } else {
        .tell("You are empty-handed.");
    }
};

public method .is_tellable_by() {
    arg caller, sender;
    
    return (sender == this()) || (caller in [$place, $user, $programmer, $admin, $mail_ui, $help_ui, $editor_session]);
};

public method .last_command_at() {
    return last_command_at;
};

public method .last_matched_object() {
    var match;
    
    if ((match = (| context['last] |))) {
        if (valid(match))
            return match;
    }
    return 0;
};

public method .linelen() {
    if (cols)
        return cols - 1;
    return 79;
    
    // backwards compatability, older tiny style systems
    // want linelen to actually be cols - 1
};

public method .login() {
    arg connection;
    var loc, cmd, p, c, last, tmp;
    
    set_user();
    .poll_semaphore('cleanup);
    if ((sender() != this()) || (definer() != caller()))
        throw(~perm, "Invalid access to private method.");
    task_connections = #[];
    (| .reset_parsers() |);
    .cache_client_init();
    (| .reset_help_history() |);
    $user_db.did_connect();
    if (reap_notified)
        clear_var('reap_notified);
    last = connected_at;
    connected_at = time();
    last_command_at = time();
    loc = .location();
    if (loc == $body_cave) {
        if ((.home()) != $body_cave)
            (| .move_to(.home()) |);
        else
            (| .move_to($world.starting_place()) |);
    } else {
        .tell(.look_cmd("", "", ""));
    }
    $channel_ui._broadcast('Login, (((.namef('titled)) + " has connected (total: ") + ($user_db.total_connected())) + ")");
    (| (.location()).did_connect() |);
    (| .login_notify(connection, last) |);
    (| .edit_sessions_notify() |);
    .hook_events('startup);
    $world.hook_into_event('realm_announce);
    context = #[];
    if (formatter == $pueblo_format)
        .set_content_type_pueblo();
    .release_semaphore('cleanup);
};

public method .login_again() {
    arg connection;
    
    if ((sender() != this()) || (definer() != caller()))
        throw(~perm, "Invalid access to private method.");
    last_command_at = time();
    (| .tell(("<Login> " + (((.connections()).length()).n_to_nth())) + " login.") |);
    if (failed) {
        (> .tell(("<Login> ** " + failed) + " failed login attempts **") <);
        (| clear_var('failed) |);
    }
};

protected method .login_notify(): forked  {
    arg connection, last;
    var l, sub, out, ans, rtime;
    
    sub = .subscribed();
    out = [];
    for l in ((sub.keys()).setremove(this())) {
        if (valid(l) && ((l.last_received_on()) > ((sub[l])[1])))
            out += [l.mail_name()];
    }
    if (out)
        .tell("<Mail> New mail on lists: " + (out.to_english()));
    if ((| (.last_received_on()) > (((.subscribed())[this()])[1]) |))
        .tell("<Mail> You have new mail (use `@help mail` to learn about mail)");
    if (last)
        .tell("<Login> Last connected at " + ($time.format("%A %B %d %I:%M %p %Y", abs(last))));
    rtime = $time.realm_time((.location()).realm(), 'with_season);
    .tell((("<Login> It is currently " + (rtime[1])) + " in ") + ((rtime[2]).name()));
    if (failed) {
        (| .tell(("<Login> ** " + failed) + " failed login attempts **") |);
        (| clear_var('failed) |);
    }
    if (!(.prose('literal)))
        .tell(["You have not yet set a description for yourself.", "Perhaps you'd like to take a look at the tutorial.", "Type @tutorial to read about how to set a description and more."]);
};

public method .logout() {
    arg connection;
    var p;
    
    (| (.location()).did_disconnect() |);
    (| .reset_parsers() |);
    (| .clear_help_history() |);
    (| $user_db.did_disconnect() |);
    
    // Track how long they are online (random info) -Lynx
    connected_seconds += time() - connected_at;
    
    // set this to -last_command so we know they aren't connected
    // (and using last command will be last_login)
    connected_at = -last_command_at;
    
    // user specific things
    if (!($guest in (.parents()))) {
        (| $housekeeper.did_disconnect() |);
        (| $user_db.last_log_disconnect(this()) |);
    } else {
        (| $user_db.last_log_disconnect($guest) |);
    }
    .cache_client_uninit();
    $channel_ui._broadcast('Login, (((.namef('titled)) + " has disconnected (total: ") + ($user_db.total_connected())) + ")");
    task_connections = #[];
    .set_activity("");
    (| clear_var('monitor) |);
    (| .new_list(this()) |);
    .unhook_events('startup);
    $world.unhook_from_event('realm_announce);
    (| clear_var('context) |);
};

public method .logout_connection() {
    arg connection;
    
    if ((sender() != this()) || (definer() != caller()))
        throw(~perm, "Invalid access to private method.");
    .tell(("<Login> " + ((((.connections()).length()) + 1).n_to_nth())) + " logout.");
};

protected method .look_cmd() {
    arg cmdstr, cmd, args;
    var m, obj, desc, flags, loc, prep, line, exam;
    
    (> .perms(caller(), 'command) <);
    
    // flags that are always the same
    flags = #[['actor, this()], ['actor_location, .location()], ['examine, match_begin(cmd, "e")], ['exclude, [this()]]];
    
    // Because we do some non-environment things, we parse look ourselves.
    // some times I critically catch things and sometimes I let the catch
    // statement catch them, this is because of how I want the errors to look.
    catch any {
        if ((m = match_template(args, "in|on *"))) {
            obj = (> .match_environment(m[2]) <);
            flags = (flags.add('type, m[1])).add_elem('exclude, obj);
            return obj.get_description(flags);
        } else {
            if ((m = match_template(args, "at *")))
                args = m[2];
            if (!args) {
                obj = .location();
                return obj.get_description(flags.add_elem('exclude, obj));
            } else if ((m = match_template(args, "* in|on *"))) {
                prep = m[2];
                catch any
                    loc = (> .match_environment(m[3]) <);
                with
                    return (traceback()[1])[2];
                obj = (| loc.match_environment(m[1]) |);
                if (!obj) {
                    return (> loc.get_detail(m[1]) <);
                } else if ((m = match_template(args, "det?ail *"))) {
                    desc = (| loc.get_detail(m[2]) |);
                    if (!desc)
                        return strfmt("No detail %d %l %l.", m[2], prep, loc.name());
                    return desc;
                } else {
                    return obj.get_description(flags.add_elem('exclude, obj));
                }
            } else if ((m = match_template(args, "det?ail *"))) {
                return (> (.location()).get_detail(m[2]) <);
            } else {
                obj = (> .match_environment(args) <);
                return obj.get_description(flags.add_elem('exclude, obj));
            }
        }
    } with {
        line = (traceback()[1])[2];
        if (error() in [~ambig, ~nodetail])
            return line;
        desc = (| (.location()).get_detail(args) |);
        if (!desc)
            return line;
        return desc;
    }
};

protected method .managed_cmd() {
    arg cmdstr, cmd, args;
    var manager, managed, obj, out, len;
    
    (> .perms(caller(), 'command) <);
    manager = (| .match_environment(args) |);
    if (!manager) {
        manager = (| $user_db.search(args) |);
        if (!manager)
            return ("Unable to find \"" + args) + "\".";
    }
    managed = manager.managed();
    if (!managed)
        return (manager.namef('ref)) + " does not manage any objects.";
    out = [(manager.namef('ref)) + " manages:"];
    len = (.linelen()) / 2;
    for obj in (managed)
        out += [(("  " + ((obj.namef('xref)).pad(len))) + " ") + ($object_lib.see_perms(obj, ["", ""]))];
    return out;
};

protected method .manager_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return (((what.namef('ref)) + " is managed by ") + ((what.manager()).namef('ref))) + ".";
};

protected method .map_cmd() {
    arg cmdstr, cmd;
    var l, obj, pos;
    
    (> .perms(caller(), 'command) <);
    l = .location();
    pos = l.get_setting("map-position", $realm_settings);
    return (| (pos[4]).view(@pos.subrange(1, 3), 20, 79) |) || "This room doesn't have map defined for it.";
};

public method .match_context() {
    arg str;
    
    return context[str];
};

public method .match_environment() {
    arg str;
    var match, gend;
    
    if ((str == ".") && (match = (| context['last] |))) {
        if (valid(match))
            return match;
    }
    if ((match = (| (.remembered())[str] |))) {
        if (!valid(match))
            .del_remembered(str);
        else
            return match;
    }
    match = (> pass(str) <);
    if (match.has_ancestor($thing)) {
        gend = (| match.gender() |);
        if (gend)
            context = context.add(gend.pronoun('po), match);
    }
    if (type(context) == 'dictionary)
        context = context.add('last, match);
    return match;
};

public method .match_name() {
    arg str;
    var m, n;
    
    if (!str)
        return 0;
    if ((m = pass(str)))
        return m;
    for n in (registered || []) {
        if ((m = match_begin(n, str)))
            return m;
    }
    return 0;
};

protected method .monitor() {
    return monitor;
};

protected method .monitor_cmd() {
    arg cmdstr, cmd, @args;
    var e, out, line, len;
    
    (> .perms(caller(), 'command) <);
    if (!(args[1])) {
        if (monitor == 0)
            return "You are not monitoring what you hear.";
        out = [];
        len = .linelen();
        for e in ((monitor || []).reverse()) {
            line = strfmt("%20S %30S ", (| (e[1]).namef('xref) |) || toliteral(e[1]), ((((e[2]) + ".") + (e[4])) + "() line ") + (e[5])) + (e[6]);
            if (strlen(line) > len)
                line = line.chop(len);
            out += [line];
        }
        return out + ["---"];
    }
    if ("on" in args) {
        monitor = [];
        return "You are now monitoring what you hear.";
    } else {
        (| clear_var('monitor) |);
        return "You are no longer monitoring what you hear.";
    }
};

public method .msg_cmd() {
    arg cmdstr, cmd, args;
    var who, branch, name, msg, what, definer, opts, clear;
    
    (> .perms(caller(), 'command) <);
    
    // it niggles the string enough to 'clean' up little mistakes
    [args, opts] = (> $parse_lib.opt(args, "c?lear") <);
    args = join(args).trim();
    clear = "c?lear" in (opts.slice(1));
    if ((what = regexp(args, "^([^:=]+): *(.*)$"))) {
        who = (> .match_env_nice((what[1]).trim()) <);
        args = (what[2]).trim();
    } else {
        who = this();
    }
    if ((what = regexp(args, "^([^=]+)=(.*)$"))) {
        name = (what[1]).trim();
        args = (what[2]).trim();
    } else {
        name = args;
        args = "";
    }
    if (!name)
        return ([("-- Messages on " + (who.namef('ref))) + ":"] + (.format_messages(who))) + ["---"];
    [name, @branch] = split(name, " *\. *", "b");
    if (!($code_lib.valid_message_id(name)))
        return ("Invalid Message name \"" + name) + "\"";
    msg = args.unquote();
    catch any {
        [definer, name, branch] = who.parse_msg(name, branch);
        if (clear)
            who = who.clear_msg(name, branch);
        else
            who = who.set_msg(name, branch, definer, args);
        msg = (who.get_msg(name, definer))[branch];
        if (branch == "general")
            return ["-- Message changed to:", ("  " + name) + " = "].affix(msg.uncompile());
        else
            return ["-- Message changed to:", ((("  " + name) + ".") + branch) + " = "].affix(msg.uncompile());
    } with {
        return (traceback()[1])[2];
    }
};

protected method .name_templates_cmd() {
    arg cmdstr, com, obj;
    
    (> .perms(caller(), 'command) <);
    if (!(obj.has_ancestor($has_name)))
        return (obj.name()) + " is not descended from $has_name!";
    return (("Name templates for " + (obj.namef('ref))) + ": ") + ((obj.name_templates()).to_english("none"));
};

public method .namef() {
    arg type;
    var str;
    
    switch (type) {
        case 'doing:
            str = .activity('noidle);
            if (str)
                return (((.name()) + " (") + str) + ")";
            return .name();
        case 'nactivity, 'activity:
            str = .activity();
            if (str)
                return (((.name()) + " (") + str) + ")";
            return .name();
        case 'titled:
            str = .title();
            if (str)
                return (((.name()) + " (") + str) + ")";
            return .name();
        default:
            return (> pass(type) <);
    }
};

protected method .new_cmd() {
    arg cmdstr, cmd, args;
    var match, name, parent, line, set, nprog, new, t;
    
    (> .perms(caller(), 'command) <);
    if ((match = match_template(args, "* named *"))) {
        name = match[3];
        args = match[1];
    } else {
        name = "";
    }
    catch any
        parent = (> .match_env_nice(args) <);
    with
        return (traceback()[1])[2];
    if (!(parent.is($physical)))
        return ((parent.namef('ref)).capitalize()) + " is not a VR object, you can only create new objects from VR objects (try @spawn).";
    if (name) {
        catch any
            name = (> $code_lib.parse_name(name) <);
        with
            return (traceback()[1])[2];
    }
    
    // spawn from the first parent, add the others
    catch any {
        new = (> parent.new() <);
        if (new.is($located))
            new = (> new.move_to(this()) <);
        if (name) {
            new = (> new.set_name(@name[1]) <);
            for t in (name[2])
                new = (> new.add_name_template(t) <);
        }
        return (("You create \"" + (new.namef('ref))) + "\"") + ((new.name_templates()) ? ((" (" + ((new.name_templates()).to_english())) + ")") : "");
    } with {
        .tell((traceback()[1])[2]);
        if (valid(new)) {
            line = new.namef('xref);
            catch ~isfrob
                (> new.destroy() <);
            with
                (> new.discard() <);
            if (valid(new))
                return ("Unable to destroy new object " + line) + ".";
            else
                return ("Sucessfully destroyed new object " + line) + ".";
        }
    }
};

protected method .new_editor_session() {
    arg ref, opts, type;
    var p;
    
    switch (ref[1]) {
        case 'object:
            if (!(| (p = (ref[2]).all_edit_types()) |))
                return "The object is not editable.";
            if (type == "any")
                type = p[1];
            if (!(| (ref[2]).(tosym("edit_" + type))() |))
                return ((("Could not edit " + (ref[2])) + "'s ") + type) + ".";
        default:
            return ("You cannot edit " + (ref[1])) + "s.";
    }
    if (.active_editor())
        return [("Editor invoked with " + ((.active_editor()).session_name())) + ".", "Type 'help' to list available commands."];
    else
        return ["Remote editing invoked."];
};

protected method .news_cmd() {
    arg @args;
    var line, x, mail, m, base, length, out;
    
    (> .perms(caller(), 'command) <);
    mail = $mail_list_news.recent_mail();
    base = mail[1];
    mail = mail[2];
    length = mail.length();
    .new_list($mail_list_news);
    out = [($motd.server_name()) + " news:", ""];
    for x in [1 .. length] {
        m = mail[x];
        out += [((((m.has_read(this())) ? "       " : "NEW => ") + (tostr(x + base).pad(-3))) + ") ") + (m.subject())];
    }
    return out + ["", "Use \"@read #\", where # is the news item number, such as \"@read 1\".  All news items can be found on mail list *news.", "---"];
};

public method .non_terminated_tell() {
    arg text;
    var conn;
    
    if (.get_setting("prompt", $user)) {
        conn = (| .task_connection() |);
        if (conn && (!global_tell)) {
            conn.write(text, 'non_terminated);
        } else {
            for conn in (connections)
                (| conn.write(text, 'non_terminated) |);
        }
    } else {
        .tell(text);
    }
};

public method .null_cmd() {
    arg @args;
    
};

public method .parse_content_type() {
    arg value, @args;
    var type, types, valid, f;
    
    value = strsed(value, "text/", "");
    if (!match_regexp(value, "[^a-z]")) {
        if ((| lookup(tosym(value + "_format")) |))
            return tosym(value);
    }
    valid = $formatter.descendants();
    valid = map f in (valid) to ("text/" + (substr(tostr(f), 2).sed("_format$", ""))).sort();
    throw(~check, "Content-type must be one of: " + (valid.to_english("", " or ")));
};

public method .parse_exit_style() {
    arg value, @args;
    var styles, s;
    
    // verify it is correct
    styles = ["none", "brief", "template?s", "long", "verbose"];
    for s in (styles) {
        if (match_template(value, s))
            return tosym(s.strip("?"));
    }
    throw(~wrong, "Style must be one of: " + (styles.to_english("", " or ")));
};

public method .parse_ext_parsers() {
    arg value, @args;
    var objs, o, r;
    
    objs = [];
    for o in (value.explode_english_list()) {
        o = o.trim();
        if (!(r = (| $object_lib.to_dbref(o) |))) {
            if (!(r = $user_parsers.match_children(o)))
                throw(~type, ("\"" + o) + "\" is not a child of $user_parsers.");
        }
        objs = setadd(objs, r);
    }
    
    // sorry buddy, no choice--these come from .get_base_parsers()
    for o in ((.get_base_parsers()) + [$command_aliases_parser])
        objs = setremove(objs, o);
    return objs;
};

public method .parse_line() {
    arg line;
    var parse, c, r, rval;
    
    (> .perms(caller(), $connection) <);
    set_user();
    if (away)
        .tell("You are still marked as being away.");
    
    // if we dont set it, it'll act like normal
    rval = this();
    last_command_at = time();
    .set_last_command(line.trim());
    catch any {
        task_connections = task_connections.add(task_id(), sender());
        parse = parsers ? ((parsers[1]).parse(this(), line, @parsers.subrange(2), $null_parser)) : ['failed];
        switch (parse[1]) {
            case 'action:
                r = (| (parse[2]).action(@parse[3]) |);
                if (type(r) in ['list, 'frob, 'string])
                    .ptell(r, #[['type, 'parser], ['action, parse[3]]]);
                else
                    .tell(("Invalid registered action '" + (parse[3])) + "'");
            case 'error:
                .tell(parse[2]);
            case 'match, 'command:
                r = (> (parse[2]).(parse[3])(@parse.subrange(4)) <);
                if (type(r) in ['list, 'frob, 'string])
                    .ptell(r, #[['type, 'parser], ['command, parse[3]]]);
                else
                    rval = r;
            case 'failed:
                for c in (($place_lib.coordinate_shortcuts()).keys()) {
                    if (line.match_template(c)) {
                        .tell(("There is no exit " + line) + " here.");
                        r = 1;
                    }
                }
                if (!r)
                    .tell(("I don't understand " + (line.chop((.linelen()) - 22))) + ".");
            case 'ok:
                // do nothing, probably a null command
            default:
                .tell("Unusual response from the parser: " + toliteral(parse));
        }
    } with {
        if (error() == ~stop) {
            if ((traceback()[1])[2])
                .tell((traceback()[1])[2]);
        } else {
            .tell_traceback(traceback(), @parse);
        }
    }
    catch any
        task_connections = task_connections.del(task_id());
    return rval;
};

public method .parsers() {
    .perms(sender(), 'trusts);
    return parsers;
};

protected method .password_cmd(): nooverride  {
    arg cmdstr, com, args;
    var syn, c, curr, new, verify;
    
    (> .perms(caller(), 'command) <);
    syn = com + " [<old password> [<new password>]]";
    args = explode(args);
    c = .task_connection();
    if (!args) {
        while (!curr)
            curr = (> (.prompt("Current Password (@abort to abort): ")).trim() <);
    } else {
        curr = args[1];
    }
    if (!(.check_password(curr)))
        return "Invalid Password";
    if (listlen(args) < 2) {
        while (1) {
            while (!new)
                new = (> (.prompt("New Password (@abort to abort): ")).trim() <);
            while (!verify)
                verify = (> (.prompt("Retype New Password (@abort to abort): ")).trim() <);
            if (new == verify)
                break;
            .tell("Passwords do not match!");
            new = (verify = 0);
        }
    } else if (listlen(args) == 2) {
        new = args[2];
    } else {
        (> .tell_error(syn) <);
    }
    catch any
        .set_password(new);
    with
        (> .tell_error(syn, (traceback()[1])[2]) <);
    .tell("Password changed.");
};

protected method .paste_cmd() {
    arg cmdstr, com, args;
    var obj, text, who, w, target;
    
    (> .perms(caller(), 'command) <);
    if (args) {
        args = args.sed("^to +", "");
        if ("," in args)
            args = args.explode_english_list();
        else
            args = args.explode();
        who = [];
        for w in (args) {
            catch ~ambig, ~namenf {
                target = (> $user_db.search(w) <);
            } with {
                catch any
                    target = (> .match_environment(w) <);
                with
                    .tell((traceback()[1])[2]);
            }
            if (target)
                who = setadd(who, target);
        }
        if (!who)
            return "No valid targets.";
    }
    text = .read();
    if (text == 'aborted)
        return .tell("@paste aborted.");
    else if (!text)
        return .tell("@paste nothing?");
    text = [((" " + (.name())) + " (@paste's) ").center(79, "-", 'both), @text, " + Finis + ".center(79, "-", 'both)];
    if (who) {
        for w in (who)
            (| w.tell(text) |);
        .tell(((((text.length()) - 2) + " lines of text pasted to ") + (who.map_to_english('name))) + ".");
    } else {
        (.location()).announce(text);
        .tell(((text.length()) - 2) + " lines of text pasted");
    }
};

public method .personal_fields() {
    return #[["real-name", 1], ["email", 1], ["address", 1], ["affiliation", 1], ["position", 1], ["location", 1], ["interests", 1], ["plan", 1], ["projects", 1], ["home-page", 0]];
};

protected method .personal_info() {
    return info || #[];
};

public method .player_breakdown_cmd() {
    arg cmdstr, cmd;
    var admins, programmers, builders, users, total, pstrip, bstrip, strip, names, players;
    
    // stuff to strip
    // users
    strip = [$guest, $user, $reaper, $no_one, $player, $builder, $storyteller, $programmer, $admin];
    
    // programmers
    pstrip = [$admin];
    
    // builders
    bstrip = [$programmer, $admin];
    
    // get number of admins
    admins = listlen($sys.admins());
    names = $sys.admins();
    
    // get number of programmers, minus those that are also admins
    programmers = $programmer.descendants();
    programmers = $list.setremove_all(programmers, pstrip);
    programmers = $list.setremove_all(programmers, $sys.admins());
    names += programmers;
    programmers = listlen(programmers);
    
    // get number of builders
    builders = $builder.descendants();
    builders = $list.setremove_all(builders, $sys.admins());
    builders = $list.setremove_all(builders, $programmer.descendants());
    builders = $list.setremove_all(builders, strip);
    names += builders;
    builders = listlen(builders);
    
    // get number of users
    users = $user.descendants();
    users = $list.setremove_all(users, strip);
    names += users;
    users = listlen(users);
    
    // get total number of players, users counts everybody, even admins
    total = users;
    
    // correct for backwards places like tCD where everybody is a programmer
    if ((users - ((admins + programmers) + builders)) < 0)
        users = 0;
    else
        users = users - ((admins + programmers) + builders);
    
    // break it down
    sender().tell("--- Player Breakdown ---");
    sender().tell(("There are currently " + total) + " total users.");
    sender().tell(("    " + admins) + " admin(s) *");
    sender().tell(("    " + programmers) + " programmer(s)");
    sender().tell(("    " + builders) + " builder(s)");
    sender().tell(("    " + users) + " user(s)");
    sender().tell("---");
    sender().tell("");
    players = (($sys.admins()).mmap('name)).prefix("*");
    players += ($list.setremove_all($list.setremove_all($user_db.user_dbrefs(), strip), $sys.admins())).mmap('name);
    sender().tell($list.columnize(players, 3));
};

public method .prompt() {
    arg prompt, @abort;
    
    // second argument represents how to handle '@abort' as input,
    // if it is 'no, then '@abort' is treated as any other string.
    // If it is 'yes, then ~stop will be thrown if @abort is
    // encountered, with the message "** Aborted **".  If it is a
    // string, then the behaviour is the same as with 'yes, but
    // that string is used instead of the default message.
    .non_terminated_tell(prompt);
    [(abort ?= 'yes)] = abort;
    return (> .read_line(0, abort) <);
};

public method .prompt2() {
    arg prompt, @abort;
    
    // second argument represents how to handle '@abort' as input,
    // if it is 'no, then '@abort' is treated as any other string.   
    // If it is 'yes, then ~stop will be thrown if @abort is 
    // encountered, with the message "** Aborted **".  If it is a
    // string, then the behaviour is the same as with 'yes, but 
    // that string is used instead of the default message.
    .non_terminated_tell(prompt);
    [(abort ?= 'yes)] = abort;
    return (> .read_line2(0, abort) <);
};

public method .prompt_yesno() {
    arg str, @def;
    var input, rx;
    
    // the second argument is an integer for the default value 
    [(def ?= 1)] = def;
    input = (> .prompt(str) <);
    if (match_regexp(input, "^(y|ye|yes)$"))
        return 1;
    if (match_regexp(input, "^(n|no)$"))
        return 0;
    return def;
};

public method .ptell() {
    arg what, flags;
    
    if (!(.is_tellable_by(caller(), sender())))
        throw(~perm, "Only allowed objects may call protected tell.");
    ._tell(what, flags);
};

public method .pueblo_cmd() {
    arg cmstr, cmd, args;
    
    (.connections()).mmap('write, "</xch_mudtext><img xch_mode=purehtml>");
    (.connections()).mmap('write, "<h1>Rich-HTML text enabled</h1>");
};

protected method .quit_cmd() {
    arg @args;
    
    (> .perms(caller(), 'command) <);
    return 'disconnect;
};

public method .read() {
    arg @args;
    var text, output, head, tail;
    
    if (!(.connections()))
        return 'not_connected;
    if ((.task_connection()).is_reading_block())
        return 'engaged;
    if (args.length())
        head = args[1];
    else
        head = "Receiving input.  Enter \".\" to finish or \"@abort\" to abort.";
    if ((args.length()) > 1)
        tail = args[2];
    else
        tail = "** Aborted **; Text thrown away.";
    if (head)
        .ptell(head, #[['type, 'read]]);
    output = (.task_connection()).start_reading_block('multiple);
    if ((output == 'aborted) && tail)
        .ptell(tail, #[['type, 'read]]);
    return output;
};

public method .read_line() {
    arg @args;
    var line, abort, head, con;
    
    if (!(.connections()))
        return 'not_connected;
    con = (| .task_connection() |) || ((.connections())[1]);
    if (con.is_reading_block())
        throw(~engaged, "This connection is already reading input.");
    [(head ?= ""), (abort ?= 'yes)] = args;
    if (head)
        .tell(head);
    line = con.start_reading_block('one);
    if ((line == 'aborted) || ((abort != 'no) && ((| (line[1]).trim() |) == "@abort"))) {
        if (type(abort) == 'string)
            throw(~stop, abort);
        else
            throw(~stop, "** Aborted **");
    }
    if ((| type(line[1]) |) != 'string)
        throw(~prompt, "Unexpected result from .prompt(): " + line);
    return line[1];
};

public method .read_line2() {
    arg @args;
    var line, abort, head, con;
    
    if (!(.connections()))
        return 'not_connected;
    con = (| .task_connection() |) || ((.connections())[1]);
    if (con.is_reading_block())
        throw(~engaged, "This connection is already reading input.");
    [(head ?= ""), (abort ?= 'yes)] = args;
    if (head)
        .tell(head);
    line = con.start_reading_block('one);
    if ((line == 'aborted) || ((abort != 'no) && ((| (line[1]).trim() |) == "@abort"))) {
        if (type(abort) == 'string)
            throw(~stop, abort);
        else
            throw(~stop, "** Aborted **");
    }
    if ((| type(line[1]) |) != 'string)
        throw(~prompt, "Unexpected result from .prompt(): " + line);
    return line[1];
};

public method .reap_status() {
    return reap_status;
};

private method .register_name() {
    arg new;
    
    if (!(new in (registered || []))) {
        (> $user_db.valid_name(new) <);
        (> $user_db.insert(new, this()) <);
        if (registered)
            registered += [new];
        else
            registered = [new];
    }
};

private method .register_name_cmd() {
    arg cmd, cmdstr, name;
    
    catch any
        (> .register_name(name) <);
    with
        return (traceback()[1])[2];
    return [("Registered alternate name \"" + name) + "\".", ("Registered names: " + (registered.to_english("none"))) + "."];
};

private method .registered_cmd() {
    arg @args;
    
    return ("Registered names: " + ((registered || []).to_english("none"))) + ".";
};

public method .registered_names() {
    return registered || [];
};

protected method .rehash_cmd() {
    arg cmdstr, cmd, args;
    var target, client, opts, client, o;
    
    (> .perms(caller(), 'command) <);
    [args, opts] = args;
    if ((o = (| "c?lient" in (opts.slice(1)) |)))
        client = (opts[o])[3];
    else if ((o = (| "r?aw" in (opts.slice(1)) |)))
        client = !((opts[o])[3]);
    if (args)
        target = (> .match_env_nice(join(args)) <);
    else
        target = this();
    catch ~perm {
        if (client) {
            .tell(("Rehashing commands on " + (target.namef('ref))) + "...");
            target.cache_client_uninit();
            target.cache_client_init();
            .tell("Done.");
        } else {
            .tell(("Rehashing (raw) commands on " + (target.namef('ref))) + "...");
            target.rehash_cache();
            .tell("Done.");
        }
    } with {
        return "You do not have permission to rehash " + (target.namef('ref));
    }
};

protected method .remember_cmd() {
    arg cmdstr, cmd, what, as, str;
    
    (> .perms(caller(), 'command) <);
    .add_remembered(what, str);
    return ((("Remembering " + (what.namef('xref))) + " as \"") + str) + "\".";
};

public method .remembered() {
    return remembered || #[];
};

protected method .remembered_cmd() {
    arg cmdstr, cmd, args;
    var item, out;
    
    (> .perms(caller(), 'command) <);
    if (!(.remembered()))
        return .tell("You do not remember anything.");
    out = [];
    for item in (.remembered())
        out += [(("  " + (item[1])) + " is ") + ((item[2]).namef('xref))];
    return ["Remembered Items:"] + (out.lcolumnize());
};

public method .remote_cmd() {
    arg cmdstr, com, who, prep, str;
    var target, line, fstr, wstr, type, bad, awaymsg;
    
    (> .perms(caller(), $user, $robot) <);
    if (str && ((str[1]) == ":")) {
        type = 'emote;
        str = str.subrange(2);
    } else {
        type = 'say;
    }
    who = (> .parse_interaction_reference(who, tostr(type), 'userdb) <);
    if ((bad = filter target in (who) where (type(target) != 'objnum)))
        return ("Unable to find " + (bad.to_english())) + ".";
    .add_interaction('objs, who);
    line = .name();
    if (str && ((str[1]) == ":"))
        str = str.subrange(2);
    else
        line += " ";
    if (type == 'emote) {
        line += str;
    } else {
        if (str)
            line += $code_lib.punctuation_type(str);
        else
            line += "say";
        line = ((line + "s, \"") + str) + "\"";
    }
    wstr = (who.mmap('name)).to_english();
    fstr = "[from " + ((.location()).name());
    if ((who.length()) > 1)
        fstr = (fstr + ", to ") + wstr;
    fstr = (fstr + "] ") + line;
    for target in (who) {
        if (!(target.connected()))
            .tell((target.name()) + " is not connected.");
        (| target.directed_tell(fstr, 'remote) |);
    }
    .tell((("[to " + wstr) + "] ") + line);
    if ((| (awaymsg = target.away()) |))
        .tell((((target.name()).capitalize()) + " is away: ") + awaymsg);
};

protected method .rename_cmd() {
    arg cmdstr, cmd, args;
    var obj, name, templates, article, old, oldart, oldts, new, t;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    if ((listlen(args) > 2) && ((args[2]) == "to"))
        args = delete(args, 2);
    if (listlen(args) > 2)
        args = [args[1], sublist(args, 2).join()];
    if ((!args) || (listlen(args) != 2))
        return ("Syntax: `" + cmd) + " \"<object>\" [to] \"<newname>\" [+(proper|unique|normal)]`";
    obj = (> .match_env_nice(args[1]) <);
    catch any {
        name = (> $code_lib.parse_name(sublist(args, 2).join()) <);
        templates = name[2];
        article = (name[1])[2];
        name = (name[1])[1];
        if ((name[1]) == "$") {
            if ((obj.is($user)) || (obj.is($place))) {
                if (!(.is($admin)))
                    return "User and Place objnames can only be changed by administrators.";
                else
                    (> .check_mojo() <);
            }
            name = substr(name, 2);
            if (!(name.valid_ident()))
                return "Object names can only contain a-z, 0-9 and the underscore.";
            name = tosym(name);
            old = obj.namef('xref);
            (> obj.set_objname(name) <);
            return ((("Renamed " + old) + " to ") + obj) + ".";
        } else {
            if (!(obj.has_ancestor($has_name)))
                return ("Object \"" + obj) + "\" cannot have a regular name.";
            oldart = (obj.name('literal))[1];
            oldts = obj.name_templates();
            old = ((((" [" + article) + "] \"") + (obj.name())) + "\"") + (templates ? ((" (" + (oldts.to_english())) + ")") : "");
            old = ("\"" + (obj.name())) + "\"";
            obj = (> obj.set_name(name, article) <);
            new = ("\"" + (obj.name())) + "\"";
            if (templates) {
                for t in (templates)
                    obj = (> obj.add_name_template(t) <);
                new += (" (" + ((obj.name_templates()).to_english())) + ")";
                old += (" (" + (oldts.to_english())) + ")";
            }
            if (oldart != ((obj.name('literal))[1])) {
                old = (("[" + oldart) + "] ") + old;
                new = (("[" + ((obj.name('literal))[1])) + "] ") + new;
            }
            return ((("Renamed " + old) + " to ") + new) + ".";
        }
    } with {
        return (traceback()[1])[2];
    }
};

protected method .reset_parsers() {
    var p, list;
    
    parsers = [];
    list = (.get_setting("extended-parsers", $user)) || [];
    for p in ((.get_base_parsers()) + list)
        .add_parser(p);
};

public method .set_activity() {
    arg str;
    
    (> .perms(sender()) <);
    activity = str;
};

protected method .set_auto_look() {
    arg name, definer, value, @args;
    
    // invert the logic, most people want it on (less clutter this way)
    if (value) {
        if (auto_look)
            clear_var('auto_look);
    } else {
        auto_look = 'no;
    }
};

protected method .set_away() {
    arg name, definer, value, @args;
    
    if (value) {
        away = value;
        away_time = time();
    } else {
        clear_var('away);
    }
};

protected method .set_closable() {
    arg name, definer, value;
    
    closable = value;
};

public method .set_cmd() {
    arg cmdstr, cmd, args;
    var who, branch, name, setting, what, def, opts, clear, showdef, syn;
    
    (> .perms(caller(), 'command) <);
    syn = ["Syntax: @set [TARGET:]SETTING=VALUE", "TARGET defaults to yourself, if unspecified."];
    if ((what = regexp(args, "^ *\+(clear|c) +(.*)"))) {
        clear = 1;
        args = what[2];
    }
    if ((what = regexp(args, "^ *\+(definers|definer|def|d) *= *\$?([a-z0-9_]+) *(.*)"))) {
        if (!(showdef = (| lookup(tosym(what[2])) |)))
            return "Invalid definer $" + (what[2]);
        args = what[3];
    }
    if ((what = regexp(args, "^ *\+(def|definer|definers|d) *(.*)"))) {
        showdef = 1;
        args = what[2];
    }
    if ((what = regexp(args, "^([^:=]+): *(.*)$"))) {
        who = (> .match_env_nice((what[1]).trim()) <);
        args = (what[2]).trim();
    } else {
        who = this();
    }
    if ((what = regexp(args, "^([\@a-z0-9-]+) *= *(.*)$"))) {
        name = (what[1]).trim();
        args = (what[2]).trim();
    } else {
        name = args;
        args = "";
    }
    if (!name)
        return ([("-- Settings on " + (who.namef('ref))) + ":"] + (.format_settings(who, showdef))) + ["---"];
    if (!($code_lib.valid_setting_id(name)))
        return syn + [("** Invalid Setting name \"" + name) + "\""];
    setting = args.unquote();
    catch any {
        def = who.setting_definer(name);
        if (clear)
            who = who.clear_setting(name, def);
        else
            who = who.set_setting(name, def, setting);
        setting = who.format_setting(name, def, who.get_setting(name, def));
        return ["-- Setting changed to:", (("  " + name) + " = ") + setting, "--"];
    } with {
        if (error() == ~perm)
            return "You are not allowed to change settings on " + (who.namef('ref));
        return (traceback()[1])[2];
    }
};

protected method .set_cols() {
    arg name, definer, value, @args;
    
    if ((value == 80) || (!value))
        (| clear_var('cols) |);
    else
        cols = value;
};

protected method .set_conn_options() {
    arg conn, options;
    
    if (!(conn in connections))
        throw(~invarg, (conn + " is not a connection for ") + this);
    connection_options = (| connection_options.add(conn, options) |) || #[[conn, options]];
};

protected method .set_content_type() {
    arg name, definer, value;
    var sets, meth;
    
    // a touch of Pueblo cruft crap
    if ((formatter == $pueblo_format) && (value != 'pueblo))
        (.connections()).mmap('write, "<img xch_mode=text>Rich-HTML disabled");
    content_type = value;
    formatter = lookup(tosym(value + "_format"));
    meth = tosym("set_content_type_" + value);
    if ((| .find_method(meth) |))
        (> .(meth)() <);
};

public method .set_content_type_pueblo(): forked  {
    .tell("This world is Pueblo 1.10 enhanced.");
    .tell("Pueblo is annoyingly proprietary in that it requires this message to be printed, the administration appologizes for the disgustingness of this behaviour.");
    content_type = 'html;
};

protected method .set_global_tell() {
    arg @args;
    
    if ((args[3]) == 0)
        clear_var('global_tell);
    else
        global_tell = 1;
};

public method .set_name() {
    arg new_name, @ignore;
    var old_name, part, sname;
    
    (> .perms(sender(), 'manager) <);
    
    // if $sys is calling this, we probably want to strip off
    // the user_ prefix...
    if (sender() == $sys)
        new_name = strsed(new_name, ("^" + ((parents()[1]).objname())) + "_", "");
    
    // so it doesnt bomb on .set_objname
    if ((> $user_db.valid_name(new_name) <))
        old_name = .name();
    catch any {
        (> pass(new_name, 'prop) <);
        if (new_name in (registered || []))
            .unregister_name(new_name);
        if (!(| $user_db.key_changed(old_name, new_name) |))
            $user_db.insert(new_name, this());
        if (old_name != new_name) {
            sname = new_name.strip();
            (> .set_objname(tosym("user_" + sname)) <);
        }
    } with {
        (| pass(old_name, 'prop) |);
        rethrow(error());
    }
};

public method .set_objname(): nooverride  {
    arg new_objname;
    
    if ((caller() != $user) && (!(sender() in ($sys.system()))))
        throw(~perm, "User objnames can only be changed by $user.");
    (> pass(new_objname) <);
};

public method .set_password() {
    arg str;
    
    (> .perms(sender(), 'manager) <);
    if ((str.length()) < 5)
        throw(~badpasswd, "Passwords must be at least 5 characters long.");
    password = crypt(str);
};

public method .set_reap_notified() {
    arg date;
    
    (> .perms(sender(), 'system) <);
    if (date)
        reap_notified = date;
    else
        (| clear_var('reap_notified) |);
};

public method .set_reap_status() {
    arg status;
    
    (> .perms(sender(), 'system) <);
    if (status)
        reap_status = status;
    else
        (| clear_var('reap_status) |);
};

protected method .set_rows() {
    arg name, definer, value, @args;
    
    if ((value == 19) || (!value))
        (| clear_var('rows) |);
    else
        rows = value;
};

protected method .set_setting_title() {
    arg definer, name, value, @args;
    
    .set_title(value);
};

public method .set_tell_traceback() {
    arg which, @lines;
    
    .perms(sender(), 'manager);
    if (!(which in ['verbose, 'brief, 'none]))
        throw(~type, "Which style must either be 'verbose, 'brief, or 'none.");
    if (lines && (type(lines[1]) != 'integer))
        throw(~type, "You must specify the max lines as an integer.");
    if (!lines)
        lines = 0;
    else
        lines = lines[1];
    tell_traceback = [which, lines];
};

protected method .set_title() {
    arg name, definer, value;
    
    .perms(sender());
    if (strlen(value) > 30)
        throw(~type, "Titles must be under 30 characters.");
    title = value;
};

protected method .status_cmd() {
    arg cmdstr, com, @args;
    var line, s, x, out, utime, stime, nosys;
    
    (> .perms(caller(), 'command) <);
    s = $sys.status();
    for x in [1 .. s.length()] {
        if ((s[x]) == (-1))
            nosys++;
    }
    out = [("--- " + ($motd.server_name())) + " status report ---"];
    if ($sys.dirty())
        out += ["System is:        dirty, will do normal backup."];
    else
        out += ["System is:        clean, will skip backup."];
    utime = ((strsub($time.to_english(s[1]), " and", ",") + " and ") + ((s[2]) / 1000)) + " milliseconds";
    stime = ((strsub($time.to_english(s[3]), " and", ",") + " and ") + ((s[4]) / 1000)) + " milliseconds";
    out += ["System lag:       " + ($lag_watcher.lag()), "Next dbref:       " + ($sys.next_objnum()), "Driver:           " + ($sys.server_info('driver_version, 'long)), "Core:             " + ($sys.server_info('core_version, 'long)), ("Started:          " + ($time.to_english(time() - ($sys.server_info('startup_time))))) + " ago", ("Backup:     last: " + ($time.to_english(time() - (s[21])))) + " ago", ("            next: " + ($time.to_english((s[22]) - time()))) + " from now", "        interval: " + ($time.to_english(s[20]))];
    if (!nosys)
        out += ["CPU time used:    user: " + utime, "                  system: " + stime, ((("Page:             " + (s[9])) + " reclaims ") + (s[10])) + " faults", ((("Context switches: " + (s[17])) + " voluntary ") + (s[18])) + " involuntary", "Signals:          " + (s[16]), "---"];
    return out;
};

protected method .take_from_cmd() {
    arg cmdstr, cmd, what, p, loc;
    var c, obj, l, wl;
    
    (> .perms(caller(), 'command) <);
    if (loc == this())
        return ("You already have " + (what.name())) + ".";
    for c in (loc.contents()) {
        if (c.match_name(what))
            obj = c;
    }
    if (!obj)
        return ((.name()) + " does not have ") + what;
    if ((obj == this()) || (obj == loc))
        return "Ewww, its all twisty.";
    catch any {
        l = .location();
        wl = loc.location();
        (> obj.move_to(this()) <);
        if (l != wl)
            wl.announce(((((((((.name()) + " ") + cmd) + "s ") + (obj.name())) + " ") + p) + " ") + (loc.name()), this());
        l.announce(((((((((.name()) + " ") + cmd) + "s ") + (obj.name())) + " ") + p) + " ") + (loc.name()), this());
        return ((((((("You " + cmd) + " ") + (obj.name())) + " ") + loc) + " ") + (loc.name())) + ".";
    } with {
        switch (error()) {
            case ~locked:
                if (loc.is($user))
                    loc.tell((((.name()) + " tried to take ") + (obj.name())) + " from you.");
                return (((obj.name()) + " is locked to ") + ((obj.lock()).lock_name('thing))) + ".";
            default:
                return (traceback()[1])[2];
        }
    }
};

public method .task_connection() {
    return task_connections[task_id()];
};

public method .task_connections() {
    return task_connections;
};

public method .tell() {
    arg what, @who;
    
    if (!(.connected()))
        return;
    if (monitor != 0) {
        if (listlen(monitor) > 19)
            monitor = [[user(), @stack()[2], what], @delete(monitor, 10)];
        else
            monitor = [[user(), @stack()[2], what], @monitor];
    }
    ._tell(what);
};

public method .title() {
    arg @args;
    
    return title || "";
};

protected method .trusted_by_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [(what.namef('ref)) + " is trusted by:"] + (._list_objects(what.trusted_by(), 'trusted));
};

protected method .trusts_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [(what.namef('ref)) + " trusts:"] + (._list_objects(what.trusted('literal), 'trusted_by));
};

public method .tutorial_cmd() {
    arg cmdstr, cmd, args;
    var tuts, t, start;
    
    args = args.trim();
    tuts = filter t in ($tutorial.children()) where ((t.minclass()) && (.is(t.minclass())));
    if (!args)
        t = $introductory_tutorial;
    else if (args == "?")
        return ["All tutorials available to your class:", "    " + (tuts.map_to_english('name)), ("Use '" + cmd) + " TUTORIAL' for the specific tutorial you wish to enter."];
    else if ((t = find t in (tuts) where ((t.name()) == args)))
        t = tuts[t];
    else
        return [("Unknown or unavailable tutorial '" + args) + "', try one of:", "    " + (tuts.map_to_english('name))];
    if ((.location()).is($tutorial))
        return "You are already in a tutorial, you must exit it before you can enter another one.";
    start = t.get_setting("start-topic", $tutorial);
    if (!start)
        return "Uhoh! There is no starting topic for that tutorial!";
    (.location()).announce((((.name()) + " enters the ") + ((t.name()).capitalize())) + " Tutorial.", this());
    .move_to(start);
    if (!(.get_setting("auto-look", $user)))
        return ["You enter the tutorial.", "", "The Tutorials use place descriptions to explain topics.  Your auto-look is turned off, you should turn it on in order to see each topic automatically."];
};

root method .uninit_user() {
    var conn, name;
    
    if (.connected())
        (| (.location()).did_disconnect() |);
    
    // and incase any are lying about
    for conn in (connections)
        (| conn.interface_going_away() |);
    password = 0;
    connections = 0;
    (| $user_db.remove(.name()) |);
    for name in (registered || [])
        (| $user_db.remove(name) |);
};

private method .unregister_name() {
    arg old;
    
    registered = setremove(registered || [], old);
    if (!registered)
        (| clear_var('registered) |);
    (| $user_db.remove(old) |);
};

private method .unregister_name_cmd() {
    arg cmd, cmdstr, name;
    
    catch any
        (> .unregister_name(name) <);
    with
        return (traceback()[1])[2];
    return [("Unregistered alternate name \"" + name) + "\".", ("Registered names: " + ((registered || []).to_english("none"))) + "."];
};

protected method .walk_path() {
    arg @path;
    var p, exit, exits, e, l, oal;
    
    if (!path)
        throw(~badpath, "Walk nowhere?");
    oal = .get_auto_look();
    .set_auto_look($user, "", 0);
    catch any {
        for p in (path) {
            // did we actually move?
            l = .location();
            exits = l.exits();
            if (!(exit = find e in (exits) where (e.match_name(p))))
                .tell((("No exit \"" + p) + "\" from ") + (l.name()));
            else
                (exits[exit]).invoke();
            pause();
        }
        .set_auto_look(0, 0, oal);
    } with {
        .set_auto_look(0, 0, oal);
        rethrow(error());
    }
};

protected method .ways_cmd() {
    arg cmdstr, cmd, rest;
    var exits, e, line, out, loc;
    
    (> .perms(caller(), 'command) <);
    loc = .location();
    exits = loc.visible_exits();
    if (!exits)
        return "There are no visible exits from this room.";
    
    // come up with some settings to configure how to display exits
    // for now they can deal with the following
    out = [];
    if ((.get_setting("exit-style", $user)) == 'none) {
        out += ["Visible exits: "];
        for e in (exits)
            out += [((("  " + (e.name())) + ((e.name_templates()) ? ((" (" + ((e.name_templates()).to_english())) + ")") : "")) + " to ") + ((e.dest(loc)).name())];
    } else {
        out += loc.format_exits(exits, #[['actor, this()]]);
    }
    return out + ["---"];
};

protected method .whereis_cmd() {
    arg cmdstr, cmd, who;
    var user, u;
    
    (> .perms(caller(), 'command) <);
    who = (who && (who.explode_english_list())) || [];
    if (who && ((who[1]) == "is"))
        who = who.delete(1);
    if (!who)
        return "You must specify somebody.";
    for user in [1 .. who.length()] {
        u = (| $user_db.search(who[user]) |);
        if (!u) {
            .tell(("I don't know who \"" + (who[user])) + "\" is.");
            who = who.replace(user, 0);
        } else {
            who = who.replace(user, u);
        }
    }
    for user in (who) {
        if (user)
            .tell(((user.namef('nactivity)) + " is in ") + ((user.location()).name()));
    }
};

public method .who_cmd() {
    arg cmdstr, com, args;
    var who, title, rest, opts, opt, a, all, prog, admin, short, sort, sortorder, s, x, place, results, sortopts, sortmeths;
    
    (> .perms(caller(), 'command) <);
    
    // just the basic who listing
    args = ((.get_setting("@who-options", $user)) + " ") + args;
    [args, opts] = (> $parse_lib.opt(args, "a?ll", "p?rogrammers", "a?dmins", "s?hort", "so?rt") <);
    for opt in (opts) {
        switch (opt[1]) {
            case "a?ll":
                all = opt[3];
            case "p?rogrammers":
                prog = opt[3];
            case "a?dmins":
                admin = opt[3];
            case "s?hort":
                short = opt[3];
            case "so?rt":
                sort = opt[4];
                sortorder = opt[3];
        }
    }
    args = (args.join()).explode_english_list();
    results = [];
    if (admin && (admin = ._who__admins([], all)))
        results += [admin];
    if (prog && (prog = ._who__programmers([], all)))
        results += [prog];
    if ((!prog) && ((!admin) && (!args))) {
        results += [[$user_db.connected(), "Connected Users"]];
    } else {
        for a in (args) {
            if ((a[1]) == "@") {
                if ((place = ._who__at_place(a.subrange(2))))
                    results += [place];
                args = args.setremove(a);
            }
        }
        if (args && (args = ._who__is(args)))
            results += [args];
    }
    who = [];
    for x in (results)
        who = union(who, x[1]);
    title = (results.slice(2)).to_english();
    rest = ((results.length()) == 1) ? ((results[1]).subrange(3)) : [];
    if (!who)
        return "Ack, nobody to list?";
    if (sort) {
        sortopts = ["idle", "connected", "name", "location", "place"];
        sortmeths = ['idle_seconds, 'connected_at, 'name, 'location, 'location];
        s = filter x in (sortopts) where (match_begin(x, sort));
        if ((s.length()) != 1) {
            .ptell("Unrecognized sort option: " + sort, #[['type, 'command]]);
            sort = 0;
        } else {
            sort = sortmeths[(s[1]) in sortopts];
        }
    }
    if (sort) {
        sort = who.mmap(sort);
        if (type(sort[1]) == 'objnum)
            sort = sort.mmap('name);
        who = who.sort(sort);
        if (!sortorder)
            who = who.reverse();
    }
    if (short)
        return ._who__short(who, title, @rest);
    else
        .ptell($code_lib.generate_listing(who, title, @rest), #[['type, 'command]]);
};

public method .will_move() {
    arg mover, place;
    
    (> pass(mover, place) <);
    if (place.is($user))
        throw(~user, "Users cannot move into other users!");
    if ((mover.is($user)) && ((mover != this()) && (!($sys.is_system(mover)))))
        throw(~user, "Only system priviledged objects can freely move users around.");
};

protected method .writers_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [(what.namef('ref)) + " is writable by:"] + (._list_objects(what.writers('literal), 'writes));
};

protected method .writes_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [(what.namef('ref)) + " is a writer for:"] + (._list_objects(what.writes(), 'writers));
};


