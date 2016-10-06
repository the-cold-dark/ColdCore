
object $sys: $root;

var $root created_on = 796268969;
var $root defined_settings = #[["loggers", #[['get, ['loggers]], ['set, ['set_loggers]], ['parse, ['parse_itemlist, 'parse_object]], ['format, ['format_itemlist]]]], ["deny-hosts", #[['get, ['deny_hosts]], ['set, ['set_deny_hosts]], ['parse, ['parse_itemlist, 'parse_deny_host]], ['format, ['format_itemlist]]]], ["deny-users", #[['get, ['deny_users]], ['set, ['set_deny_users]], ['parse, ['parse_itemlist, 'parse_deny_user]], ['format, ['format_itemlist]]]], ["backup-interval", #[['get, ['get_backup_interval]], ['set, ['set_backup_interval]], ['parse, ['parse_backup_interval]], ['format, ['fmt_backup_interval]]]], ["validate-email-addresses", #[['parse, ['is_boolean]], ['format, ['format_boolean]], ['get, ['validate_email_addresses]], ['set, ['set_validate_email_addresses]]]], ["initial-quota", #[['get, ['get_initial_quota]], ['set, ['set_initial_quota]], ['parse, ['parse_initial_quota]], ['format, ['fmt_initial_quota]]]], ["new-user-class", #[['get, ['get_new_user_class]], ['set, ['set_new_user_class]], ['parse, ['parse_new_user_class]], ['format, ['format_object]]]], ["anonymous-user-class", #[['get, ['get_anon_user_class]], ['set, ['set_anon_user_class]], ['parse, ['parse_anon_user_class]], ['format, ['format_object]]]], ["startup-objects", #[['get, ['get_startup_objects]], ['set, ['set_startup_objects]], ['parse, ['parse_itemlist, 'parse_startup_object]], ['format, ['format_itemlist]]]], ["writable-core", #[['get, ['writable_core]], ['set, ['set_writable_core]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["valid-genders", #[['parse, ['parse_itemlist, 'parse_valid_genders]], ['get, ['get_valid_genders]], ['set, ['set_valid_genders]], ['format, ['format_itemlist]]]], ["heartbeat-interval", #[['get, ['get_heartbeat_interval]], ['set, ['set_heartbeat_interval]], ['parse, ['parse_heartbeat_interval]], ['format, ['fmt_heartbeat_interval]]]], ["traceback-for", #[['parse, ['parse_traceback_for_setting]]]]];
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$sys];
var $root manager = $sys;
var $root quota_exempt = 1;
var $root settings = #[["traceback-for", $builder]];
var $sys admins = [];
var $sys agents = [$root, $daemon];
var $sys backup = #[['interval, 3600], ['last, 0], ['next, 0]];
var $sys bindings = #[['atomic, $sys], ['create, $sys], ['backup, $sys], ['shutdown, $sys], ['set_heartbeat, $sys], ['cancel, $scheduler], ['task_info, $scheduler], ['execute, $sys], ['bind_function, $sys], ['unbind_function, $sys], ['bind_port, $daemon], ['unbind_port, $daemon], ['open_connection, $connection], ['reassign_connection, $daemon], ['fopen, $file], ['fstat, $file], ['fchmod, $file], ['fmkdir, $file], ['frmdir, $file], ['files, $file], ['fremove, $file], ['frename, $file], ['fclose, $file], ['fseek, $file], ['feof, $file], ['fwrite, $file], ['fread, $file], ['fflush, $file], ['chparents, $root], ['destroy, $root], ['dblog, $sys], ['add_var, $root], ['del_var, $root], ['variables, $root], ['list_method, $root], ['add_method, $root], ['del_method, $root], ['method_bytecode, $root], ['methods, $root], ['rename_method, $root], ['set_method_access, $root], ['set_method_flags, $root], ['data, $root], ['del_objname, $root], ['set_objname, $root], ['suspend, $scheduler], ['resume, $scheduler], ['set_user, $user], ['config, $sys], ['cache_info, $sys]];
var $sys config_set = ['new_user_class, 'server_name, 'server_title, 'daemons];
var $sys configured = #[];
var $sys core_version = "3.1";
var $sys deny_hosts = [];
var $sys deny_users = [];
var $sys loggers = [$daemon, $user, $connection, $dns, $guest];
var $sys starting = #[['quota, 76800], ['new_user_class, $admin], ['anonymous_user_class, $guest]];
var $sys startup = #[['objects, [$login_daemon, $http_daemon, $smtp_daemon, $world, $dns, $lag_watcher]], ['heartbeat_interval, 2]];
var $sys system = [$sys, $root];
var $sys touched = 0;
var $sys valid_genders = [$gender_male, $gender_female, $gender_neuter];
var $sys validate_email_addresses = 0;
var $sys writable_core = 0;

