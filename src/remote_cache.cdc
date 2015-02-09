
new object $remote_cache: $command_cache;

var $command_cache commands = 0;
var $command_cache modules = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 874702845;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$remote_cache];
var $root manager = $remote_cache;

public method .add_remote_command() {
    arg @args;
    
    if (caller() != $has_commands)
        throw(~perm, "Only $has_commands may call this method.");
    return .add_to_cache(@args);
};

public method .del_remote_command() {
    arg @args;
    
    if (caller() != $has_commands)
        throw(~perm, "Only $has_commands may call this method.");
    return .del_from_cache(@args);
};

public method .rehash_cache() {
    var def, cmd;
    
    (> .perms(sender()) <);
    
    // oof, this is big and nasty.  We will need to pick through the
    // whole db to find all remotely defined commands.  Dont do this
    // often--it should keep itself up to date when they are added
    // or removed.
    for def in ($has_commands.descendants()) {
        for cmd in ((def.remote_commands()).keys())
            .add_to_cache(cmd, def);
        refresh();
    }
};


