
new object $help_cmd_give: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "give|put", "give|put"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["give|put <thing> to|in <thing>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows you to transfer an object between your ", <$format, ["link", [["node", "$help_cmd_inventory"]], ["inventory"], 'do_link]>, " and another object, or between one object and another. In the case of users, you can not transfer one user to another, only objects can be transferred into a user.", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_get"]], ["get"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_drop"]], ["drop"], 'do_link]>], #[['links, #[["inventory", "$help_cmd_inventory"], ["get", "$help_cmd_get"], ["drop", "$help_cmd_drop"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["inventory", $help_cmd_inventory], ["get", $help_cmd_get], ["drop", $help_cmd_drop]];
var $root created_on = 877822514;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_give];
var $root manager = $help_cmd_give;