private method ._logstr() {
    arg str;
    
    dblog((("[" + ($time.format("%d %b %y %H:%M"))) + "] ") + str);
};

private method ._loop_for_core() {
    arg code;
    var obj;
    
    $root.add_method(code, '___coretmp);
    for obj in ($root.descendants()) {
        obj.___coretmp();
        pause();
    }
    $root.del_method('___coretmp);
};

public method ._status(): native;

public method .add_method() {
    arg code, name, @evalonly;
    var line;
    
    (> .perms(sender()) <);
    line = (("SYSTEM: ." + tostr(name)) + "() ") + (evalonly ? "EVAL" : "MODIFIED");
    line = (line + " by ") + (sender().namef('ref));
    .log(line);
    return (> pass(code, name, @evalonly) <);
};

public method .add_to_system() {
    arg obj;
    
    if (!(.is_admin(sender())))
        throw(~perm, "Sender is not an admin.");
    if (!((obj in admins) || (obj in agents)))
        throw(~perm, "Object is not an agent or admin.");
    system = setadd(system, obj);
};

public method .admins() {
    return admins;
};

public method .agents() {
    return agents;
};

public method .atomic() {
    arg @args;
    
    (> .perms(sender(), 'system) <);
    return (> atomic(@args) <);
};

driver method .backup_done() {
    var elapsed;
    
    elapsed = time() - (backup['started]);
    backup = backup.del('started);
    catch any {
        $channel_ui._broadcast('System, "Backup completed, elapsed time " + ($time.to_english(elapsed)));
        $channel_ui._broadcast('System, "Executing filesystem cleanup.. ");
        pause();
        pause();
        .execute("backup", []);
    }
};

public method .broadcast() {
    arg mesg;
    var s;
    
    // do better perms for this later; intended as a 'panic' type
    // message, generally for daemon process type stuff
    if (caller() != $http_interface)
        throw(~perm, "Sorry.");
    mesg = (("[" + caller()) + "] ") + mesg;
    return $channel_ui._broadcast('System, mesg);
};

public method .cache_info() {
    return cache_info();
};

private method .clean_database() {
    var obj, p, c, cmd;
    
    // cleanup some of $root's messiness
    for obj in ($root.descendants()) {
        (| obj.clean_root() |);
        refresh();
    }
    
    // purge all command caches
    for obj in ($command_cache.descendants()) {
        (| obj.purge_cache() |);
        refresh();
    }
    
    // check user info (move'em home etc)
    for obj in ($user.descendants()) {
        if ((| (obj.home()) != (obj.location()) |))
            (| obj.move_to(obj.home()) |);
        refresh();
    }
    
    // validate all locations and location content's
    for obj in ($physical.descendants()) {
        (| obj.validate_contents() |);
        if (obj.has_ancestor($located)) {
            if ((!valid(obj.location())) || (!(obj in ((obj.location()).contents()))))
                (| obj.move_to((| obj.home() |) || $lost_and_found) |);
        }
        refresh();
    }
};

root method .clear_definer_vars(): nooverride  {
    arg definer, objs;
    var code, v, a, meth, errs, d;
    
    code = [];
    for v in (definer.variables())
        code += [("(| clear_var('" + v) + ") |);"];
    meth = tosym("_root_tmp_" + time());
    if (!(definer.add_method(code, meth, 1))) {
        for d in (objs) {
            pause();
            (| d.(meth)() |);
        }
        (| definer.del_method(meth) |);
    }
};

public method .configure_core() {
    var list, l, x, t, err, s;
    
    if (caller() != $admin)
        (> .perms(sender()) <);
    s = sender();
    
    // if there is nothing left to config, leave..
    if (configured) {
        if (!(list = config_set.set_difference(configured.keys())))
            return;
    } else {
        configured = #[];
    }
    .add_to_system(s);
    
    // wait for other things to finish printing messages to them
    pause();
    pause();
    
    // expand on this as we go
    s.tell(["*" * 78, strfmt("%78{*}c", " Welcome to ColdCore "), "*" * 78]);
    s.tell(("This is an interactive configuration system which any admin who connects (until it is completed) is sent through.  You must complete this configuration before you can do anything else.  You can skip a specific question at any time by typing '@skip'.  Suggested default values will be enclosed in square brackets.  Pressing enter without any value will use the default value.".wrap_lines(78)).mmap('center, 78));
    s.tell("*" * 78);
    
    // first question please
    if (!(configured.contains('new_user_class))) {
        s.tell("What class should new users be created as?  Available classes:");
        list = filter x in ($user.descendants()) where (('general_cache in (x.flags())) && (x != $guest));
        t = .get_new_user_class();
        list = map x in (list) to ((list == t) ? (x + " (current class)") : x);
        s.tell(list.prefix("    "));
        while (!l) {
            refresh();
            l = (> s.prompt(("New User Class [" + t) + "] ") <);
            if (l == "@skip") {
                s.tell("Skipping..");
                break;
            }
            if (l) {
                catch any {
                    l = $object_lib.to_dbref(l);
                    if (!(l in list))
                        s.tell("Invalid selection, try again.");
                } with {
                    s.tell(("Invalid selection '" + l) + "'");
                    continue;
                }
            } else {
                l = t;
            }
            .set_setting("new-user-class", $sys, l);
            configured = configured.add('new_user_class, 1);
            s.tell("New User Class set to: " + l);
        }
        s.tell(["", "You can set this at any time, with the command:"]);
        s.tell("  @set $sys:new-user-class=" + l);
    }
    refresh();
    
    // server name/title
    if (!(configured.contains('server_name))) {
        s.tell(["", "---"]);
        t = $motd.server_name();
        l = (> s.prompt(("What is your server name? [" + t) + "] ") <) || t;
        if (l == "@skip") {
            s.tell("Skipping..");
        } else {
            $motd.set_setting("server-name", $motd, l);
            configured = configured.add('server_name, 1);
            s.tell("Server name set to: " + l);
        }
        s.tell(["", "You can set this at any time, with the command:"]);
        s.tell("  @set $motd:server-name=" + l);
    }
    refresh();
    if (!(configured.contains('server_title))) {
        s.tell(["", "---"]);
        t = $motd.server_title();
        l = (> s.prompt(("What is your server title? [" + t) + "] ") <) || t;
        if (l == "@skip") {
            s.tell("Skipping..");
        } else {
            $motd.set_setting("server-title", $motd, l);
            configured = configured.add('server_title, 1);
            s.tell("Server title set to: " + l);
        }
        s.tell(["", "You can set this at any time, with the command:"]);
        s.tell("  @set $motd:server-title=" + l);
    }
    refresh();
    if (!(configured.contains('daemons))) {
        s.tell(["", "---"]);
        while (1) {
            refresh();
            list = ($daemon.children()).setremove($login_daemon);
            s.tell("Which network daemons do you want to have automatically startup,");
            s.tell("Other than $login_daemon.  Available daemons:");
            t = filter l in (startup['objects]) where (l.is($daemon));
            for l in (list) {
                if (l in t)
                    s.tell(strfmt("  %20s (auto starting)", l));
                else
                    s.tell("  " + l);
            }
            l = (> s.prompt(("Auto-Start: [" + (t.join(", "))) + "] ") <);
            if (l == "@skip") {
                s.tell("Skipping..");
                break;
            } else if (!l) {
                s.tell("Using existing daemons: " + (t.join(", ")));
                configured = configured.add('daemons, 1);
                break;
            } else {
                err = 0;
                for x in (l.explode_english_list()) {
                    catch any {
                        .set_setting("startup-objects", $sys, "+" + x);
                        s.tell(("Added " + x) + " as a startup daemon.");
                    } with {
                        s.tell(("Unable to add '" + x) + "' as a daemon:");
                        s.tell("=> " + ((traceback()[1])[2]));
                        err++;
                    }
                }
                if (!err) {
                    configured = configured.add('daemons, 1);
                    break;
                }
                s.tell("Errors occurred...");
            }
        }
        s.tell(["", "You can set this at any time, with the command:"]);
        s.tell("  @set $sys:startup-objects=OBJECTS...");
    }
    
    // Other things to add: HTTP Virtual Hosting info,
    // Let them know, if they actually saw anything..
    s.tell(["", strfmt("%79{*}c", " Configuration Complete ")]);
};

root method .core_sys(): nooverride  {
    deny_hosts = (deny_users = []);
    touched = 0;
    system = [$sys, $root];
    backup = #[['interval, 3600], ['last, 0], ['next, 0]];
    validate_email_addresses = 0;
    starting = #[['quota, 76800], ['new_user_class, $admin], ['anonymous_user_class, $guest]];
    startup = #[['objects, [$login_daemon, $http_daemon, $smtp_daemon, $world, $dns, $lag_watcher]], ['heartbeat_interval, 2]];
    agents = [$root, $daemon];
    admins = [];
    writable_core = 0;
    configured = #[];
};

private method .create() {
    arg parents, name, manager;
    var new;
    
    new = create(parents);
    catch any {
        new.initialize();
    
        // niggle the names around... $has_name may have initted the wrong name
        new.set_objname(name);
        if ((new.has_ancestor($has_name)) && ((new.name()) == ("#" + (new.objnum())))) {
            catch ~invname
                new.set_name(substr(tostr(new), 2));
        }
    
        // let it manage itself
        new.change_manager(manager);
    } with {
        // Failed to initialize the child; destroy it.
        $sys.log_traceback(traceback(), ((((("CREATE (" + parents) + ", '") + name) + ", ") + manager) + ")");
        (| new.destroy() |);
        rethrow(error());
    }
    return new;
};

public method .create_user() {
    arg name, password, email, @type;
    var user;
    
    if ((!(| caller() == $login_interface |)) && (type((| .perms(sender(), 'system) |)) == 'error))
        throw(~perm, "Caller and Sender are not allowed to call this method.");
    [(type ?= 'new_user_class)] = type;
    catch any {
        user = (starting[type]).spawn(name);
        user.set_name(name);
        if (type == 'new_user_class)
            user.set_password(password);
        user.change_manager(user);
        user.set_user_info("rl-email", $user_info, email);
    } with {
        // Failed to initialize the child; destroy it.
        (| user.destroy() |);
        rethrow(error());
    }
    return user;
};

public method .del_from_system() {
    arg obj;
    
    if (!(.is_admin(sender())))
        throw(~perm, "Sender is not an admin.");
    if (!((obj in admins) || (obj in agents)))
        throw(~perm, "Object is not an agent or admin.");
    system = setremove(system, obj);
};

public method .deny_hosts() {
    arg @args;
    
    return deny_hosts;
};

public method .deny_users() {
    arg @args;
    
    return deny_users;
};

public method .destroy_sender() {
    // potential problem spot, but sometimes its needed
    // add core definer items to the list, if you want them to call it
    (> .perms(caller(), $path, $connection, $connection_interface) <);
    (> sender().destroy() <);
};

public method .dirty() {
    return touched > (backup['last]);
};

public method .do_backup() {
    arg @args;
    var line, who, how, name, dirty;
    
    (> .perms(sender(), 'system) <);
    if (dict_contains(backup, 'started)) {
        .log("BACKUP CONFLICT");
        line = "BACKUP CONFLICT at " + ($time.format("%I:%M:%S %p"));
        line += ", Current backup started at " + ($time.format("%I:%M:%S %p", backup['started]));
        $channel_ui._broadcast('System, line);
        return;
    }
    dirty = .dirty();
    [(who ?= sender()), (how ?= 'request)] = args;
    if (!valid(who))
        who = sender();
    backup = backup.add('next, time() + (backup['interval]));
    backup = backup.add('last, time());
    if ((how == 'interval) && (!dirty))
        return;
    catch any {
        name = who.namef('ref);
        .log(("BACKUP (" + name) + ") ");
        line = (("Backup started at " + ($time.format("%I:%M:%S %p"))) + " by ") + name;
        $channel_ui._broadcast('System, line);
    }
    
    // double pause will hopefully let people know about it before it happens
    pause();
    pause();
    backup = backup.add('started, time());
    (> backup() <);
};

public method .do_shutdown() {
    arg time, why;
    var increments, line, name, mins, secs;
    
    if ((!($sys.is_admin(sender()))) || (definer() != this()))
        throw(~perm, "Sender is not an admin.");
    increments = [600, 300, 180, 60];
    secs = time * 60;
    while (increments && (secs < (increments[1])))
        increments = increments.delete(1);
    if (increments && (secs > (increments[1])))
        increments = [secs] + increments;
    name = sender().namef('xref);
    .log(("*** SHUTDOWN called by " + name) + " ***");
    if (why) {
        why = ("*** REASON: " + why) + " ***";
        .log(why);
    }
    while (1) {
        if (!increments) {
            $channel_ui._broadcast('All, "*** SYSTEM SHUTDOWN ***");
            if (why)
                $channel_ui._broadcast('All, why);
            break;
        }
        line = "*** SYSTEM SHUTDOWN IN ";
        mins = (increments[1]) / 60;
        line = ((line + tostr(mins)) + " MINUTE") + ((mins == 1) ? "" : "S");
        line = ((line + " CALLED BY ") + name) + " ***";
        $channel_ui._broadcast('All, line);
        if (why)
            $channel_ui._broadcast('All, why);
        if ((increments.length()) > 1)
            $scheduler.sleep((increments[1]) - (increments[2]));
        else
            $scheduler.sleep(increments[1]);
        increments = increments.delete(1);
    }
    pause();
    pause();
    return .shutdown();
};

public method .execute() {
    arg script, args, @background;
    
    (> .perms(sender(), 'system) <);
    (> execute(script, args, @background) <);
};

private method .finish_core() {
    var i;
    
    // cleanup heartbeat
    set_heartbeat(1);
    .add_method(TMP_HEARTBEAT_CODE, 'heartbeat);
    .del_var('TMP_HEARTBEAT_CODE);
    
    // ok, finish up
    catch any {
        dblog("** Verifying all non-core objects were destroyed");
        for i in ($root.descendants()) {
            refresh();
            if (!(i.has_flag('core)))
                dblog(("** !!!!! " + i) + " was not destroyed !!!!!");
        }
        .del_var('__making_core);
        dblog("** corifying remaining objects");
        $root.corify();
        dblog("** cleaning database..");
        .clean_database();
        dblog("** shutting down..");
        shutdown();
    } with {
        dblog("traceback: " + traceback());
    }
};

public method .fmt_backup_interval() {
    arg data;
    
    return $time.to_english(data);
};

public method .fmt_heartbeat_interval() {
    arg data;
    
    return $time.to_english(data);
};

public method .fmt_initial_quota() {
    arg data;
    
    return data.to_bytes();
};

public method .get_anon_user_class() {
    arg @args;
    
    return starting['anonymous_user_class];
};

public method .get_backup_interval() {
    arg @args;
    
    return backup['interval];
};

public method .get_heartbeat_interval() {
    arg @args;
    
    return startup['heartbeat_interval];
};

public method .get_initial_quota() {
    arg @args;
    
    return starting['quota];
};

public method .get_new_user_class() {
    arg @args;
    
    return starting['new_user_class];
};

public method .get_starting() {
    arg what;
    
    return starting[what];
};

public method .get_startup() {
    arg what;
    
    return startup[what];
};

public method .get_startup_objects() {
    arg @args;
    
    return startup['objects];
};

public method .get_valid_genders() {
    arg @ignored;
    
    return valid_genders;
};

driver method .heartbeat() {
    (| $scheduler.pulse() |);
    if (time() > (backup['next]))
        .do_backup(this(), 'interval);
};

public method .host_denied() {
    arg remote;
    var t;
    
    for t in (deny_hosts) {
        if (match_begin(remote, t) != 0)
            return 1;
    }
    return 0;
};

private method .init_database() {
    var obj, p, c, cmd, other;
    
    // re-init caches
    $remote_cache.rehash_cache();
    
    // only rehash non-general caches--general caches should be initialized
    // as they are needed, by .cache_server_init().
    other = ($command_cache.children()).setremove($user_interfaces);
    other = ((other.mmap('descendants)).flatten()).compress();
    for obj in (filter obj in (other) where (!(obj.is_general_cache()))) {
        (| obj.rehash_cache() |);
        refresh();
    }
};

private method .initialize_core() {
    var obj;
    
    (| .clean_database() |);
    
    // reset child indices
    ._loop_for_core(["child_index = 0;"]);
};

public method .is_admin() {
    arg obj;
    
    return (obj == $sys) || (obj in admins);
};

public method .is_system() {
    arg obj;
    
    return obj in system;
};

public method .log() {
    arg msg;
    var l;
    
    if ((!($syslog_group.includes(caller()))) && (!(.is_writable_by(sender()))))
        throw(~perm, "Only objects in the $syslog_group can log.");
    if (type(msg) == 'list) {
        for l in (msg)
            .log(l);
    } else {
        ._logstr(msg);
    }
};

public method .log_traceback(): forked  {
    arg traceback, @command;
    var user, log, mail, l, s;
    
    if ((!($syslog_group.includes(caller()))) && (!(.is_writable_by(sender()))))
        throw(~perm, "Permission denied.");
    [(command ?= "")] = command;
    user = user() || sender();
    log = "Last Command: " + command;
    log = [log, ("User: " + user()) || sender()];
    if (type(traceback[1]) != 'string)
        traceback = $parse_lib.traceback(traceback);
    s = (user() || sender()) + ": received traceback";
    log += traceback;
    if ('__making_core in (.variables()))
        .log(log);
    else
        $no_one.mail_as(0, 0, s, log, $mail_list_tracebacks);
};

public method .loggers() {
    arg @args;
    
    return loggers;
};

private method .make_core() {
    arg ver;
    var obj, obj2, d, o, top, x, admin, tmp, name;
    
    // core rooms should be +core, and can't be destroyed
    // traverse the list inversely, less unseen hierarchical shuffling
    .add_var('__making_core);
    dblog("** Starting Core Extraction " + ctime());
    d = $root.descendants();
    top = listlen(d);
    core_version = ver;
    dblog(("** " + top) + " objects total, tidying up core objects...");
    
    // tidy up core objects first
    for obj in (d) {
        refresh();
        if (obj.has_flag('core)) {
            tmp++;
            catch any {
                obj.change_manager(obj);
                for o in (obj.writers('literal)) {
                    refresh();
                    obj.del_writer(o);
                }
            } with {
                dblog(("** TIDY " + obj) + " traceback: ");
                for o in ($parse_lib.traceback(traceback()))
                    dblog("**   " + o);
            }
        }
    }
    
    // nuke anything not core
    dblog(("** " + tmp) + " core objects, destroying non-core objects...");
    for x in [1 .. top] {
        pause();
        obj = d[(top - x) + 1];
        if (!valid(obj)) {
            // dblog(".. Skipping invalid object " + obj);
            continue;
        }
        if (!(obj.has_flag('core))) {
            if (obj.children()) {
                for obj2 in (obj.children()) {
                    if (obj2.has_flag('core)) {
                        dblog("** ABORTING: A NON CORE OBJECT HAS CORE CHILDREN: ");
                        dblog((("** " + obj) + " => ") + (obj.children()));
                        shutdown();
                    }
                }
            }
            catch any {
                // dblog(".. Destroying " + obj);
                obj.destroy();
            } with {
                dblog(("** " + obj) + ".destroy() traceback: ");
                for o in ($parse_lib.traceback(traceback()))
                    dblog("**   " + o);
            }
        }
    }
    
    // shutdown this task so that references can have
    // a chance to clear out, on destroyed objects.
    dblog("** done, suspending for new task **");
    
    // do this the hard way, to be secure--wait a little while for
    // things to wrapup, five seconds should be fine.
    pause();
    set_heartbeat(5);
    .add_var('TMP_HEARTBEAT_CODE, .list_method('heartbeat));
    .add_method([".finish_core();"], 'heartbeat);
};

public method .new_admin() {
    if (caller() != $admin)
        throw(~perm, "Caller is not $admin.");
    admins = setadd(admins, sender());
};

public method .next_objnum(): native;

public method .old_admin() {
    if (caller() != $admin)
        throw(~perm, "Caller is not $admin.");
    admins = setremove(admins, sender());
    system = setremove(system, sender());
};

public method .parse_anon_user_class() {
    arg value, @args;
    
    value = (> $object_lib.to_dbref(value) <);
    if (!(value.is($user)))
        throw(~perm, (value.namef('ref)) + " is not a $user object.");
    if (!(value.has_flag('command_cache)))
        throw(~perm, (value.namef('ref)) + " is not a command cache object.");
    return value;
};

public method .parse_backup_interval() {
    arg value, @args;
    
    value = (> $time.from_english(value) <);
    if (value < 300)
        throw(~perm, "You cannot set your backup interval to less than 5 minutes");
    return value;
};

public method .parse_deny_host() {
    arg value, @args;
    var parts;
    
    // DNS Hostnames are not used due to the extreme slowdown it would
    // cause to _ALL_ services
    if (match_regexp(value, "[^0-9.]"))
        throw(~type, "Invalid Internet Host IP address or subnet: " + value);
    parts = explode(value, ".");
    if (listlen(parts) < 2)
        throw(~type, "Do you really want to deny an entire class A network?");
    if (listlen(parts) > 4)
        throw(~type, "Invalid IP Address: " + (parts.join(".")));
    return parts.join(".");
};

public method .parse_deny_user() {
    arg value, @args;
    var obj;
    
    if (value && ((value[1]) == "$")) {
        obj = (> $object_lib.to_dbref(value) <);
        if (!(obj.is($user)))
            throw(~perm, (obj.namef('ref)) + " is not a user.");
    } else {
        obj = (> $user_db.search(value) <);
    }
    return obj;
};

public method .parse_heartbeat_interval() {
    arg value, @args;
    
    value = (> $time.from_english(value) <);
    if (value < 1)
        throw(~set, "You cannot set the system heartbeat interval to less than 1 second");
    return value;
};

public method .parse_initial_quota() {
    arg value, @args;
    
    value = (> value.to_bytes() <);
    if (value < 1024)
        throw(~perm, "You cannot set your initial quota to less than 1 kb");
    return value;
};

public method .parse_new_user_class() {
    arg value, @args;
    
    value = (> $object_lib.to_dbref(value) <);
    if (!(value.is($user)))
        throw(~perm, (value.namef('ref)) + " is not a $user object.");
    if (!(value.has_flag('command_cache)))
        throw(~perm, (value.namef('ref)) + " is not a command cache object.");
    return value;
};

public method .parse_startup_object() {
    arg value, action, @args;
    
    value = (> $object_lib.to_dbref(value) <);
    if (action == 'del) {
        if (!(value in (startup['objects])))
            throw(~failed, ("The object '" + value) + "' is not set, and thus cannot be removed");
        return value;
    }
    return value;
};

public method .parse_traceback_for_setting() {
    arg value, @args;
    var obj;
    
    obj = (> $object_lib.to_dbref(value) <);
    if (!(obj.is($user)))
        throw(~invset, "Setting must be a user type class");
    if (!('general_cache in (obj.flags())))
        throw(~invset, "Setting must be a user class");
    return obj;
};

public method .parse_valid_genders() {
    arg value, action, @args;
    var obj, kids, i;
    
    if (!(| (obj = $object_lib.to_dbref("gender_" + value)) |))
        (> (obj = $object_lib.to_dbref(value)) <);
    if (action == 'del) {
        if (!(obj in (.get_valid_genders())))
            throw(~set, ("The object '" + value) + "' is not set, and thus cannot be removed");
        return obj;
    }
    if (!(obj in ($gender.children())))
        throw(~set, ("The object '" + value) + "' is not a child of $gender");
    return obj;
};

root method .sender_going_away() {
    admins = admins.setremove(sender());
    agents = agents.setremove(sender());
    system = system.setremove(sender());
};

public method .server_info() {
    arg what, @long;
    var tmp;
    
    switch (what) {
        case 'up_time:
            return time() - (startup['time]);
        case 'startup_time:
            return startup['time];
        case 'server_hostname:
            return $dns.hostname("");
        case 'server_ip:
            return $dns.ip("");
        case 'last_backup:
            return backup['last];
        case 'driver_version:
            tmp = .version();
            return (((((((long ? "Genesis " : "") + (tmp[1])) + ".") + (tmp[2])) + ".") + (tmp[3])) + "-") + ((listlen(tmp) == 3) ? "NEED TO UPGRADE" : (tmp[4]));
        case 'core_version:
            return (long ? "ColdCore " : "") + core_version;
        case 'version:
            tmp = .version();
            return ((((((((("Genesis/" + (tmp[1])) + ".") + (tmp[2])) + ".") + (tmp[3])) + "-") + (tmp[4])) + " ") + "ColdCore/") + core_version;
        default:
            throw(~unknown, "Unknown flag.");
    }
};

protected method .set_anon_user_class() {
    arg name, definer, value;
    
    starting = starting.add('anon_user_class, value);
};

protected method .set_backup_interval() {
    arg name, definer, value;
    
    backup = backup.add('interval, value);
};

protected method .set_deny_hosts() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            deny_hosts = value[2];
        case 'add:
            deny_hosts = setadd(deny_hosts, value[2]);
        case 'del:
            deny_hosts = setremove(deny_hosts, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_deny_users() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            deny_users = value[2];
        case 'add:
            deny_users = setadd(deny_users, value[2]);
        case 'del:
            deny_users = setremove(deny_users, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_heartbeat_interval() {
    arg name, definer, value;
    
    startup = startup.add('heartbeat_interval, value);
    set_heartbeat(value);
};

protected method .set_initial_quota() {
    arg name, definer, value;
    
    starting = starting.add('quota, value);
};

protected method .set_loggers() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            loggers = value[2];
        case 'add:
            loggers = setadd(loggers, value[2]);
        case 'del:
            loggers = setremove(loggers, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_new_user_class() {
    arg name, definer, value;
    
    starting = starting.add('new_user_class, value);
};

public method .set_starting() {
    arg what, value;
    var valid;
    
    (> .perms(sender(), 'system) <);
    valid = starting.keys();
    if ((!what) in valid)
        throw(~type, "Key must be one of " + toliteral(valid));
    starting = starting.add(what, value);
};

public method .set_startup() {
    arg what, value;
    var valid;
    
    (> .perms(sender(), 'system) <);
    valid = startup.keys();
    if ((!what) in valid)
        throw(~type, "Key must be one of " + toliteral(valid));
    startup = startup.add(what, value);
};

protected method .set_startup_objects() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            startup = startup.add('objects, value[2]);
        case 'add:
            startup = startup.add('objects, setadd(startup['objects], value[2]));
        case 'del:
            startup = startup.add('objects, setremove(startup['objects], value[2]));
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_valid_genders() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            valid_genders = value[2];
        case 'add:
            valid_genders = setadd(valid_genders, value[2]);
        case 'del:
            valid_genders = setremove(valid_genders, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_validate_email_addresses() {
    arg name, definer, value;
    
    validate_email_addresses = value;
};

protected method .set_writable_core() {
    arg name, definer, value;
    
    writable_core = value;
};

public method .shutdown() {
    var opt, str, obj;
    
    (> .perms(sender(), $sys) <);
    
    // tell startup objects that we are closing shop
    for obj in (startup['objects]) {
        .log(("Calling " + obj) + ".shutdown()");
        catch any
            (> obj.shutdown() <);
        with
            .log($parse_lib.traceback(traceback()));
    }
    touched = 0;
    return shutdown();
};

driver method .signal() {
    arg signal;
    var line;
    
    // the driver will send the following signals:
    //   HUP  -- driver will drop out of atomic mode and will flush i/o
    //   USR2 -- driver does nothing
    //   USR1 -- driver aborts all currently executing tasks, not suggested
    //   QUIT -- For both of these the driver will shutdown after current
    //   INT     tasks finish their current execution frame.  Note: do not
    //           preempt tasks at this point as they will not resume.
    line = ("** Received Signal: " + signal) + " **";
    (| $channel_ui._broadcast('System, line) |);
    if (signal in ['QUIT, 'INT]) {
        (| $channel_ui._broadcast('all, "******************************") |);
        (| $channel_ui._broadcast('all, "** IMMINENT SERVER SHUTDOWN **") |);
        (| $channel_ui._broadcast('all, "******************************") |);
    }
};

public method .slog() {
    arg msg;
    var l;
    
    if ((!($syslog_group.includes(caller()))) && (!(.is_writable_by(sender()))))
        throw(~perm, "Only objects in the $syslog_group can log.");
    if (type(msg) == 'list) {
        for l in (msg)
            .slog(l);
    } else {
        $channel_ui._broadcast('System, msg);
        ._logstr(msg);
    }
};

public method .spawn_selfmanager() {
    arg name, @writers;
    var obj, w;
    
    // Differs from .spawn_sender in that the object created manages itself.  
    // Add to this list as necessary:
    (> .perms(sender(), $mail_message) <);
    obj = (> .create([sender()], name, this()) <);
    for w in (writers)
        obj.add_writer(w);
    obj.change_manager(obj);
    return obj;
};

public method .spawn_sender() {
    arg suffix, manager;
    var namestr;
    
    (> .perms(caller(), $root, $sys) <);
    namestr = (tostr(sender().objname()) + "_") + suffix;
    return .create([sender()], tosym(namestr), manager);
};

driver method .startup() {
    arg args;
    var opt, str, obj, f, ver, firsttime, doinit;
    
    set_heartbeat(0);
    
    // clean db?
    if ("-clean" in args) {
        catch any {
            dblog("** Cleaning Database..");
            (> .clean_database() <);
            dblog("** Done.");
            if (dict_contains(startup, 'time))
                startup = dict_del(startup, 'time);
        } with {
            .log($parse_lib.traceback(traceback()));
        }
        doinit = "-init" in args;
    } else {
        doinit = ("-init" in args) || (!dict_contains(startup, 'time));
    }
    
    // init?
    if (doinit) {
        catch any {
            dblog("** Initializing Database..");
            (> .init_database() <);
            dblog("** Done.");
        } with {
            .log($parse_lib.traceback(traceback()));
        }
    }
    
    // done?
    if ("-quit" in args) {
        dblog("** Shutting down.");
        .shutdown();
        return;
    }
    
    // make core?
    if ((opt = find opt in (args) where (opt.match_begin("-makecore=")))) {
        ver = regexp(args[opt], "-MAKECORE=(.*)$")[1];
        dblog(("** Calling .make_core(\"" + ver) + "\")..");
        .make_core(ver);
        return;
    }
    
    // Standard startup..
    startup = startup.add('time, time());
    backup = backup.add('next, time() + (backup['interval]));
    
    // In case we're recovering from a backup
    if (dict_contains(backup, 'started))
        backup = dict_del(backup, 'started);
    catch any {
        // get back the heartbeat
        set_heartbeat(startup['heartbeat_interval]);
    
        // Bind functions for security
        for f in (bindings) {
            catch any
                bind_function(@f);
            with
                dblog((("** Unable to bind function " + (f[1])) + "() to ") + (f[2]));
        }
    
        // tell objects who should know, that we are online
        if (type(args) != 'list)
            args = [];
        for obj in (startup['objects]) {
            .log(("Calling " + obj) + ".startup()");
            catch any
                (> obj.startup(@args) <);
            with
                .log($parse_lib.traceback(traceback()));
        }
    } with {
        .log(("** Startup ERROR at " + ctime()) + ":");
        .log(toliteral(traceback()));
        .log($parse_lib.traceback(traceback(), -1, ""));
    }
};

public method .startup_dnsserv() {
    if (sender() != $dns)
        (> .perms(sender(), 'system) <);
    execute("dnsstartup", [], 1);
};

public method .status() {
    return (> ._status() <) + [backup['interval], backup['last], backup['next]];
};

public method .system() {
    return system;
};

public method .task_info() {
    arg @args;
    
    (> .perms(sender(), 'system) <);
    return (> task_info(@args) <);
};

public method .touch() {
    arg @nocorelock;
    
    if ((!nocorelock) && ((sender().has_flag('core)) && (!writable_core)))
        throw(~perm, sender() + " is a core object, and the core isn't writable. '@set $sys:writable-core = yes' to allow this.");
    touched = time();
};

public method .touched() {
    return touched;
};

public method .user_denied() {
    arg user;
    
    return user in deny_users;
};

public method .validate_email_addresses() {
    arg @args;
    
    return validate_email_addresses;
};

public method .version(): native;

public method .writable_core() {
    arg @args;
    
    return writable_core;
};

bind_native .status() ._status();

