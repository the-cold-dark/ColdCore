
new object $bad_commands: $user_interfaces;

var $bad_commands non_supported_cmds = #[["quit", "@quit"], ["WHO", "@who"], ["@create", "@new"], ["help", "@help"], ["news", "@news"], ["page", "@page"], ["@gender", "@set gender"], ["uptime", "@status"], ["@alias", "@add-command-alias` or `@add-name-alias"], ["@check", "@monitor"], ["@paranoid", "@monitor"], ["@version", "@status"], ["@lock", "@set lock"], ["@unlock", "@set lock"], ["+com", ["See: `@help Channels`"]], ["tell", "@page"]];
var $command_cache modules = [];
var $has_commands local = \
  #[["@create", [["@create", "*", "@create <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["help",\
    [["help", "*", "help <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["page",\
    [["page", "*", "page <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["who",\
    [["who", "*", "who <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["quit",\
    [["quit", "*", "quit <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["news",\
    [["news", "*", "news <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@gender",\
    [["@gender", "*", "@gender <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["uptime",\
    [["uptime", "*", "uptime <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@alias",\
    [["@alias", "*", "@alias <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@check|@paranoid",\
    [["@check|@paranoid", "*", "@check|@paranoid <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@version",\
    [["@version", "*", "@version <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@lock",\
    [["@lock", "*", "@lock <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["@unlock",\
    [["@unlock", "*", "@unlock <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["+com",\
    [["+com", "*", "+com <any>", 'old_command_cmd, #[[1, ['any, []]]]]]],\
  ["tell",\
    [["tell", "*", "tell <any>", 'old_command_cmd, #[[1, ['any, []]]]]]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$bad_commands];
var $root manager = $bad_commands;

public method .add_old_cmd_reference() {
    arg oldcmd, @newcmd;
    
    (> .perms(caller()) <);
    if (this() != $bad_commands)
        throw(~perm, "Only define bad commands on $bad_commands");
    if ((" " in oldcmd) || (("<" in oldcmd) || ("*" in oldcmd)))
        throw(~perm, "Just the first word of the old command.");
    if (newcmd)
        non_supported_cmds = non_supported_cmds.add(oldcmd, newcmd[1]);
    .add_command(oldcmd + " <any>", 'old_command_cmd);
};

public method .non_supported_cmds() {
    return non_supported_cmds;
};

protected method .old_command_cmd() {
    arg cmdstr, com, @args;
    var line, equiv, pref;
    
    (> .perms(caller(), 'command) <);
    equiv = (| ($bad_commands.non_supported_cmds())[com] |);
    line = ("Oops, `" + com) + "` is not supported here.";
    if (equiv) {
        if (type(equiv) == 'list)
            line = (line + "  ") + (equiv[1]);
        else
            line = ((line + "  Try `") + equiv) + "`";
    }
    .tell(line);
    .tell("Use `@help commands` for an explanation on the differences in commands.");
};


