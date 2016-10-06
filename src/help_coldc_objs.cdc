
new object $help_coldc_objs: $help_coldc;

var $has_name name = ['prop, "Objects", "Objects"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "An object in ColdC is both a data type and a database record. Objects are structured with ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_oop"]], ["parents"], 'do_link]>], 'do_i]>, " and ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_oop"]], ["children"], 'do_link]>], 'do_i]>, " in a tree (geneology-style) hierarchy known as the ", <$format, ["i", [], ["object hierarchy"], 'do_i]>, ". An object has both ColdC procedures (", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_objs_methods"]], ["methods"], 'do_link]>], 'do_i]>, ") and ColdC Data (", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_objs_vars"]], ["variables"], 'do_link]>], 'do_i]>, ") bound to it. The object variables are accessed and modified by the methods defined on the object. ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_objs_ref"]], ["Referencing Objects"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_objs_methods"]], ["Methods"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_objs_vars"]], ["Variables"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_objs_special"]], ["Special Objects"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_objs]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["parents", $help_coldc_oop], ["children", $help_coldc_oop], ["methods", $help_coldc_objs_methods], ["variables", $help_coldc_objs_vars], ["Referencing Objects", $help_coldc_objs_ref], ["Special Objects", $help_coldc_objs_special]];
var $help_node nolist = 0;
var $root created_on = 853696071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_objs];
var $root manager = $help_coldc_objs;


