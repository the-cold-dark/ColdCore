
new object $builder: $player;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $foundation defined_msgs = #[["teleport", #[['branches, ["source", "dest", "actor"]]]]];
var $foundation msgs = #[["teleport", #[["actor", <$ctext_frob, [["You teleport to ", <$generator, ["dest", [], [], 'gen_dest]>, "."], #[['this, $builder]]]>], ["source", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " teleports to ", <$generator, ["dest", [], [], 'gen_dest]>, "."], #[['this, $builder]]]>], ["dest", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " teleports here from ", <$generator, ["source", [], [], 'gen_source]>, "."], #[['this, $builder]]]>]]]];
var $has_commands local = \
  #[["@realm?s", [["@realm?s", "", "@realm?s", 'realms_cmd, #[]]]], ["@child?ren|@kids", [["@child?ren|@kids", "*", "@child?ren|@kids <object>", 'children_cmd, #[[1, ['object, []]]]]]],\
  ["@par?ents",\
    [["@par?ents", "*", "@par?ents <object>", 'parents_cmd, #[[1, ['object, []]]]]]],\
  ["@build",\
    [["@build", "*", "@build <any:-conf?igure>", 'build_cmd, #[[1, ['any_opt, ["conf?igure"]]]]]]],\
  ["@attach",\
    [["@attach", "* to *", "@attach <any> to <descendant of $place>", 'attach_cmd, #[[1, ['any, []]], [3, ['descendant, [$place]]]]]]],\
  ["@destroy",\
    [["@destroy", "*", "@destroy <list object>", 'destroy_cmd, #[[1, ['list, ['object, []]]]]]]],\
  ["@dig",\
    [["@dig", "*", "@dig <any>", 'dig_cmd, #[[1, ['any, []]]]]]],\
  ["@teleport|@go",\
    [["@teleport|@go", "*", "@teleport|@go <any>", 'teleport_cmd, #[[1, ['any, []]]]]]],\
  ["@def-msg|@def-message",\
    [["@def-msg|@def-message", "*", "@def-msg|@def-message <any>", 'define_msg_cmd, #[[1, ['any, []]]]]]],\
  ["@undef-msg|@undef-message",\
    [["@undef-msg|@undef-message", "*", "@undef-msg|@undef-message <any>", 'undefine_msg_cmd, #[[1, ['any, []]]]]]],\
  ["@mv|@move",\
    [["@mv|@move", "*", "@mv|@move <objref:+c?omment>", 'move_cmd, #[[1, ['objref_opt, ["c?omment"]]]]]]],\
  ["@action-request|@ar",\
    [["@action-request|@ar", "*", "@action-request|@ar <any>", 'action_request_cmd, #[[1, ['any, []]]]]]]];
var $has_name name = ['prop, "Generic Builder", "Generic Builder"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$builder];
var $mail_list readers = [];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $builder]];
var $mail_ui subscribed = #[[$builder, [791485891, 0]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables, 'general_cache];
var $root inited = 1;
var $root managed = [$builder];
var $root manager = $builder;
var $root quota = 75000;
var $root settings = #[["home", $body_cave]];
var $thing gender = $gender_neuter;
var $user connected_at = 0;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user modes = #[];
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

