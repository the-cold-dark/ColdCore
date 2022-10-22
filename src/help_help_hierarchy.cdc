
new object $help_help_hierarchy: $help_help;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Hierarchy", "Hierarchy"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The help files are not only hypertextual, but are also hierarchical. This means they are ordered in a parent/child manner (such as an outline), where general help topics are parents to specific help topics. ", <$format, ["np", [], [], 'do_np]>, "One useful result of this is a list of topics related to the current node, at the bottom of the page. These related topics are listed as links on the last line, with a series of dashes on each side (look at the bottom of this page and see if you can find them). ", <$format, ["np", [], [], 'do_np]>, "In the related topics list there are also dots. A single dot represents the current page in its order, relative to its sibling nodes. A double dot means there are more nodes, they just cannot be displayed. ", <$format, ["np", [], [], 'do_np]>, "You can also navigate up, back and forward in the help hierarchy, relative to the current help node. You can do this by using the options -up, -back and -forward; or by using the shorthand characters '", <$format, ["tt", [], ["^"], 'do_tt]>, "', '", <$format, ["tt", [], ["<"], 'do_tt]>, "' and '", <$format, ["tt", [], [">"], 'do_tt]>, "'. See the section on ", <$format, ["link", [["node", "$help_help_options"]], ["Help Options"], 'do_link]>, " for more detail on the available options and shorthand characters."], #[['links, #[["Help Options", "$help_help_options"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Help Options", $help_help_options]];
var $root created_on = 998869346;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_help_hierarchy];
var $root manager = $help_help_hierarchy;


