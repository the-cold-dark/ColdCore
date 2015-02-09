
new object $admin: $programmer;

var $admin shutdown_started = 0;
var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $foundation defined_msgs = #[["mojo-on", #[['branches, ["general", "actor"]]]], ["mojo-off", #[['branches, ["general", "actor"]]]], ["mojo-look", #[['branches, ["general", "actor"]]]]];
var $foundation msgs = #[["mojo-on", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, "'s eyes glow as Mojo courses through ", <$generator, ["actor.pp", [], [], 'gen_actorpp]>, " body."], #[['this, $admin]]]>], ["actor", <$ctext_frob, [["Your eyes glow as Mojo courses through your body."], #[['this, $admin]]]>]]], ["mojo-off", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, "'s eyes stop glowing as the Mojo leaves ", <$generator, ["actor.pp", [], [], 'gen_actorpp]>, " body."], #[['this, $admin]]]>], ["actor", <$ctext_frob, [["Your eyes stop glowing as the Mojo leaves your body."], #[['this, $admin]]]>]]], ["mojo-look", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, "'s eyes ", <$generator, ["mojo.what", [], [], 'gen_mojowhat]>, "glow from Mojo."], #[['this, $admin]]]>], ["actor", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, "'s eyes ", <$generator, ["mojo.what", [], [], 'gen_mojowhat]>, "glow from mojo."], #[['this, $admin]]]>]]]];
var $has_commands local = \
  #[["@del-t?ask|@kill", [["@del-t?ask|@kill", "*", "@del-t?ask|@kill <any>", 'del_task_cmd, #[[1, ['any, []]]]]]],\
  ["@backup",\
    [["@backup", "", "@backup", 'backup_cmd, #[]]]], ["@shutdown", [["@shutdown", "*", "@shutdown <any>", 'shutdown_cmd, #[[1, ['any, []]]]]]],\
  ["@mojo",\
    [["@mojo", "*", "@mojo <any>", 'mojo_cmd, #[[1, ['any, []]]]]]],\
  ["@adjust|@promote",\
    [["@adjust|@promote", "* to *", "@adjust|@promote <user> to <any>", 'adjust_cmd, #[[1, ['user, []]], [3, ['any, []]]]]]],\
  ["@new-password|@newpw?d",\
    [["@new-password|@newpw?d", "*", "@new-password|@newpw?d <user>", 'new_password_cmd, #[[1, ['user, []]]]]]],\
  ["@task?s",\
    [["@task?s", "*", "@task?s <any>", 'tasks_cmd, #[[1, ['any, []]]]]]],\
  ["@core",\
    [["@core", "*", "@core <list object>", 'core_cmd, #[[1, ['list, ['object, []]]]]]]],\
  ["@rehash-all",\
    [["@rehash-all", "*", "@rehash-all <any:-p?urge>", 'rehash_all_cmd, #[[1, ['any_opt, ["p?urge"]]]]]]],\
  ["@reap",\
    [["@reap", "*", "@reap <any>", 'reap_cmd, #[[1, ['any, []]]]]]],\
  ["@quota",\
    [["@quota", "* to *", "@quota <object> to <any:+e?xempt>", 'quota_cmd, #[[1, ['object, []]], [3, ['any_opt, ["e?xempt"]]]]]]],\
  ["@kick",\
    [["@kick", "*", "@kick <any>", 'kick_cmd, #[[1, ['any, []]]]]]],\
  ["@chman?age",\
    [["@chman?age", "*", "@chman?age <any>", 'chmanage_cmd, #[[1, ['any, []]]]]]],\
  ["@scour",\
    [["@scour", "*", "@scour <any>", 'scour_cmd, #[[1, ['any, []]]]]]]];
