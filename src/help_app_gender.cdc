
new object $help_app_gender: $help_appearance;

var $has_name name = ['prop, "Gender", "Gender"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "If you are the manager of an item you can change it's gender. By default all genders are neuter. An item's gender is changed using the command ", <$format, ["link", [["node", "$help_cmd_set"]], ["@set"], 'do_link]>, " with the ", <$format, ["tt", [], ["gender"], 'do_tt]>, " setting, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set me:gender=male"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If you do not specify a gender, all of the possibilities will be listed."], #[['this, $help_app_gender]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@set", $help_cmd_set]];
var $help_node nolist = 0;
var $root created_on = 856649225;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_app_gender];
var $root manager = $help_app_gender;


