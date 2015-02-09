
new object $help_cmd_addcmd: $help_cmds;

var $has_name name = ['prop, "@add-command|@ac", "@add-command|@ac"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-c?ommand|@ac \"<Command Template>\" [to|for] <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Used to add a command. The method called if the command matches must be specified. The command template must be an ", <$format, ["link", [["node", "$help_commands_enhanced"]], ["Enhanced Command Template"], 'do_link]>, ". Arguments send to the method are always ordered the same, the first argument is always the command string, followed by subsequent arguments relative to how the command template would match using template matching (see ", <$format, ["link", [["node", "$help_commands_matching"]], ["Matching Conventions"], 'do_link]>, ").", <$format, ["p", [], [], 'do_p]>, "For instance, the following enhanced command template:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["\"@get <any> from <this>\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Would evaluate to the following standard template:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["\"@get * from *\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "From this point, you can simply evaluate the template matching to see how its results would be ordered:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [";match_template(\"@get something from nothing\", \"@get * from *\")", <$format, ["br", [], [], 'do_br]>, "=> [\"@get\", \"something\", \"from\", \"nothing\"]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Based off these results the arg definition for your method could be:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["arg cmdstr, cmd, arg1, prep, arg2;"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When a command is added it will not immediately begin working. Command caches must be updated first. There are three different situations that will arise when adding a command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], ["Adding a local command to yourself"], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "This situation is the simplest to update. If you have added a command to yourself simply type ", <$format, ["link", [["node", "$help_cmd_rehash"]], ["@rehash"], 'do_link]>, ", and your local caches will be updated.", <$format, ["p", [], [], 'do_p]>], 'do_dd]>, <$format, ["dt", [], ["Adding a remote command to an object"], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "When adding a remote command to something you can rehash the remote caches by simply dropping the item and picking it back up.", <$format, ["p", [], [], 'do_p]>], 'do_dd]>, <$format, ["dt", [], ["Adding a local command to another object"], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "If you are adding a local command to an object other than yourself, you will have to rehash the entire system's caches. This is done with the command ", <$format, ["link", [["node", "$help_cmd_rehashall"]], ["@rehash-all"], 'do_link]>, ", which is an administrative command."], 'do_dd]>], 'do_dl]>], #[['links, #[["Enhanced Command Template", "$help_commands_enhanced"], ["Matching Conventions", "$help_commands_matching"], ["@rehash", "$help_cmd_rehash"], ["@rehash-all", "$help_cmd_rehashall"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Enhanced Command Template", $help_commands_enhanced], ["Matching Conventions", $help_commands_matching], ["@rehash", $help_cmd_rehash], ["@rehash-all", $help_cmd_rehashall]];
var $root created_on = 848119837;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_addcmd];
var $root manager = $help_cmd_addcmd;

