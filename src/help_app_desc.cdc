
new object $help_app_desc: $help_appearance;

var $has_name name = ['prop, "Description", "Description"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "If you are the manager of an item you can change it's description with the command ", <$format, ["link", [["node", "$help_cmd_describe"]], ["@describe"], 'do_link]>, ". Descriptions are entered as ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, ", but you do not need to know CML to describe something--just to use its features."], #[['this, $help_app_desc]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@describe", $help_cmd_describe], ["CML", $help_cml]];
var $help_node nolist = 0;
var $root created_on = 856649225;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_app_desc];
var $root manager = $help_app_desc;


