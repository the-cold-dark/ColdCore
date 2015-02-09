
new object $help_cmd_delshortcut: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-shortcut|@ds", "@del-shortcut|@ds"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@ds \"<shortcut>\" [from] <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Removes an existing shortcut from an object. ", <$format, ["np", [], [], 'do_np]>, "See also: ", <$format, ["link", [["node", "$help_cmd_addshortcut"]], ["@add-shortcut"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_dca"]], ["@del-command-alias"], 'do_link]>], #[['links, #[["@add-shortcut", "$help_cmd_addshortcut"], ["@add-command-alias", "$help_cmd_aca"], ["@del-command-alias", "$help_cmd_dca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-shortcut", $help_cmd_addshortcut], ["@add-command-alias", $help_cmd_aca], ["@del-command-alias", $help_cmd_dca]];
var $root created_on = 870646752;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_delshortcut];
var $root manager = $help_cmd_delshortcut;


