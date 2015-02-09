
new object $command_aliases: $user_interfaces;

var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$command_aliases];
var $root manager = $command_aliases;

public method .add_command_alias() {
    arg alias, actual;
    var relation, a;
    
    (> .perms(sender()) <);
    if ((type(alias) != 'string) || (type(actual) != 'string))
        throw(~type, "alias and actual are not strings.");
    relation = (> $command_lib.parse_relation(alias, actual) <);
    
    // have it 'replace' the old alias (if one exists) by first removing
    // the old one, and adding the new one later.
    for a in (command_aliases) {
        if ((a[1]) == alias)
            command_aliases = command_aliases.setremove(a);
    }
    command_aliases += [[(relation[1])[1], (relation[2])[2]]];
};

public method .all_command_aliases() {
    var user, aliases, userc;
    
    // Collect complete command alias list from ancestors.
    aliases = [];
    for user in (.ancestors()) {
        userc = (| user.command_aliases() |);
        if (userc)
            aliases += userc;
        if (user == definer())
            break;
    }
    return aliases;
};

public method .command_aliases() {
    return command_aliases;
};

public method .del_command_alias() {
    arg alias;
    var ca, rel;
    
    (> .perms(sender()) <);
    if (type(alias) != 'string)
        throw(~type, "alias is not a string.");
    rel = (> $command_lib.parse_relation(alias, alias) <);
    rel = rel[1];
    for ca in (command_aliases) {
        if ((ca[1]) == (rel[1])) {
            command_aliases = command_aliases.setremove(ca);
            return;
        }
    }
    throw(~aliasnf, ("alias `" + alias) + "' is not found");
};

root method .init_command_aliases() {
    command_aliases = [];
};

public method .match_command_aliases() {
    arg str;
    var alias, argf, match, newstr;
    
    // attempts to rebuild the string for an alias.
    if (sender() != this())
        throw(~perm, "Sender is not this.");
    for alias in (.all_command_aliases()) {
        match = str.match_pattern(alias[1]);
        if (match != 0) {
            newstr = alias[2];
            for argf in [1 .. match.length()]
                newstr = newstr.replace("%" + tostr(argf), match[argf]);
            return newstr;
        }
    }
    return str;
};

root method .uninit_command_aliases() {
    command_aliases = [];
};


