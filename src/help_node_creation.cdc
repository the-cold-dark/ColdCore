
new object $help_node_creation: $help_obj_help_node;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Creation", "Creation"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "When creating a help node, be sure to keep the following conventions in mind: ", <$format, ["np", [], [], 'do_np]>, "Command nodes always descend from ", <$format, ["tt", [], ["$help_cmds"], 'do_tt]>, ", but have the prefix 'help_cmd_' (non-plural). Command nodes always go in the Command help index (", <$format, ["tt", [], ["$help_index_cmds"], 'do_tt]>, "). ", <$format, ["np", [], [], 'do_np]>, "ColdCore help descends from ", <$format, ["tt", [], ["$help_coldcore"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "Subsystems descend from ", <$format, ["tt", [], ["$help_sys"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "Object help descends from ", <$format, ["tt", [], ["$help_obj"], 'do_tt]>, " (generally libraries) ", <$format, ["np", [], [], 'do_np]>, "When naming an object, include its parentage where appropriate. However, dont include all levels of descending in the name. Use what is necessary to make it unique without being overbearing. For instance, ", <$format, ["tt", [], ["$help_coldc_func"], 'do_tt]>, " is perfectly fine, where ", <$format, ["tt", [], ["$help_coldcore_prog_coldc_func"], 'do_tt]>, " would be the ''full'' name (use the former, not the latter). All help nodes should begin with the 'help_' prefix, but not 'help_node_'. ", <$format, ["np", [], [], 'do_np]>, "only specify an index for a help node, when the help node is a unique concept (specifically in the name). For instance, the node 'Events' exists, and has several children nodes including the node 'Registering'. In this situation 'Events' is indexed but 'Registering' is not. ", <$format, ["np", [], [], 'do_np]>, "make sure the node settings are correct. These can be confusing, so try to navigate the tree from various directions and make sure everything is functioning and displaying properly. (see Help Node Settings for more information)}"], #[]]>;
var $help_node links = #[];
var $root created_on = 870560232;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_creation];
var $root manager = $help_node_creation;


