
new object $help_node_names: $help_obj_help_node;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Names", "Names"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Help nodes do not use ", <$format, ["link", [["node", "$help_app_names"]], ["name templates"], 'do_link]>, ", due to indexing and referencing concerns. Instead to have a help node be indexed with more than one name, include all the names in the node name, separating them with a pipe character ('", <$format, ["tt", [], ["|"], 'do_tt]>, "'), such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["\"@help-list|@hlist|@hl\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When this is done, each part will be indexed separately, and only the first name in the group will be displayed on the Help Node Page."], #[['links, #[["name templates", "$help_app_names"]]]]]>;
var $help_node links = #[["name templates", $help_app_names]];
var $root created_on = 870559844;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_names];
var $root manager = $help_node_names;


