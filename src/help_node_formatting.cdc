
new object $help_node_formatting: $help_obj_help_node;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Format Conventions", "Format Conventions"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Close attention should be given to how a help node is formatted, so that it looks the same as other help nodes. Everything from spacing to which tags to use in which situation should be the same from help node to help node of similar type (such as commands). ", <$format, ["np", [], [], 'do_np]>, "Formatting Conventions:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_formatting_general"]], ["General"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_formatting_commands"]], ["Commands"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_formatting_objects"]], ["Objects"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['links, #[["General", "$help_formatting_general"], ["Commands", "$help_formatting_commands"], ["Objects", "$help_formatting_objects"]]]]]>;
var $help_node links = #[["General", $help_formatting_general], ["Commands", $help_formatting_commands], ["Objects", $help_formatting_objects]];
var $root created_on = 870560380;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_formatting];
var $root manager = $help_node_formatting;


