
new object $help_cmd_drop: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "drop", "drop"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["drop <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows you to move objects in your ", <$format, ["link", [["node", "$help_cmd_inventory"]], ["inventory"], 'do_link]>, " to your current location.", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_get"]], ["get"], 'do_link]>], #[['links, #[["inventory", "$help_cmd_inventory"], ["get", "$help_cmd_get"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["inventory", $help_cmd_inventory], ["get", $help_cmd_get]];
var $root created_on = 870926490;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_drop];
var $root manager = $help_cmd_drop;


