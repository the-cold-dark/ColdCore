
new object $help_obj_list: $help_obj;

var $has_name name = ['prop, "List Library", "List Library"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["link", [["node", "$help_list_element"]], ["Elements"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Element operations"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_list_formatting"]], ["Formatting"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["List formatting"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_list_maps"]], ["Maps"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Mapping and filtering"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_list_sets"]], ["Sets"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Set operations"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_list_other"]], ["Others"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Others"], 'do_dd]>], 'do_dl]>], #[['this, $help_obj_list]]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[["Elements", $help_list_element], ["Formatting", $help_list_formatting], ["Maps", $help_list_maps], ["Sets", $help_list_sets], ["Others", $help_list_other]];
var $help_node nolist = 0;
var $root created_on = 837714742;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_list];
var $root manager = $help_obj_list;


