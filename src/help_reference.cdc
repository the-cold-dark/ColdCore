
new object $help_reference: $help_coldcore;

var $has_name name = ['prop, "Reference Library", "Reference Library"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Nodes from this point down are for core subsystem documentation and documentation on specific objects.", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_index_subsystem"]], ["Subsystem"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Subsystems Index"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_index_objects"]], ["Object"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Core Objects Index"], 'do_dd]>], 'do_dl]>], #[['this, $help_reference]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Subsystem", $help_index_subsystem], ["Object", $help_index_objects]];
var $help_node nolist = 0;
var $root created_on = 847916304;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_reference];
var $root manager = $help_reference;


