
new object $help_cmd_get: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "get|take", "get|take"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["get|take <object>"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["get|take <object> from <location>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows you to move objects from your current location to your ", <$format, ["link", [["node", "$help_cmd_inventory"]], ["inventory"], 'do_link]>, ".", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "The second form allows you to move objects from an alternate location to your inventory.", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_drop"]], ["drop"], 'do_link]>], #[['links, #[["inventory", "$help_cmd_inventory"], ["drop", "$help_cmd_drop"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["inventory", $help_cmd_inventory], ["drop", $help_cmd_drop]];
var $root created_on = 870926521;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_get];
var $root manager = $help_cmd_get;


