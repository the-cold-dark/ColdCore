
new object $help_appearance: $help_general;

var $has_name name = ['prop, "Appearance", "Appearance"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Anything in the virtual environment will always have some common attributes, such as name, description and gender. If you manage the item, you can change these attributes and alter its appearance (this includes yourself). Everything that can be changed is described in more detail in the following sections:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_app_names"]], ["Names"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_app_desc"]], ["Description"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_app_gender"]], ["Gender"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_app_wearing"]], ["Wearing"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['links, #[["Names", "$help_app_names"], ["Description", "$help_app_desc"], ["Gender", "$help_app_gender"], ["Wearing", "$help_app_wearing"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Names", $help_app_names], ["Description", $help_app_desc], ["Gender", $help_app_gender], ["Wearing", $help_app_wearing]];
var $help_node nolist = 0;
var $root created_on = 855981674;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_appearance];
var $root manager = $help_appearance;


