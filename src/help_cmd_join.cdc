
new object $help_cmd_join: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@join", "@join"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@join <user>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command ", <$format, ["link", [["node", "$help_cmd_teleport"]], ["teleports"], 'do_link]>, " you to the same location that <user> is located."], #[['links, #[["teleports", "$help_cmd_teleport"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["teleports", $help_cmd_teleport]];
var $root created_on = 870647079;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_join];
var $root manager = $help_cmd_join;


