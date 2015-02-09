
new object $help_obj_help_node: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Help Node", "Help Node"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "These pages explain how to create a help system (or just a single help node), and the conventions and standards that should be followed.", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["link", [["node", "$help_node_commands"]], ["Commands"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Commands to use in manipulating help nodes"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_names"]], ["Names"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Information about naming help nodes"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_settings"]], ["Setting"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Information about help node settings"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_creation"]], ["Creation"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Conventions used in creating a help node"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_formatting"]], ["Formatting"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Common Help Node formatting Conventions"], 'do_dd]>], 'do_dl]>], #[['links, #[["Commands", "$help_node_commands"], ["Names", "$help_node_names"], ["Setting", "$help_node_settings"], ["Creation", "$help_node_creation"], ["Formatting", "$help_node_formatting"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[["Commands", $help_node_commands], ["Names", $help_node_names], ["Setting", $help_node_settings], ["Creation", $help_node_creation], ["Formatting", $help_node_formatting]];
var $root created_on = 870559421;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_help_node];
var $root manager = $help_obj_help_node;


