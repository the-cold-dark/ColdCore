
new object $has_commands: $foundation;

var $has_commands local = 0;
var $has_commands remote = 0;
var $has_commands shortcuts = #[];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$has_commands];
var $root manager = $has_commands;

public method .add_command() {
    arg template, method, @type;
    var cmd, types, count, x;
    
    (> .perms(sender()) <);
    [(type ?= 'local)] = type;
    if ("*" in template)
        throw(~invcmd, "Invalid command, command templates cannot contain \"*\"!.");
    cmd = (> $command_lib.validate_command_template(template) <);
    if (!(type in ['local, 'remote]))
        throw(~type, "Command types can be either 'local or 'remote");
    if ('this in (((cmd[2]).values()).slice(1)))
        type = 'remote;
    if (type == 'remote) {
        for x in (((cmd[2]).values()).slice(1)) {
            if (x == 'this)
                count++;
        }
        if (!count)
            throw(~add_command, "Command type defined as remote with no <this> argument.");
        else if (count > 1)
            throw(~add_command, "More than one <this> argument specified in template.");
    }
    if (!get_var(type))
        set_var(type, #[]);
    set_var(type, get_var(type).setadd_elem((cmd[1])[1], [@cmd[1], template, method, cmd[2]]));
    if (type == 'remote)
        $remote_cache.add_remote_command((cmd[1])[1], this());
    else if ((.command_modules()) || filter x in (parents()) where ('general_cache in (x.flags())))
        (| .cache_client_init() |);
};

public method .add_shortcut() {
    arg shortcut, template, method;
    var relation;
    
    (> .perms(sender()) <);
    if ((type(shortcut) != 'string) || (type(template) != 'string))
        throw(~type, "Both shortcut and template must be strings.");
    if (type(method) != 'symbol)
        throw(~type, "Method must be submitted as a symbol.");
    relation = (> $command_lib.parse_relation(shortcut, template) <);
    shortcut = (relation[1])[1];
    relation = (relation[2])[2];
    if (!shortcuts)
        shortcuts = #[];
    shortcuts = shortcuts.add(shortcut, [method, relation]);
};

public method .all_local_commands() {
    var cmds, a, acmds;
    
    cmds = #[];
    for a in (ancestors()) {
        if (a == definer())
            break;
        if ((acmds = (| a.local_commands() |)))
            cmds = cmds.add(a, acmds);
    }
    return cmds;
};

public method .all_remote_commands() {
    var cmds, a, acmds;
    
    cmds = #[];
    for a in (ancestors()) {
        if (a == definer())
            break;
        if ((acmds = (| a.remote_commands() |)))
            cmds = cmds.add(a, acmds);
    }
    return cmds;
};

public method .all_shortcuts() {
    var s, a, as;
    
    s = [];
    for a in (ancestors()) {
        if (a == definer())
            break;
        if ((as = (| a.shortcuts() |)))
            s += as.to_list();
    }
    return s;
};

public method .command_info() {
    arg type, cmd;
    
    return (| get_var(type)[cmd] |) || throw(~cmdnf, ("Command \"" + cmd) + "\" is not defined on this object.", cmd);
};

public method .del_command() {
    arg template, method;
    var cmd, c, d, info, type;
    
    (> .perms(sender()) <);
    cmd = template.explode();
    if (!cmd)
        throw(~type, "Invalid template.");
    cmd = cmd[1];
    info = #[['local, .get_command_info('local, cmd)]];
    info = info.add('remote, .get_command_info('remote, cmd));
    for type in (info) {
        for c in (type[2]) {
            if (((c[3]) == template) && ((c[4]) == method)) {
                set_var(type[1], get_var(type[1]).del_elem(cmd, c));
                if ((type[1]) == 'remote)
                    $remote_cache.del_remote_command(cmd, this());
                d++;
            }
        }
    }
    return d;
};

public method .del_shortcut() {
    arg shortcut;
    var value;
    
    (> .perms(sender()) <);
    
    // remove the cards, just use the raw template
    shortcut = strsed("-%1 %2", "%[0-9]+", "*");
    
    // delete it...
    value = (| shortcuts.del(shortcut) |);
    if (type(value) != 'dictionary)
        throw(~shortcutnf, ("Shortcut \"" + shortcut) + "\" is not defined on this object.");
    shortcuts = value;
};

public method .get_command_info() {
    arg type, cmd;
    var info, a, ainfo;
    
    info = [];
    for a in (ancestors()) {
        if (a == definer())
            break;
        if ((ainfo = (| a.command_info(type, cmd) |)))
            info = union(info, ainfo);
    }
    return info;
};

public method .get_shortcut_info() {
    arg shortcut;
    
    return (| shortcuts[shortcut] |) || throw(~shortcutnf, ("Shortcut \"" + shortcut) + "\" is not defined on this object.", shortcut);
};

root method .init_has_commands() {
    local = (remote = (shortcuts = #[]));
};

public method .local_commands() {
    return local || #[];
};

public method .remote_commands() {
    return remote || #[];
};

public method .shortcuts() {
    return shortcuts || #[];
};

root method .uninit_has_commands() {
    var c, cmd;
    
    for c in ((.remote_commands()).values()) {
        for cmd in (c)
            .del_command(cmd[3], cmd[4]);
    }
    (| clear_var('remote) |);
    (| clear_var('local) |);
    (| clear_var('shortcuts) |);
};