var $has_name name = ['prop, "Generic Admin", "Generic Admin"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$admin];
var $mail_list readers = [];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $admin]];
var $mail_ui subscribed = #[[$admin, [791485891, 0]]];
var $programmer eval_prefix = #[["me", "me = this()"], ["here", "here = this().location()"]];
var $root created_on = 796268969;
var $root defined_settings = #[["admin-role", #[]]];
var $root flags = ['methods, 'code, 'core, 'variables, 'general_cache];
var $root inited = 1;
var $root managed = [$admin];
var $root manager = $admin;
var $root quota = 75000;
var $root settings = #[["home", $body_cave], ["admin-role", ""]];
var $thing gender = $gender_neuter;
var $user connected_at = 0;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user modes = #[];
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

private method ._reap__list() {
    arg thresh;
    var t, reap, u, tl, m, v, n, last;
    
    t = time();
    reap = [];
    .tell([("--- Reap Possibilities (Not connected for " + ($time.to_english(thresh))) + ")", strfmt("E %21L %3l %10l %10l %10l %l", "User", "MNG", "Created", "Notified", "Last On", "Idle"), strfmt("- %21L %3l %10l %10l %10l %l", "----", "---", "-------", "-------", "-------", "----")]);
    for u in ($user.descendants()) {
        if ((u.connected()) || ((u.has_flag('core)) || (u.is($admin))))
            continue;
        tl = (last = abs(u.connected_at()));
        if ((tl + thresh) > t)
            continue;
        m = "";
        tl = t - tl;
        if (tl / 31449600) {
            v = tl / 31449600;
            m = (v + " yr") + ((v > 1) ? "s" : "");
            tl = tl % 31449600;
        }
        if (tl / 2592000) {
            v = tl / 2592000;
            m += (((m ? " " : "") + v) + " mnth") + ((v > 1) ? "s" : "");
            tl = tl % 2592000;
        }
        if (tl / 604800) {
            v = tl / 604800;
            m += (((m ? " " : "") + v) + " wk") + ((v > 1) ? "s" : "");
        }
        if (!m)
            m = "newborn";
        if (u._reap__notified())
            n = $time.format("%e-%b-%y", u._reap__notified());
        else
            n = "";
        reap += [[last, strfmt("%s %21L %3l %10l %10l %10l %l", ((u.get_setting("rl-email", $user_info))[2]) ? " " : "!", u.name(), listlen(u.managed()), $time.format("%e-%b-%y", u.created_on()), n, $time.format("%e-%b-%y", last), m)]];
    }
    .tell(((reap.sort()).slice(2)).reverse());
    return "---";
};

private method ._reap__mail() {
    arg str, interval;
    var email, msg, subj, ps, po, user;
    
    user = (| $user_db.search(str) |);
    if (!user) {
        catch any
            user = $object_lib.to_dbref(str);
        with
            return ("Unable to find user " + str) + ".";
    }
    email = user.user_info("email");
    ps = (user.gender()).pronoun('ps);
    po = (user.gender()).pronoun('po);
    subj = ("[" + ($motd.server_name())) + "] IMMINENT USER REAPING";
    msg = (((((((((("Your user account " + (user.namef('ref))) + " on ") + ($motd.server_name())) + " is slated for reaping, possibly due to inactivity.  If you do not connect within ") + ($time.to_english(interval))) + " ") + ps) + " and all objects managed by ") + po) + " will be destroyed.  This is an automatic message sent to the supplied email address.  If this message is in error simply discard it.").wrap_lines(75);
    .tell("---");
    .tell("To: " + email);
    .tell("Subject: " + subj);
    .tell("");
    .tell(msg);
    .tell("---");
    if (!(> $parse_lib.ask("Send this email message? [yes] ", "(yes|y)", "yes") <))
        return "Message not sent.";
    catch any {
        $smtp.sendmail('admin, email, subj, msg);
    } with {
        .tell_traceback(traceback());
        return "** Unable to send message";
    }
    user.set_reap_notified(time());
    return "Message sent.";
};

private method ._reap__user() {
    arg str;
    var user, ans, managed, obj, reapq, nuke, name, keep;
    
    user = (| $user_db.search(str) |);
    if (!user) {
        catch any
            user = $object_lib.to_dbref(str);
        with
            return ("Unable to find user " + str) + ".";
    }
    if (!(> $parse_lib.ask(("Reap " + (user.namef('ref))) + "? [no] ") <))
        return "Aborting reap.";
    managed = setremove(user.managed(), user);
    nuke = (keep = []);
    reapq = ["", ("Reap this object managed by " + (user.namef('ref))) + "? [yes] "];
    for obj in (managed) {
        .tell("");
        .tell($object_lib.format_object(obj, 0));
        if ((> $parse_lib.ask(reapq, "(yes|y)", "yes") <))
            nuke = setadd(nuke, obj);
        else
            keep = setadd(keep, obj);
    }
    if (nuke) {
        .tell(["WRT TST Object", "--- --- ------"]);
        for obj in (nuke)
            .tell(strfmt("%3r %3r %s", listlen(obj.writers('literal)), listlen(obj.trusted('literal)), obj.namef('ref)));
        .tell("");
        if ((> $parse_lib.ask("Destroy these objects? [yes] ", "(yes|y)", "yes") <)) {
            for obj in (nuke) {
                // must have been nuked already
                if (!valid(obj))
                    next;
                name = obj.namef('ref);
                catch any {
                    obj.destroy();
                } with {
                    .tell("--- While Destroying " + name);
                    .tell_traceback(traceback());
                }
            }
        }
    }
    for obj in (keep)
        .tell((("Changed Manager for " + (obj.namef('ref))) + " to ") + ($reaper.namef('ref)));
    if (!(> $parse_lib.ask(("Destroy " + (user.namef('ref))) + "? ") <))
        return "Not destroying " + (user.namef('ref));
    name = user.namef('ref);
    catch any {
        user.destroy();
    } with {
        .tell("--- While Destroying " + name);
        .tell_traceback(traceback());
    }
    return ("Done reaping " + name) + ".";
};

protected method .adjust_cmd() {
    arg cmdstr, cmd, who, prep, str;
    var i, what, p, pwd, o, email, valid;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    valid = #[["user", $user], ["player", $player], ["builder", $builder], ["programmer", $programmer], ["admin", $admin]];
    what = (str.explode()).last();
    if (!(valid.contains(what)))
        return ("Promote to: " + ((valid.keys()).to_english())) + ".";
    
    // mail them the password--do this first incase we fail here
    if ($guest in (who.parents())) {
        who.set_setting("title", $user, "");
        pwd = $code_lib.random_password();
        who.set_password(pwd);
        email = who.user_info("email");
        if (!email)
            return (who.namef('ref)) + " does not have an email address!";
        catch any {
            $smtp.sendmail('admin, email, ("[" + ($motd.server_name())) + "] password change.", [((("The password for the user " + (who.name())) + " on ") + ($motd.server_name())) + " has been set as:", "", "    " + pwd, "", "This is an automatic message sent to the supplied address.  If this message is in error simply discard it.", "", "If no connections are made to this user within a week it will be purged."]);
        } with {
            if (error() == ~error) {
                .tell(("While trying to email '" + email) + "':");
                .tell((traceback()[1])[2]);
                return "** Aborting adjustment **";
            }
            .tell_traceback(traceback());
            return "** Unable to send mail message, no changes made **";
        }
    }
    
    // selectively cleanup their 'new' parents list, retain special parents
    p = who.parents();
    for o in ([$guest] + (valid.values()))
        p = setremove(p, o);
    
    // add the parent we care about to the front, call chparents()
    // we are admins, we can handle tracebacks if they occur.
    (> who.chparents(valid[what], @p) <);
    
    // update caches.
    who.cache_client_init();
    
    // let'em know what we did
    what = what.add_indefinite();
    who.tell((((.name()) + " has made you ") + what) + ".");
    
    // if we changed their password, let them know that too
    if (pwd) {
        who.tell(("** Your password has been emailed to " + email) + " **");
        who.tell("** You can change it with the command: `@password` **");
    }
    (.location()).announce(((("*poof* " + (who.name())) + " is now ") + what) + ".", who, this());
    return ((("Ok, " + (who.name())) + " is now ") + what) + ".";
};

protected method .backup_cmd() {
    arg cmdstr, com;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    .tell("Starting backup.");
    $sys.do_backup(this());
    .tell("Done.");
};

protected method .check_mojo() {
    arg @benice;
    var answer, wording;
    
    if (benice)
        wording = " may require ";
    else
        wording = " requires ";
    if (!(this() in ($sys.system()))) {
        answer = (> .prompt(("This command" + wording) + "Mojo, turn it on? [yes] ") <);
        if (answer in ["no", "n"]) {
            .tell("Ok, aborting.");
            if (benice)
                return;
            throw(~stop, "");
        }
        .mojo_cmd("", "", "on");
    }
};

protected method .chmanage_cmd() {
    arg cmdstr, cmd, args;
    var obj, manager;
    
    (> .perms(caller(), 'command) <);
    args = (args.replace(" to ", " ")).explode();
    if ((!args) || ((args.length()) != 2))
        (> .tell_error(cmd + " <object> [to] <user>") <);
    obj = .match_env_nice(args[1]);
    manager = .match_env_nice(args[2]);
    if ((!(manager.is($user))) && (!(.is($admin))))
        return "Sorry you can only set users as managers.";
    catch any
        (> obj.change_manager(manager) <);
    with
        return (traceback()[1])[2];
    return ((("Manager on " + (obj.namef('xref))) + " changed to ") + (manager.namef('xref))) + ".";
};

protected method .core_cmd() {
    arg cmdstr, cmd, objs;
    var o, obj;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    for obj in (objs) {
        obj.add_flag('core);
        obj.change_manager(obj);
        for o in (obj.writers('literal))
            obj.del_writer(o);
        refresh();
        .tell(("Made " + (obj.namef('core))) + " a core object.");
    }
};

protected method .del_task_cmd() {
    arg cmdstr, com, args;
    var syn, sys, task, t;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    syn = ("Syntax: `" + com) + " [*]<task>`";
    args = explode(args);
    if (!args)
        return syn;
    for t in (args) {
        if (t && ((t[1]) == "*")) {
            t = substr(t, 2);
            sys = 1;
        }
        task = toint(t);
        if (!task) {
            .tell(syn, ("Invalid task '" + t) + "'");
            continue;
        }
        if (sys) {
            $scheduler.cancel(task);
            .tell(("System task " + tostr(task)) + " canceled.");
        } else {
            catch any
                $scheduler.del_task(task);
            with
                (> .tell_error(syn, (traceback()[1])[2]) <);
            .tell(("Task " + tostr(task)) + " deleted.");
        }
    }
};

public method .description() {
    arg flags;
    var vars, m;
    
    vars = #[["$actor", this()], ["actor", .name()], ["mojo.what", ""]];
    if (!(this() in ($sys.system())))
        vars = vars.add("mojo.what", "do not ");
    m = .eval_message("mojo-look", $admin, vars);
    return (> pass(flags) <) + [m];
};

protected method .finger_cmd() {
    arg cmdstr, cmd, who;
    var out, tmp;
    
    out = (> pass(cmdstr, cmd, who) <);
    if (!($sys.is_system(this())))
        return out;
    if (who.connected()) {
        out += ["  Connections:"];
        for tmp in (who.connections())
            out += [(((("    " + tmp) + ": [") + ($time.format("%d-%b-%Y/%T", tmp.active_since()))) + "] ") + (tmp.address())];
    }
    tmp = who.quota_byte_usage();
    return (out += ["  Quota:", "    Total:     " + ((who.quota()).to_english()), "    Used:      " + (tmp.to_english()), "    Remaining: " + (((who.quota()) - tmp).to_english())]);
};

protected method .grep_cmd() {
    arg @args;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo('benice) <);
    return (> pass(@args) <);
};

root method .init_admin() {
    $sys.new_admin();
};

public method .kick_cmd() {
    arg cmdstr, cmd, user;
    var x, u;
    
    (> .check_mojo() <);
    catch ~namenf {
        u = $user_db.match(user);
        u.tell((sender().name()) + " has kicked you from the system.");
        pause();
        for x in (u.connections())
            x.destroy();
        sender().tell((u.name()) + " has been kicked from the system.");
    } with {
        sender().tell(("Usage: " + cmd) + " <player name>.");
    }
};

protected method .login() {
    arg connection;
    
    pass(connection);
    (> $sys.configure_core() <);
};

protected method .logout() {
    arg @args;
    
    (| $sys.del_from_system(this()) |);
    return (> pass(@args) <);
};

protected method .mojo() {
    arg @args;
    var mojo_what;
    
    if (!(this() in ($sys.system())))
        mojo_what = "do not ";
    else
        mojo_what = "";
    return .eval_message("mojo-look", $admin, #[["$actor", this()], ["actor", .name()], ["actor.pp", (.gender()).pronoun('pp)], ["mojo.what", mojo_what]]);
};

protected method .mojo_cmd() {
    arg cmdstr, cmd, str;
    var syn, line, vars;
    
    (> .perms(caller(), $user, $admin) <);
    syn = cmd + " on|off";
    if ((!str) || (!(str in ["on", "up", "off", "down"])))
        return .mojo(1);
    
    // this is horribly non-configurable--we need a standard set of subs.
    vars = #[["$actor", this()], ["actor", .name()], ["actor.pp", (.gender()).pronoun('pp)]];
    switch (str) {
        case "on", "up":
            if (this() in ($sys.system())) {
                return "You already have mojo turned on.";
            } else {
                $sys.add_to_system(this());
                (.location()).announce(.eval_message("mojo-on", $admin, vars));
            }
        case "off", "down":
            if (this() in ($sys.system())) {
                $sys.del_from_system(this());
                (.location()).announce(.eval_message("mojo-off", $admin, vars));
            } else {
                return "You don't have mojo turned on.";
            }
    }
};

public method .move_cmd() {
    arg cmd, cmdstr, args;
    var how;
    
    // Is this moving or a copy?
    how = match_begin(cmd, "@c") ? 'copy : 'move;
    if (how == 'move) {
        if ((((args[1])[1]) == 'object) && (((args[1])[2]).is($user)))
            (> .check_mojo('benice) <);
    }
    return (> pass(cmd, cmdstr, args) <);
};

protected method .new_password_cmd(): nooverride  {
    arg cmdstr, cmd, user;
    var new, email;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    email = user.user_info("email");
    if (!email)
        return (user.namef('ref)) + " does not have an email address!";
    .tell("Generating password and mailing it to: " + email);
    new = $code_lib.random_password();
    catch any {
        $smtp.sendmail('admin, email, ("[" + ($motd.server_name())) + "] password change.", [((("The password for the user " + (user.name())) + " on ") + ($motd.server_name())) + " has been changed to:", "", "    " + new, "", "This is an automatic message sent to the supplied address.  If this message is in error simply discard it.", "", "This password was changed by " + (.name())]);
    } with {
        .tell_traceback(traceback());
        return "** Unable to send mail message, password not changed **";
    }
    user.set_password(new);
    user.tell([((("Your password has been reset by " + (.name())) + ".  The new password has been emailed to ") + email) + "."]);
    .tell((("You reset " + (user.name())) + "'s password to: ") + new);
};

protected method .quota_cmd() {
    arg cmd, cmdstr, object, prep, ops;
    var object, value, exempt;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    value = ops[1];
    value = (value && (| toint(value[1]) |)) ? toint(value[1]) : (-1);
    exempt = "e?xempt" in ((ops[2]).slice(1));
    exempt = exempt ? (((ops[2])[exempt])[3]) : (-1);
    if (value != (-1)) {
        object.set_quota(value);
        .tell((((object.name()) + " now has a quota of ") + (value.to_english())) + ".");
    }
    if (exempt != (-1)) {
        object.set_quota_exempt(exempt);
        .tell((((object.name()) + " is ") + (exempt ? "now" : "no longer")) + " quota exempt.");
    }
};

protected method .reap_cmd() {
    arg cmdstr, cmd, args;
    var opts, thresh, i;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    [args, opts] = (> $parse_lib.opt(args, "t?ime", "m?ail") <);
    args = args.join();
    if ((i = "t?ime" in (opts.slice(1)))) {
        catch any
            thresh = $time.from_english((opts[i])[4]);
        with
            return (traceback()[1])[2];
    }
    if ("m?ail" in (opts.slice(1)))
        return ._reap__mail(args, thresh || (86400 * 7));
    if (args)
        return (> ._reap__user(args) <);
    else
        return (> ._reap__list(thresh || ((86400 * 30) * 3)) <);
};

protected method .reap_users_cmd() {
    arg cmdstr, cmd, args;
    var u, thresh, t, reap, m, last, tl, v;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    
    // figure threshold
    if (args) {
        catch any
            thresh = $time.from_english(args);
        with
            return "You must specify the time.";
    } else {
        thresh = (86400 * 30) * 3;
    }
    t = time();
    reap = [];
    .tell([("--- Reap Possibilities starting " + ($time.to_english(thresh))) + " ago", strfmt("%28L %4l %4l %12l %l", "User", "MNGD", "WRTS", "Last On", "Age"), strfmt("%28L %4l %4l %12l %l", "----", "----", "----", "-------", "---")]);
    for u in ($user.descendants()) {
        if ((u.connected()) || ((u.has_flag('core)) || (u.is($admin))))
            continue;
        tl = (last = abs(u.connected_at()));
        if ((tl + thresh) > t)
            continue;
        m = "";
        tl = t - tl;
        if (tl / 31449600) {
            v = tl / 31449600;
            m = (v + " year") + ((v > 1) ? "s" : "");
            tl = tl % 31449600;
        }
        if (tl / 2592000) {
            v = tl / 2592000;
            m += (((m ? " " : "") + v) + " month") + ((v > 1) ? "s" : "");
            tl = tl % 2592000;
        }
        if (tl / 604800) {
            v = tl / 604800;
            m += (((m ? " " : "") + v) + " week") + ((v > 1) ? "s" : "");
        }
        if (!m)
            m = "newborn";
        reap += [[last, strfmt("%28L %4l %4l %12l %l", u.namef('xref), listlen(u.managed()), listlen(u.writes()), $time.format("%v", last), m)]];
    }
    .tell(((reap.sort()).slice(2)).reverse());
    return "---";
};

protected method .rehash_all_cmd() {
    arg cmdstr, cmd, args;
    var purge, o, objs, list;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    .tell("Rebuilding all caches..");
    pause();
    pause();
    
    // go atomic, we do not want confused users trying to run commands that
    // do not exist...
    $sys.atomic(1);
    
    // purge everything
    if ((o = (| "p?urge" in ((args[2]).slice(1)) |)))
        purge = ((args[2])[0])[3];
    else
        purge = 1;
    if (purge) {
        .tell("Purging caches..");
        for o in ($command_cache.descendants()) {
            (| o.purge_cache() |);
            refresh();
        }
    }
    
    // rehash non-general caches
    list = ($command_cache.children()).setremove($user_interfaces);
    list = ((list.mmap('descendants)).flatten()).compress();
    .tell(("Rehashing " + listlen(list)) + " general caches.");
    for o in (list) {
        if (!(o.is_general_cache())) {
            (| o.rehash_cache() |);
            refresh();
        }
    }
    $remote_cache.rehash_cache();
    
    // re-init user clients
    objs = (| $user_db.connected() |) || [this()];
    list = hash o in (objs) to ([(| o.location() |) || $void, 1]);
    for o in (objs + dict_keys(list)) {
        .tell("Initializing " + (o.namef('ref)));
        o.cache_client_init();
        refresh();
    }
    
    // ok, good...
    $sys.atomic(0);
    return "Done...";
};

public method .scour_cmd() {
    arg cmdstr, cmd, line;
    var allopts, opts, parse, comp, neg, match, list, start, end, obj, pos, found, out, i, x, y;
    
    // command requires mojo for full search, so check it
    (> .check_mojo() <);
    
    // check to see if arguments have been provided
    if (!line)
        return .tell("Syntax: @scour <scope> [{comparison}] [range] [options]");
    
    // determine the scope of the search: method, variable, or setting
    if ((parse = line.regexp("\.([a-zA-Z0-9_]+)\((.*)\)")))
        parse = (| ['method, ".", (parse[1]).to_symbol(), fromliteral(("[" + (parse[2])) + "]")] |);
    else if ((parse = line.regexp(",([a-zA-Z0-9_]+)")))
        parse = (| ['variable, ",", (parse[1]).to_symbol()] |);
    else if ((parse = line.regexp(":([a-zA-Z0-9-]+)")))
        parse = (| ['setting, ":", parse[1]] |);
    else
        return .tell("Scope parse failed.");
    
    // if provided, find the basis of comparison
    refresh();
    comp = line.regexp("{(.+)}");
    if (comp) {
        comp = comp[1];
    
        //    if (line[line.index("{") - 1] == "!")
        if ((line[stridx(line, "{") - 1]) == "!")
            neg = 1;
    }
    
    // parse options and determine the objects to be scoured
    refresh();
    allopts = ["d?escend", "m?atch"];
    opts = ($parse_lib.opt(line, @allopts))[2];
    catch ~namenf {
        if ((pos = "d?escend" in (opts.slice(1)))) {
            start = $object_lib.to_dbref(((opts[pos])[4]).strip("'"));
            list = [start, @start.descendants()];
        } else if ((| ([start, end] = line.regexp("([^ .]+) ?\.\. ?([^ .]+)")) |)) {
            [start, end] = map i in ([start, end]) to ($object_lib.to_dbref(i));
            list = map i in [toint(start) .. toint(end)] to (refresh() && toobjnum(i));
            list = filter i in (list) where (refresh() && valid(i));
        } else {
            return .tell("You must specify a range of objects or an object from which to descend.");
        }
    } with {
        return .tell((traceback()[1])[2]);
    }
    if ((pos = "m?atch" in (opts.slice(1)))) {
        match = map i in ((allopts = ["r?egexp", "t?emplate", "e?quals"])) to (((opts[pos])[4]).match_template(i));
        if (match[1])
            match = 'regexp;
        else if (match[2])
            match = 'match_template;
        else if (match[3])
            match = 'equals;
        else
            return .tell((((opts[pos])[4]) + " is not a valid matching type: ") + (allopts.to_english()));
    }
    
    // defaults
    refresh();
    match ?= 'regexp;
    
    // scours the database and makes comparisons
    .tell(["Beginning analysis...", "".pad(79, "-")]);
    for obj in (list) {
        refresh();
        catch any {
            switch (parse[1]) {
                case 'method:
                    i = toliteral(obj.(parse[3])(@parse[4]));
                    if (comp) {
                        if (neg ? i.(match)(comp) : (!i.(match)(comp)))
                            continue;
                    }
                    found = 1;
                    .tell([tostr(obj), "  %20e  %55e".format((parse[2]) + tostr(parse[3]), i)]);
                case 'variable:
                    out = [];
                    for x in (obj.data()) {
                        refresh();
                        if (valid(x[1]) && ((parse[3]) in (((obj.data())[x[1]]).keys()))) {
                            i = toliteral(((obj.data())[x[1]])[parse[3]]);
                            if (comp) {
                                if (neg ? i.(match)(comp) : (!i.(match)(comp)))
                                    continue;
                            }
                            out += [("  <" + (x[1])) + ">", "    %20e  %50e".format((parse[2]) + tostr(parse[3]), i)];
                        }
                    }
                    if (!out)
                        continue;
                    found = 1;
                    .tell([tostr(obj), @out]);
                case 'setting:
                    if ((parse[3]) in ((pos = obj.all_defined_settings()).keys())) {
                        i = toliteral(obj.get_setting(parse[3], pos[parse[3]]));
                        if (comp) {
                            if (neg ? i.(match)(comp) : (!i.(match)(comp)))
                                continue;
                        }
                        found = 1;
                        .tell([tostr(obj), "  %20e  %55e".format((parse[2]) + (parse[3]), i)]);
                    }
                    continue;
            }
        } with {
            continue;
        }
    }
    if (!found)
        .tell("No matches found.");
    .tell(["".pad(79, "-"), "Finished."]);
    
    // $#Created: 22 Jul 98 20:09 $kirnamat
};

protected method .shutdown_cmd() {
    arg cmdstr, com, @args;
    var time, opt, why, answer, ans;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    args = (> $parse_lib.opt(args.join(), "t?ime") <);
    opt = "t?ime" in ((args[2]).slice(1));
    if (opt && ((((args[2])[opt])[4]).is_numeric()))
        time = toint(((args[2])[opt])[4]);
    else
        time = 5;
    if (!(why = (args[1]).join()))
        why = "Administrator's whim.";
    .tell(((("Shutdown " + ($motd.server_name())) + " in ") + tostr(time)) + " minutes");
    .tell("Reason for shutdown: " + why);
    ans = (> .prompt("Is this correct? [yes]: ") <);
    if (!ans)
        ans = "yes";
    if (!(ans in ["yes", "y"])) {
        .tell("I didn't think so, aborting shutdown...");
        return;
    }
    .tell("Ok!");
    $sys.do_shutdown(time, why);
};

protected method .status_cmd() {
    arg cmdstr, com, @args;
    var opt, cache, x, y, width, depth, info, out, str, pre, dstr, dirty, c;
    
    (> .perms(caller(), 'command) <);
    opt = (> $parse_lib.opt(args.join(" "), "c?ache", "d?irtyonly") <);
    if ((x = "c?ache" in ((opt[2]).slice(1))))
        cache = 1;
    if (!cache)
        return pass(cmdstr, com, @args);
    [width, depth, info] = $sys.cache_info();
    out = [((((("Cache Size: " + width) + "x") + depth) + " (") + (width * depth)) + " total object capacity)"];
    info = map x in (info) to (strsub(x, "i", ".", "c"));
    if (width < 80) {
        if (width < 78) {
            pre = 1;
            str = " +";
        } else {
            pre = 0;
            str = "";
        }
        str = strfmt(str + "%*{-}c", width, " WIDTH ");
        out += ["Cache Map (Horizontal):", str];
        dstr = "DEPTH";
        for y in [1 .. depth] {
            if (pre) {
                if (y <= strlen(dstr))
                    str = (dstr[y]) + "|";
                else
                    str = " |";
            } else {
                str = "";
            }
            for x in [1 .. width] {
                refresh();
                if (strlen(info[x]) >= y) {
                    c = (info[x])[y];
                    str += (info[x])[y];
                } else {
                    str += " ";
                }
            }
            out += [str];
        }
        if (pre)
            out += [" +" + ("-" * width)];
        else
            out += ["-" * width];
    } else {
        str = strfmt(" +%*{-}c", depth, " DEPTH ");
        out += ["Cache Map (Vertical):", str] + (info.prefix(" |"));
    }
    return out + ["Object Legend: a=active, A=active+dirty, .=inactive, I=inactive+dirty"];
};

protected method .tasks_cmd() {
    arg cmdstr, cmd, args;
    var out, task, queue, time, args, fmt, tfmt, info, suspend, preempt, line, x;
    
    (> .perms(caller(), 'command) <);
    (> .check_mojo() <);
    out = [];
    if (args) {
        for x in (explode(args)) {
            if ((x[1]) == "*")
                x = substr(x, 2);
            if (!(task = (| $scheduler.task_info(toint(x)) |))) {
                .tell(("Invalid task '" + x) + "'");
                continue;
            }
            out = ["Task: " + ((task[1])[1]), "", strfmt("  %8l %15L %s", "TICKS", "USER", "METHOD")];
    
            // add an option to not restrict this
            for info in (sublist(task, 3))
                out += [strfmt("  %8l %15L %s.%s()", info[7], info[4], info[1], info[8])];
        }
        return out;
    }
    queue = $scheduler.task_queue();
    if (queue) {
        tfmt = "%d %h %y %H:%M:%S";
        fmt = "%5L %20L %s";
        time = $time.format(tfmt);
        out = [strfmt(fmt, "ID", "EXEC TIME", "TASK"), strfmt(fmt, "---", "---------", "----")];
        fmt += ".%s(%s)";
        for task in (queue) {
            args = toliteral(task[8]);
            out += [strfmt(fmt, task[1], $time.format(tfmt, task[2]), task[4], task[6], substr(args, 2, strlen(args) - 2))];
        }
        if (out)
            out = ["-- Database Tasks --"] + out;
    }
    if ((queue = tasks())) {
        suspend = [];
        preempt = [];
        fmt = "%8l%8l%24L";
        for task in (queue) {
            info = $scheduler.task_info(task);
            line = strfmt(fmt, (info[1])[1], (info[3])[7], ((((info[3])[1]) + ".") + ((info[3])[8])) + "()", (info[3])[4]);
            catch any {
                task = ($scheduler.suspended_task(task)).join();
                if (strlen(task) > 38)
                    task = substr(task, 1, 35) + "...";
            } with {
                task = "";
            }
            if ((info[1])[2])
                preempt += [line + task];
            else
                suspend += [line + task];
        }
        tfmt = strfmt(fmt, "TASK", "TICKS", "METHOD") + "RESUMABLE BY";
        if (preempt)
            out += ["-- Preempted Tasks --", tfmt] + preempt;
        if (suspend)
            out += ["-- Suspended Tasks --", tfmt] + suspend;
    }
    return out || "-- No suspended or preempted tasks --";
};

public method .uninit_admin() {
    $sys.old_admin();
};


