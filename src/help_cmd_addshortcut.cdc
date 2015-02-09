
new object $help_cmd_addshortcut: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-shortcut|@as", "@add-shortcut|@as"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-s?hortcut|@as \"<shortcut>\" [to] <command> [on] <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command adds a shortcut to a <command> on <object>. This is similar to the ", <$format, ["link", [["node", "$help_cmd_addcmd"]], ["@add-command"], 'do_link]>, " command, however, @add-shortcut allows you to alias an existing command, to a shorter or different name. ", <$format, ["np", [], [], 'do_np]>, "See also: ", <$format, ["link", [["node", "$help_cmd_delshortcut"]], ["@del-shortcut"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_dca"]], ["@del-command-alias"], 'do_link]>], #[['links, #[["@add-command", "$help_cmd_addcmd"], ["@del-shortcut", "$help_cmd_delshortcut"], ["@add-command-alias", "$help_cmd_aca"], ["@del-command-alias", "$help_cmd_dca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-command", $help_cmd_addcmd], ["@del-shortcut", $help_cmd_delshortcut], ["@add-command-alias", $help_cmd_aca], ["@del-command-alias", $help_cmd_dca]];
var $root created_on = 870589235;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_addshortcut];
var $root manager = $help_cmd_addshortcut;