protected method ._ar__claim() {
    arg args, opts, request;
    var n, id, s, cmt;
    
    n = (request.group()).name();
    id = request.id();
    if (request.claimed_on()) {
        .tell((((n + " Action Request #") + id) + " has already been claimed by ") + ((request.claimed_by()).namef('ref)));
        s = (> .prompt("Reclaim it in your name? [no] ") <);
        if ((!s) || ((s.is_boolean()) == 0))
            return "** Aborting.";
    }
    .tell(request.format());
    s = (> .prompt(("Claim this " + n) + " Action Request? [yes] ") <);
    if ((s.is_boolean()) == 0)
        return "** Aborting.";
    .tell("** Enter any remarks, or nothing for no remarks.");
    cmt = .read("** Enter \".\" to finish or \"@abort\" to abort claiming.");
    if (type(cmt) != 'list)
        return;
    if (cmt)
        request.add_comment(cmt);
    request.claim();
    return (("** You have claimed " + n) + " Action Request #") + id;
};

protected method ._ar__comment() {
    arg args, opts, request;
    var text, fmt, cmt, n, u, msg, id;
    
    n = (request.group()).name();
    id = request.id();
    .tell("** Commenting on Action Request #" + id);
    cmt = .read("** Enter \".\" to finish or \"@abort\" to abort.");
    if ((type(cmt) != 'list) || (!cmt))
        return "** No comments added.";
    request.add_comment(cmt);
    .tell((("** Comments added to " + n) + " AR #") + id);
    return ._ar__mailmsg(request, cmt);
};

protected method ._ar__dismiss() {
    arg args, opts, request;
    var line, cmt, n, id;
    
    n = (request.group()).name();
    id = request.id();
    if ((request.group()) == $dismissed_problems)
        return ((n + " Action Request #") + id) + " has already been dismissed";
    .tell(request.format());
    line = (> .prompt(((("Dismiss " + n) + " Action Request #") + id) + "? [yes] ") <);
    if ((line.is_boolean()) == 0)
        return "** Aborting.";
    .tell("** Enter any remarks, or nothing for no remarks.");
    cmt = .read("** Enter \".\" to finish or \"@abort\" to abort.");
    if (type(cmt) != 'list)
        return;
    if (cmt)
        request.add_comment(cmt);
    request.change_group($dismissed_problems);
    return ("** " + n) + " Action Request has been marked as resolved.";
};

protected method ._ar__fix() {
    arg args, opts, request;
    var line, cmt, n;
    
    n = (request.group()).name();
    if (request.resolved_on())
        return (((n + " Action Request #") + (request.id())) + " has already been resolved by ") + ((request.resolved_by()).namef('ref));
    .tell(request.format());
    line = (> .prompt(("Mark " + n) + " Action Request as resolved? [yes] ") <);
    if ((line.is_boolean()) == 0)
        return "** Aborting.";
    .tell("** Enter any final remarks, or nothing for no remarks.");
    cmt = .read("** Enter \".\" to finish or \"@abort\" to abort.");
    if (type(cmt) != 'list)
        return [];
    request.resolve();
    .tell(("** " + n) + " Action Request has been marked as resolved.");
    if (cmt)
        request.add_comment(cmt);
    return ._ar__mailmsg(request, cmt);
};

protected method ._ar__get_group() {
    arg args, opts;
    var group, groups, s, menu;
    
    groups = $argroup.children();
    if (opts) {
        if ("a?ll" in (opts.slice(1)))
            group = 'All;
        else if (!(group = (| groups.match_object((opts[1])[2]) |)))
            throw(~stop, ("Invalid AR Group '" + ((opts[1])[2])) + "'");
    } else {
        while (1) {
            menu = ["0=>ALL GROUPS"];
            for group in [1 .. listlen(groups)]
                menu += [(group + "=>") + ((groups[group]).name())];
            menu += ["X=>Exit"];
            s = .do_menu("AR Groups", "Select AR Group", @menu);
            if ((!s) || (s == "X"))
                return 0;
            if (s.is_numeric()) {
                if ((!(group = (| groups[toint(s)] |))) && (s == "0"))
                    group = 'All;
            }
            if (!group)
                .tell(["**", ("** Sorry, '" + s) + "' is not a valid group."]);
            else
                break;
        }
    }
    return group;
};

protected method ._ar__get_request() {
    arg args, cmd;
    var request, g, menu;
    
    if (!args)
        throw(~stop, ("No request specified with '" + cmd) + "'");
    [request, @args] = args;
    if ((request[1]) == "$") {
        catch any
            request = $object_lib.to_dbref(request);
        with
            throw(~stop, (traceback()[1])[2]);
        if ((!(request.is($action_request))) || (request == $action_request))
            throw(~stop, (request.namef('ref)) + " is not a Action Request.");
    } else {
        if ((request[1]) == "#")
            request = substr(request, 2);
        request = toint(request);
        if (request <= 0)
            throw(~stop, "Invalid request number #" + request);
        for g in ($argroup.children()) {
            if (dict_contains(g.requests(), request))
                return ((g.requests())[request])[1];
        }
        throw(~stop, "Unable to find action request #" + request);
    }
};

protected method ._ar__ilist() {
    arg how;
    var requests, list, g, r, pr, list, keys, choice;
    
    while (1) {
        if (how == 'mine) {
            requests = #[];
            for g in (setremove($argroup.children(), $dismissed_problems)) {
                list = filter r in (g.requests()) where ((!((r[2])[2])) && (((r[2])[5]) == this()));
                if (list)
                    requests = dict_add(requests, g, list);
            }
            .tell("** Your Un-Resolved Action Requests:");
            list = ._ar__listgrp(requests, (.linelen()) - 32, 1);
        } else {
            list = ._ar__list([], []);
            if ((!list) || (list == "Goodbye."))
                return;
        }
        pr = (> .prompt("Select Action Request, or [RET] to exit") <);
        if ((!pr) || match_template(pr, "x|ex?it"))
            return;
        if ((!(pr.is_numeric())) || (!dict_contains(list, toint(pr)))) {
            .tell("Invalid Action Request");
        } else {
            pr = toint(pr);
            keys = dict_keys(list);
            while ((choice = ._ar__iview(list[pr]))) {
                if (choice == 'next) {
                    r = pr in keys;
                    if (r < listlen(keys)) {
                        pr = keys[r + 1];
                    } else {
                        .tell("No Next Action Request.");
                        break;
                    }
                } else {
                    r = pr in keys;
                    if (r != 1) {
                        pr = keys[r - 1];
                    } else {
                        .tell("No Previous Action Request.");
                        break;
                    }
                }
            }
        }
    }
};

protected method ._ar__interactive() {
    var choice, category, bug, list, line, menu;
    
    while (choice != 'exit) {
        choice = .do_menu("Action Requests", "", "1=>Scan unclaimed open requests", "2=>Scan your open requests", "X=>Exit", 'exit);
        switch (choice) {
            case "1":
                (> ._ar__ilist('unclaimed) <);
            case "2":
                (> ._ar__ilist('mine) <);
            case 'exit:
                return "Goodbye.";
        }
    }
};

protected method ._ar__iview() {
    arg pr;
    var str, msg;
    
    msg = "[RET] Return, [N]ext, [P]rev, [C]laim, [F]ix, [D]ismiss, [A]ppend";
    while (1) {
        .tell(pr.format());
        str = (> .prompt(msg) <);
        if ((!str) || match_template(str, "x|ex?it"))
            return 0;
        if (match_template(str, "n?ext"))
            return 'next;
        if (match_template(str, "p?revious"))
            return 'prev;
        if (match_template(str, "c?laim"))
            .tell(._ar__claim([], [], pr));
        else if (match_template(str, "f?ix|r?esolve"))
            .tell(._ar__fix([], [], pr));
        else if (match_template(str, "d?ismiss"))
            .tell(._ar__dismiss([], [], pr));
        else if (match_template(str, "a?ppend|cmt|com?ment"))
            .tell(._ar__comment([], [], pr));
    }
};

protected method ._ar__list() {
    arg args, opts;
    var requests, w, all, r, g, list, group;
    
    group = (> ._ar__get_group(args, opts) <);
    if (!group)
        return "Goodbye.";
    if (group != 'All) {
        requests = filter r in (group.requests()) where (!((r[2])[2]));
        requests = #[[group, requests]];
        .tell(("** Un-Resolved " + (group.name())) + " Action Requests:");
        w = (.linelen()) - 20;
    } else {
        requests = #[];
        for g in (setremove($argroup.children(), $dismissed_problems)) {
            list = filter r in (g.requests()) where (!((r[2])[2]));
            if (list)
                requests = dict_add(requests, g, list);
        }
        all = 1;
        .tell("** ALL Un-Resolved Action Requests:");
        w = (.linelen()) - 34;
    }
    return ._ar__listgrp(requests, w, all);
};

protected method ._ar__listgrp() {
    arg requests, w, full;
    var group, request, r, id, date, summary, resolved, str, list, out;
    
    list = #[];
    out = [];
    for group in (dict_keys(requests)) {
        for request in (requests[group]) {
            id = request[1];
            [r, resolved, date, summary] = request[2];
            date = $time.format("%d-%h-%Y", date);
            if (full)
                str = strfmt("%4r: %11l %11l  %*e", id, group.name(), date, w, summary).trim('right);
            else
                str = strfmt("%4r: %13l  %*e", id, date, w, summary).trim('right);
            out += [str];
            list = dict_add(list, id, r);
        }
    }
    .tell(out);
    .tell(("--- " + listlen(dict_keys(list))) + " Total");
    return list;
};

private method ._ar__mailmsg() {
    arg request, msg;
    var u, recip, text, mail, id, fmt, c, cmts;
    
    u = request.submitted_by();
    id = request.id();
    if (valid(u) && (u.is($mail_list))) {
        text = (u.mail_name()) + " and *bugs";
        .tell("** Specify recipients for this comment, or 'none'");
        recip = (> .prompt(("** Mail comment to [" + text) + "] ") <);
        if (!recip)
            recip = text;
        if ((recip == "no") || (recip == "none"))
            return "** Not mailing.";
        recip = .parse_mail_recipient_list(recip);
        if (!recip)
            return "** No valid recipients.";
        mail = $mail_message.new_mail();
        mail.set_subject((("Comment on AR #" + id) + ": ") + (request.summary()));
        text = ["Reported By: " + (request.submitted_by())];
        text += ["Reported On: " + ($time.format("%d-%h-%Y", request.submitted_on()))];
        text += [""];
        text += ((request.text()).mmap('wrap_lines, 70, "> ", 1)).flatten();
        cmts = request.comments();
        msg = (cmts.last())[3];
        cmts = sublist(cmts, 1, listlen(cmts) - 1);
        for c in (cmts) {
            fmt = "On " + ($time.format("%d-%h-%Y ", c[1]));
            fmt += ((c[2]).namef('ref)) + " Comments:";
            text += ["", fmt] + (((c[3]).mmap('wrap_lines, 70, "> ", 1)).flatten());
        }
        text += [""] + msg;
        mail.set_text(text);
        catch any
            mail.send(@recip);
        with
            return (traceback()[1])[2];
        return "** Mail sent.";
    }
};

protected method ._ar__view() {
    arg args, opts, request;
    
    return request.format();
};

protected method .action_request_cmd() {
    arg cmdstr, cmd, args;
    var syn, opts, request, command;
    
    syn = ("Syntax: " + cmd) + " [+<ar group>] <cmt|list|view|claim|dismiss|fix> [addtl]";
    [args, opts] = (> $parse_lib.opt(args, "a?ll", "f?ull") <);
    if (!args)
        return ._ar__interactive();
    if ((listlen(args) > 1) && ((args[1]).is_numeric()))
        args = [args[2], args[1]] + sublist(args, 3);
    [command, @args] = args;
    if (match_template(command, "com?ment|cmt")) {
        request = (> ._ar__get_request(args, cmd + " comment") <);
        return (> ._ar__comment(sublist(args, 2), opts, request) <);
    } else if (match_template(command, "l?ist")) {
        return (> ._ar__list(args, opts) <);
    } else if (match_template(command, "v?iew")) {
        request = (> ._ar__get_request(args, cmd + " view") <);
        return (> ._ar__view(sublist(args, 2), opts, request) <);
    } else if (match_template(command, "cl?aim")) {
        request = (> ._ar__get_request(args, cmd + " claim") <);
        return (> ._ar__claim(sublist(args, 2), opts, request) <);
    } else if (match_template(command, "r?esolv|f?ix")) {
        request = (> ._ar__get_request(args, cmd + " fix") <);
        return (> ._ar__fix(sublist(args, 2), opts, request) <);
    } else if (match_template(command, "d?ismiss")) {
        request = (> ._ar__get_request(args, cmd + " dismiss") <);
        return (> ._ar__dismiss(sublist(args, 2), opts, request) <);
    } else {
        if ((!args) && (command.is_numeric())) {
            request = (> ._ar__get_request([command], cmd + " view") <);
            return (> ._ar__view([], opts, request) <);
        }
        return [syn, ("Unsupported command '" + command) + "'"];
    }
};

protected method .attach_cmd() {
    arg cmdstr, cmd, source, prep, dest;
    var path;
    
    (> .perms(caller(), 'command) <);
    if (!source) {
        source = .location();
    } else {
        catch any
            source = (> .match_environment(source) <);
        with
            return (traceback()[1])[2];
        if (!(source.is($place)))
            return (source.namef('ref)) + " is not a $place.";
    }
    catch ~abort, ~skip
        path = (> .build_get_path(source, dest) <);
    with
        return "Aborted.";
    catch any {
        path.attach(source, dest);
        (> path.configure(#[['named_name, 1]]) <);
    } with {
        .tell("Ack, unable to attach path because:");
        .tell("  " + ((traceback()[1])[2]));
        (| path.destroy() |);
        return;
    }
    return ("Successfully attached path " + (path.name())) + ".";
};

protected method .build_cleanup() {
    arg @what;
    var obj;
    
    (> .perms(caller(), definer()) <);
    for obj in (what) {
        if (valid(obj[1]) && (obj[2])) {
            .tell(("Destroying " + ((obj[1]).name())) + "...");
            (| (obj[1]).destroy() |);
        }
    }
};

protected method .build_cmd() {
    arg cmdstr, cmd, args;
    var dest, source, path, set, str, i;
    
    (> .perms(caller(), 'command) <);
    str = (args[1]).join();
    source = .location();
    args = args[2];
    if (!(| source.will_attach('source) |))
        return "This room is not publicly extendable.";
    
    // Establish the objects
    catch any {
        dest = (> .build_get_location(str) <);
        if (!(| (dest[1]).will_attach('dest) |)) {
            .tell(((dest[1]).name()) + " will not allow you to attach to it!");
            .build_cleanup(dest);
            return "** Build Aborted **";
        }
        path = (> .build_get_path(source, dest[1]) <);
    } with {
        if (dest)
            .build_cleanup(dest);
        if (path)
            .build_cleanup([path, 1]);
        if (error() == ~abort)
            return "** Build Aborted **";
        return [(traceback()[1])[2], "** Build Aborted **"];
    }
    .tell(("Completed building to " + ((dest[1]).name())) + ".");
    if ((i = "conf?igure" in (args.slice(1)))) {
        if (!((args[i])[3]))
            return "Skipping post-configuration.";
    }
    .tell("post-configuration..");
    
    // Flesh them out      
    set = #[['named_name, 1]];
    if (dest[2])
        (> (dest[1]).configure(set) <);
    if (path)
        (> path.configure(set) <);
    return "Completed post-configuration.";
};

protected method .build_generate_path() {
    arg source, dest, spname, @dpname;
    var parent, path, sname, dname, line;
    
    sname = spname[1];
    [parent, path] = (> .build_parse_name(sname[1], $path) <);
    sname = replace(sname, 1, path);
    spname = replace(spname, 1, sname);
    path = (| source.match_environment(path) |);
    if (path) {
        if (path.is($path))
            throw(~stop, (((sname[1]) + " is already a path from ") + (source.name())) + ".");
        if (path.source(dest))
            throw(~stop, (path.namef('ref)) + " is alread linked.");
    }
    if (dpname) {
        [dpname] = dpname;
        dname = dpname[1];
        [parent, path] = (> .build_parse_name(dname[1], $path) <);
        dname = replace(dname, 1, path);
        dpname = replace(dpname, 1, dname);
        path = (| dest.match_environment(path) |);
        if (path) {
            if (path.is($path))
                throw(~stop, (((dname[1]) + " is already a path from ") + (dest.name())) + ".");
            if (path.source(source))
                throw(~stop, (path.namef('ref)) + " is alread linked.");
        }
    }
    if (!path) {
        catch any
            path = (> parent.new() <);
        with
            throw(~stop, "Unable to create path: " + ((traceback()[1])[2]));
    }
    catch any {
        path.attach(source, dest);
        .build_set_name(path, @spname, source);
        if (dpname) {
            path.attach(dest, source);
            .build_set_name(path, @dpname, dest);
        }
    } with {
        .tell(("Unable to attach " + (path.name())) + " because: ");
        .tell("  " + ((traceback()[1])[2]));
        line = (> .prompt("Continue building? ") <);
        if (line in ["no", "n"])
            throw(~abort, "Aborted");
    }
    return path;
};

protected method .build_get_location() {
    arg name;
    var dest, m, realm, parent, str;
    
    (> .perms(sender()) <);
    .build_hint(1);
    if (name) {
        if ((m = match_template(name, "to *")))
            name = m[2];
        name = (| $code_lib.parse_name(name) |);
    }
    while (!name) {
        catch any {
            name = (> .build_get_name("Destination: ") <);
            str = (name[1])[1];
            if ((m = regexp(str, "^ *\$([a-z0-9_]+) *(.*)$"))) {
                name = replace(name, 1, replace(name[1], 1, m[2]));
                catch ~namenf, ~symbol {
                    parent = (> lookup(tosym(m[1])) <);
                } with {
                    .tell((traceback()[1])[1]);
                    continue;
                }
                if (!(parent.is($place))) {
                    .tell(("Parent object " + (parent.namef('ref))) + " is not a place!");
                    continue;
                } else if ((!(parent.has_flag('fertile))) && (!(parent.is_writable_by(this())))) {
                    .tell(("Parent object " + (parent.namef('ref))) + " is not fertile!");
                    continue;
                }
            }
        } with {
            if (error() == ~skip) {
                .tell("You cannot skip this step!");
                continue;
            }
            rethrow(error());
        }
    }
    
    // first try to see if it already exists--only do this if they used
    // the direct $dbref too many conflicts otherwise.
    catch any {
        dest = (> $object_lib.to_dbref((name[1])[1]) <);
        (dest.is($place)) || throw(~place, (dest.namef('ref)) + " is not a place.");
        return [dest, 0];
    }
    
    // create it
    .build_hint(2);
    if (!parent)
        dest = (> ($place_lib.get_default('place)).spawn() <);
    else
        dest = (> parent.spawn() <);
    .build_set_name(dest, @name);
    .build_hint(4);
    catch any {
        realm = (> .build_query_realm(dest) <);
    } with {
        if (error() == ~skip)
            return dest;
        .build_cleanup([dest, 1]);
        rethrow(error());
    }
    
    // set the realm
    dest.set_setting_realm($place, "realm", realm);
    
    // add this room to realm's 'local' variable
    realm.add_local(dest);
    
    // okee, done
    return [dest, 1];
};

protected method .build_get_name() {
    arg prompt, @def;
    var name, out;
    
    .build_hint(3);
    while (!out) {
        name = (> .build_prompt(prompt, @def) <);
        if (!(out = (| $code_lib.parse_name(name) |)))
            .tell("Invalid name.");
    }
    return out;
};

protected method .build_get_path() {
    arg source, dest;
    var eleave, earrive, opp, t, path;
    
    // Get the exits
    // catch any {
    while (!path) {
        eleave = (> .build_query_exit(source, dest) <);
        if (eleave) {
            // try really hard to figure this out
            if (!(opp = $place_lib.opposite_direction((eleave[1])[1]))) {
                for t in (eleave[2]) {
                    t = strsed(t, "[^a-z]+", "", "g");
                    if ((opp = $place_lib.opposite_direction(t)))
                        break;
                }
            }
            if (opp) {
                opp = strsed(explode(opp, "|")[1], "[^a-z]+", "", "g");
                earrive = (> .build_query_exit(dest, source, opp) <);
            } else {
                earrive = (> .build_query_exit(dest, source) <);
            }
        }
    
        //} with {
        //    if (eleave) {
        //        .build_cleanup([eleave, 1]);
        //        if (earrive)
        //            .build_cleanup([earrive, 1]);
        //    }
        //    rethrow(error());
        //}
        catch any
            path = .build_generate_path(source, dest, eleave, earrive);
        with
            .tell((traceback()[1])[2]);
    }
    return path;
};

protected method .build_hint() {
    arg n;
    
    (> .perms(sender()) <);
    if ((| .get_setting("experienced", $user) |))
        return;
    .tell($place_lib.build_hint(n));
};

protected method .build_parse_name() {
    arg str, class;
    var m, parent, what;
    
    if ((m = regexp(str, "^ *\$([a-z0-9_]+) *: *(.*)$"))) {
        parent = m[1];
        what = m[2];
        if (parent) {
            catch ~namenf, ~symbol
                parent = (> lookup(tosym(parent)) <);
            with
                throw(~stop, ("The object '$" + parent) + "' is not valid.");
            if (!(parent.is(class)))
                throw(~stop, ((("Parent object " + parent) + " is not ") + ((class.objname()).add_indefinite())) + "!");
        }
    } else {
        what = str;
    }
    if (!parent)
        parent = $place_lib.get_default(class.objname());
    return [parent, what];
};

protected method .build_prompt() {
    arg prompt, @def;
    var name, ans;
    
    [(def ?= "")] = def;
    while (!ans) {
        ans = (> .prompt(prompt) <);
        if (ans == "@skip")
            throw(~skip, "Skipped");
        if (!ans) {
            if (!def)
                continue;
            ans = def;
        }
    }
    return ans;
};

protected method .build_query_exit() {
    arg source, dest, @args;
    var exit, line, name, def, from, str, m, parent;
    
    from = "from " + (source.name());
    line = (("Exit " + from) + " to ") + (dest.name());
    if (args) {
        def = args[1];
        line += (" [" + def) + "] ";
    } else {
        line += ": ";
    }
    while (!name) {
        catch ~skip
            name = (> .build_get_name(line, def) <);
        with
            return 0;
        if (((name[1])[1]) == "@none")
            return 0;
    }
    return name;
};

protected method .build_query_realm() {
    arg there;
    var line, realm, r, prompt;
    
    prompt = ((("What realm is " + (there.name())) + " in? [") + (((.location()).realm()).name())) + "] ";
    while (!realm) {
        line = (> .build_prompt(prompt, tostr((.location()).realm())) <);
        if (!line) {
            realm = (.location()).realm();
        } else if (line == "@realms") {
            r = ($place_lib.known_realms()).union($realm.descendants());
            .tell(["Realms:", ""] + ((r.mmap('name)).prefix("    ")));
        } else {
            realm = $place_lib.match_realm(line);
            if (!realm) {
                .tell(("Unknown realm \"" + line) + "\", try @realms.");
            } else if (!(realm.is($realm))) {
                .tell((realm.namef('ref)) + " is not a realm, try @realms.");
                realm = 0;
            }
        }
    }
    return realm;
};

protected method .build_set_name() {
    arg obj, name, templates, @args;
    var t, x;
    
    catch any {
        obj = obj.set_name(@name, @args);
    } with {
        .tell("Unable to set name; " + ((traceback()[1])[2]));
        .tell("Setting name as " + (obj.objname()));
        obj = obj.set_name(tostr(obj.objname()));
    }
    for t in (templates)
        obj = obj.add_name_template(t, @args);
    return obj;
};

protected method .children_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [("Children of " + (what.namef('xref))) + ":"] + (._list_objects(what.children(), 'parents));
};

root method .core_builder() {
    // for now we dont core the bug system
    (| .del_command("@bug?s <any>", 'bug_cmd) |);
    (| .del_method('bug_cmd) |);
};

protected method .define_msg_cmd() {
    arg cmdstr, cmd, args;
    var what, opts, def, o, i, br, ref, compiler, eval, getter;
    
    (> .perms(caller(), 'command) <);
    [args, opts] = (> $parse_lib.opt(args, "b?ranches", "c?ompiler", "e?valuator", "g?etter") <);
    args = join(args);
    what = split(args, " *: *");
    if (listlen(what) != 2)
        return "Invalid message reference " + args;
    [def, what] = what;
    what = what.trim();
    if (match_regexp(what, "[=.]"))
        return ("You cannot set the default with " + cmd) + ".";
    def = (> .match_env_nice(def) <);
    if (!(def.is_writable_by(this())))
        return ("You cannot define messages on " + (def.namef('ref))) + ".";
    if (type(def) == 'frob)
        return "You cannot define messages on a frob.";
    catch any {
        (> def.define_msg(what) <);
        ref = (def + ":") + what;
        .tell(("Message " + ref) + " defined.");
    } with {
        return (traceback()[1])[2];
    }
    o = opts.slice(1);
    if ((i = "b?ranches" in o)) {
        br = (((opts[i])[4]).trim()).split(" *, *");
        catch any {
            def.set_msg_attr(what, 'branches, br);
            .tell("Message branches defined:");
            for i in (br)
                .tell((("  " + ref) + ".") + i);
        } with {
            .tell((traceback()[1])[2]);
        }
    }
    if ((i = "e?valuator" in o)) {
        eval = (opts[i])[4];
        if (!eval) {
            .tell("No evaluator specified with +evaluator=??");
        } else {
            eval = (> .match_env_nice(eval) <);
            if (!(eval.is($evaluator)))
                return "Invalid evaluator object: " + evaluator;
            catch any {
                def.set_msg_attr(what, 'evaluator, eval);
                .tell((("Set evaluator for " + ref) + " to ") + eval);
            } with {
                .tell((traceback()[1])[2]);
            }
        }
    }
    if ((i = "c?ompiler" in o)) {
        compiler = (opts[i])[4];
        if (!compiler) {
            .tell("No compiler specified with +compiler=??");
        } else {
            compiler = (> .match_env_nice(compiler) <);
            if (!(compiler.is($compiler)))
                .tell("Invalid compiler object: " + compiler);
            catch any {
                def.set_msg_attr(what, 'compiler, compiler);
                .tell((("Set compiler for " + ref) + " to ") + compiler);
            } with {
                .tell((traceback()[1])[2]);
            }
        }
    }
    if ((i = "g?etter" in o)) {
        getter = (opts[i])[4];
        if (!getter) {
            .tell("No getter specified with +getter=??");
        } else {
            getter = (> tosym(getter) <);
            catch any {
                def.set_msg_attr(what, 'getter, getter);
                .tell((("Set getter for " + ref) + " to ") + getter);
            } with {
                .tell((traceback()[1])[2]);
            }
        }
    }
};

protected method .destroy_cmd() {
    arg cmdstr, cmd, objs;
    var name, ans, obj, fail;
    
    (> .perms(caller(), 'command) <);
    cmd = cmd.trim();
    for obj in (filter obj in (objs) where (obj.is($user))) {
        .tell(("You shouldn't @destroy users (" + (obj.name())) + "), use @reap.");
        fail++;
    }
    if (fail) {
        .tell("Destroying a user directly may not cleanup everything properly.");
        .tell("Objects managed by the user will be given to $reaper.");
        ans = (> .prompt("Given this information, do you want to continue? [no] ") <);
        if (!(ans in ["y", "yes"]))
            return "Ok, aborting..";
    }
    for obj in (objs) {
        catch any {
            name = obj.namef('xref);
            (> obj.destroy() <);
            if (valid(obj))
                .tell(("Unable to destroy " + name) + " immediately.");
            else
                .tell(("Successfully destroyed " + name) + ".");
        } with {
            return (traceback()[1])[2];
        }
    }
};

protected method .dig_cmd() {
    arg cmdstr, cmd, args;
    var m, syn, name, dest, dnew, parent, name, dname, lname, arrive, aname, path, loc;
    
    (> .perms(caller(), 'command) <);
    syn = ["Syntax: `@dig <new place>` OR", "        `@dig <leaving exit>[;<arriving exit>] to <objref or new place>`", "You may also want to try @build."];
    if (!args)
        return syn;
    loc = .location();
    
    // are they essentially just @spawn'ing?
    if (!(m = match_template(args, "* to *"))) {
        if (match_regexp(args, "^\$[a-z0-9_]+$"))
            return syn;
        if (!(name = (> $code_lib.parse_name(args) <)))
            return "Invalid name.";
        [parent, dest] = (> .build_parse_name((name[1])[1], $place) <);
        name = replace(name, 1, replace(name[1], 1, dest));
        catch any
            dest = (> parent.spawn() <);
        with
            return (traceback()[1])[2];
        .build_set_name(dest, @name);
        dest.set_realm(loc.realm());
        return ("New place created " + (dest.namef('ref))) + ".";
    }
    
    // can we extend from this room?
    if (!(| loc.will_attach('source) |))
        return "This room is not publicly extendable.";
    
    // do some basic parsing before we needlessly create anything
    [args, m, name] = m;
    [lname, (aname ?= "")] = split(args, " *[|;] *");
    if ((!lname) || (!name))
        return syn;
    
    // create or parse the destination first
    name = name.trim();
    if (match_regexp(name, "^\$[a-z0-9_]+$")) {
        if (!(dest = (| lookup(tosym(substr(name, 2))) |)))
            return "Invalid object name.";
        if (!(dest.is($place)))
            return ("Destination " + (dest.namef('ref))) + " is not a place.";
    } else {
        if (!(name = (> $code_lib.parse_name(name) <)))
            return "Invalid name.";
        [parent, dest] = (> .build_parse_name((name[1])[1], $place) <);
        name = replace(name, 1, replace(name[1], 1, dest));
        catch any
            dest = (> parent.spawn() <);
        with
            return (traceback()[1])[2];
        .build_set_name(dest, @name);
        dest.set_realm(loc.realm());
        .tell(("Created new place " + (dest.namef('ref))) + ".");
        dnew = 1;
    }
    
    // now parse and attach the exits
    // first the leaving exit..
    if (!(name = (| $code_lib.parse_name(lname) |)))
        return ("Invalid exit name '" + lname) + "'";
    
    //catch ~stop {
    //    leave = (> .build_create_and_attach_exit(name, loc, dest) <);
    //
    // (> .build_attach_exit(leave, loc, dest) <);
    //    .tell("Attached exit " + leave.name() + " from " + loc.name());
    //} with {
    //    .tell(traceback()[1][2]);
    //    return .build_cleanup([dest, dnew]);
    //}
    // see if they want a return exit, if they didn't say anything
    aname = aname.trim();
    if (!aname) {
        if (!(dname = $place_lib.opposite_direction(lname)))
            dname = lname;
        arrive = (> (.prompt(("Specify return exit, or 'none' for no return exit [" + dname) + "] ")).trim() <);
        if (!arrive)
            aname = dname;
        else if (arrive != "none")
            aname = strsub(arrive, "|", ",");
    }
    
    // now the (optional) arrival exit
    if (aname) {
        if (!(dname = (| $code_lib.parse_name(aname) |)))
            return ("Invalid exit name '" + cname) + "'";
    
        //    catch ~stop {
        //       arrive = (> .build_create_and_attach_exit(name, dest, loc) <);
        // (> .build_attach_exit(arrive, dest, loc) <);
        //        .tell("Attached exit " + arrive.name() + " from " + dest.name());
        //    } with {
        //        .tell(traceback()[1][2]);
        // thirty second leeway guess to if we created it or not
        // ... what I do to keep from wrapping
        //        dnew = dnew.or(leave.created_on() > time() - 30 ? 2 : 0);
        //        return .build_cleanup([dest, dnew.and(1)], [leave, dnew.and(2)]);
        //    }
    }
    catch ~stop {
        if (aname) {
            path = (> .build_generate_path(loc, dest, name, dname) <);
    
            // (> .build_attach_exit(arrive, dest, loc) <);
        } else {
            path = (> .build_generate_path(loc, dest, name) <);
        }
        .tell((("Attached way " + (path.name())) + " from ") + (loc.name()));
    } with {
        .tell((traceback()[1])[2]);
    
        // thirty second leeway guess to if we created it or not
        // ... what I do to keep from wrapping
        dnew = dnew.or((path && ((path.created_on()) > (time() - 30))) ? 2 : 0);
        return .build_cleanup([dest, dnew.and(1)], [path, dnew.and(2)]);
    }
};

protected method .move_cmd() {
    arg cmdstr, cmd, args;
    var what, dest, loc, opts, src, fromto;
    
    (> .perms(caller(), 'command) <);
    [src, args, opts] = args;
    if (args && (type(args[1]) == 'string)) {
        if ((args[1]) == "to")
            args = delete(args, 1);
        if (!args)
            throw(~stop, "You must move to somewhere.");
        catch ~obj, ~namenf, ~ambig
            dest = $parse_lib.ref(join(args));
        with
            throw(~stop, (traceback()[1])[2]);
    } else {
        dest = args;
    }
    what = src[2];
    dest = dest[2];
    catch any {
        loc = what.location();
        fromto = ((" from " + ((| loc.name() |) || $nowhere)) + " to ") + (dest.name());
        (| what.tell(((("You are suddenly yanked" + fromto) + " by ") + (.name())) + ".") |);
        (> what.move_to(dest) <);
    
        // hook into messages eventually
        (| loc.announce((what.name()) + " suddenly disappears.") |);
        (| dest.announce((what.name()) + " suddenly appears.", what) |);
        return (("You move " + (what.name())) + fromto) + ".";
    } with {
        (| what.tell(("You feel as if " + (.name())) + " was incapable of moving you, you did not go anywhere.") |);
        return (traceback()[1])[2];
    }
};

protected method .parents_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    return [((("Parent" + ((((.parents()).length()) > 1) ? "s" : "")) + " of ") + (what.namef('ref))) + ":"] + (._list_objects(what.parents(), 'children));
};

protected method .realms_cmd() {
    arg cmdstr, cmd;
    var x, realms;
    
    (> .perms(caller(), 'command) <);
    realms = ($place_lib.known_realms()).union($realm.descendants());
    .tell(["Realms:", ""] + ((realms.mmap('name)).prefix("    ")));
};

protected method .teleport() {
    arg dest;
    var m, source, vars;
    
    source = .location();
    catch any {
        .move_to(dest);
    } with {
        .tell((traceback()[1])[2]);
        return 0;
    }
    vars = #[["$actor", this()], ["actor", .name()], ["$source", source], ["source", source.name()], ["$dest", dest], ["dest", dest.name()]];
    m = .eval_message("teleport", $builder, vars);
    dest.announce(m);
    source.announce(m);
};

protected method .teleport_cmd() {
    arg cmdstr, com, dest;
    var loc, p;
    
    (> .perms(caller(), 'command) <);
    if (!dest) {
        .tell("Specify a destination.");
        return;
    }
    if (dest == "home")
        loc = .home();
    else
        loc = (| .match_environment(dest) |);
    
    // if we have still not found a location...
    if (!loc) {
        catch any {
            loc = $place_db.search(dest);
        } with {
            switch (error()) {
                case ~ambig:
                    .tell("Several rooms match that name: " + ((((traceback()[1])[3]).mmap('namef)).to_english()));
                case ~namenf:
                    .tell(("Unable to find place \"" + dest) + "\".");
                    return;
                default:
                    return (traceback()[1])[2];
            }
        }
    }
    if (!loc) {
        .tell(("Unable to find place \"" + dest) + "\".");
        return;
    }
    if (loc == (.location())) {
        .tell("You are already there!");
        return;
    }
    if (!(.teleport(loc)))
        .tell("Sorry.");
};

protected method .undefine_msg_cmd() {
    arg cmdstr, cmd, args;
    var what, opts, def;
    
    (> .perms(caller(), 'command) <);
    
    // it niggles the string enough to 'clean' up little mistakes
    [args, opts] = (> $parse_lib.opt(args, "b?ranches", "c?ompiler") <);
    args = join(args);
    what = split(args, " *: *");
    if (listlen(what) != 2)
        return "Invalid message reference " + args;
    [def, what] = what;
    what = what.trim();
    def = (> .match_env_nice(def) <);
    if (!(def.is_writable_by(this())))
        return ("You cannot define messages on " + (def.namef('ref))) + ".";
    catch any {
        (> def.undefine_msg(what) <);
        .tell(((("Message " + def) + ":") + what) + " undefined.");
    } with {
        return (traceback()[1])[2];
    }
};


