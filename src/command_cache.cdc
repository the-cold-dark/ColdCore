
new object $command_cache: $has_commands;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 874602916;
var $root defined_settings = #[["command-modules", #[['get, ['command_modules]], ['set, ['set_command_modules]], ['parse, ['parse_itemlist, 'parse_command_module]], ['format, ['format_itemlist]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_command_cache;
var $root inited = 1;
var $root managed = [$command_cache];
var $root manager = $command_cache;

public method .add_command_module() {
    arg module;
    
    (> .perms(sender()) <);
    if (!('general_cache in (module.flags())))
        throw(~notcache, module + " is not marked as a general_cache");
    modules = setadd(modules || [], module);
    module.cache_server_init();
};

protected method .add_to_cache() {
    arg command, definer;
    var part, cmd;
    
    if (type(commands) != 'dictionary)
        commands = #[];
    cmd = command.word(1);
    for part in (cmd.explode_template_word())
        commands = commands.setadd_elem(part, [cmd, definer]);
};

public method .cache_client_init() {
    var p;
    
    if (sender() != this())
        (> .perms(sender()) <);
    modules ?= [];
    for p in (([this()] + parents()) + modules)
        (| p.cache_server_init() |);
};

protected method .cache_client_uninit() {
    var p;
    
    if (sender() != this())
        (> .perms(sender()) <);
    if (.is($place)) {
        for p in (.contents()) {
            if (p.is($command_cache))
                return;
        }
    }
    for p in (([this()] + parents()) + modules)
        (| p.cache_server_uninit() |);
};

public method .cache_server_init() {
    if (!(sender().has_ancestor(definer())))
        throw(~nochild, ((sender() + " is not a descendant of ") + definer()) + ".");
    if (type(commands) != 'dictionary)
        .rehash_cache();
};

public method .cache_server_uninit() {
    var user;
    
    if (caller() != $command_cache)
        throw(~perm, "Caller is not of the command subsystem.");
    
    // see if anybody still needs us, otherwise purge
    if (.is_general_cache()) {
        for user in ($user_db.connected()) {
            if ((user.has_ancestor(this())) || (this() in (user.command_modules())))
                return;
        }
    }
    .purge_cache();
};

public method .command_cache() {
    return commands;
};

public method .command_modules() {
    arg @args;
    
    return modules || [];
};

root method .core_command_cache() {
    .purge_cache();
};

public method .del_command_module() {
    arg module;
    
    (> .perms(sender()) <);
    modules = setremove(modules || [], module);
    module.cache_server_uninit();
};

protected method .del_from_cache() {
    arg command, definer;
    var part, cmd, c;
    
    if (type(commands) != 'dictionary)
        commands = #[];
    cmd = command.word(1);
    for part in (cmd.explode_template_word()) {
        for c in ((| commands[part] |) || []) {
            if (c == [command, definer])
                commands = commands.del_elem(part, [command, definer]);
        }
    }
};

public method .is_general_cache() {
    return 'general_cache in (.flags());
};

public method .match_command() {
    arg str, cmd, args;
    var command, m, matched, templates, info, cdef, def, cmds, c, p;
    
    templates = (matched = []);
    cmds = #[];
    if (dict_contains(commands, cmd))
        cmds = #[[this(), commands[cmd]]];
    for def in (parents() + modules) {
        if ((c = def.command_cache()) && dict_contains(c, cmd))
            cmds = dict_add(cmds, def, c[cmd]);
    }
    if (!cmds)
        return 0;
    for def in (cmds) {
        if ((def[1]) in parents())
            p = this();
        else
            p = def[1];
        for command in (def[2]) {
            if (!(info = (command[2]).command_info('local, command[1])))
                continue;
            for cdef in (info) {
                if ((m = match_template(args, cdef[2])) != 0)
                    matched += [[listlen(m), [str, cmd, @m], p, @sublist(cdef, 3)]];
            }
            templates = union(templates, info.slice(3));
            refresh();
        }
    }
    if (matched) {
        info = [matched[1]];
        matched = delete(matched, 1);
        for m in (matched) {
            if ((m[1]) > ((info[1])[1]))
                info = [m];
            else if ((m[1]) == ((info[1])[1]))
                info += [m];
        }
        return ['command, info];
    }
    if (!templates)
        return 0;
    return ['partial, templates];
};

public method .match_remote_command() {
    arg str, cmd, args;
    var command, m, matched, templates, info, cdef, def, cmds, c;
    
    if (this() != $remote_cache)
        throw(~perm, "This should only be used on $remote_cache");
    templates = (matched = []);
    if (commands && dict_contains(commands, cmd))
        cmds = commands[cmd];
    else
        return 0;
    for command in (cmds) {
        if (!(info = (command[2]).command_info('remote, command[1])))
            continue;
        for cdef in (info) {
            if ((m = match_template(args, cdef[2])) != 0)
                matched += [[listlen(m), command[2], [str, cmd, @m], @sublist(cdef, 3)]];
        }
        templates = union(templates, info.slice(3));
        refresh();
    }
    if (matched)
        return ['remote, matched];
    if (!templates)
        return 0;
    return ['partial, templates];
};

public method .match_shortcut() {
    arg str, @ignore;
    var s, match, obj, args;
    
    for obj in (([this()] + filter s in (parents()) where (s.has_ancestor($command_cache))) + modules) {
        for s in ((obj.shortcut_cache()) || []) {
            if ((match = match_pattern(str, s[1])) != 0) {
                args = $command_lib.handle_shortcut_fields((s[2])[2], match);
                return ['shortcut, [(s[2])[1], [str, @args]]];
            }
        }
    }
    return 0;
};

public method .parse_command_module() {
    arg value, action, @args;
    
    value = (> $object_lib.to_dbref(value) <);
    if (!(value.is($user_interfaces)))
        throw(~failed, (value.namef('ref)) + " is not a child of $user_interfaces");
    if (!('general_cache in (value.flags())))
        throw(~failed, (value.namef('ref)) + " is not set as a general cache");
    if (action == 'del) {
        if (!(value in modules))
            throw(~failed, ("The module '" + value) + "' is not set, and thus cannot be removed");
        return value;
    }
    return value;
};

public method .purge_cache() {
    (caller() == definer()) || (> .perms(sender()) <);
    (| clear_var('commands) |) || (commands = 0);
    (| clear_var('shortcuts) |) || (shortcuts = 0);
};

public method .rehash_cache() {
    var cmd, obj, part, element, info;
    
    (> .perms(sender()) <);
    (| .purge_cache() |);
    if (!(.is_general_cache())) {
        // if we are not an official cache, just cache commands we define
        commands = #[];
        for cmd in (.local_commands()) {
            for part in (cmd[2])
                .add_to_cache(part[1], this());
        }
        shortcuts = (.shortcuts()).to_list();
    } else {
        // otherwise cache all defined commands
        if ((info = .all_local_commands())) {
            for element in (info) {
                [obj, element] = element;
                for part in (element)
                    .add_to_cache(part[1], obj);
            }
        }
        shortcuts = .all_shortcuts();
    }
};

protected method .set_command_modules() {
    arg name, definer, value;
    var m;
    
    switch (value[1]) {
        case 'set:
            for m in (modules.set_difference(value[2]))
                .del_command_module(m);
            for m in ((value[2]).set_difference(modules))
                .add_command_module(m);
        case 'add:
            .add_command_module(value[2]);
        case 'del:
            .del_command_module(value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

public method .shortcut_cache() {
    return shortcuts;
};

root method .uninit_command_cache() {
    var m;
    
    (| .purge_cache() |);
    for m in (modules || [])
        m.cache_server_uninit();
};


