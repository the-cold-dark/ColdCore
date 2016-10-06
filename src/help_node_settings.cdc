
new object $help_node_settings: $help_obj_help_node;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Settings", "Settings"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Settings on a help node:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["group = yes", <$format, ["br", [], [], 'do_br]>, "holder = no", <$format, ["br", [], [], 'do_br]>, "index =", <$format, ["br", [], [], 'do_br]>, "nolist = yes"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The group setting is used to control if a node lists the group (i.e. its siblings) at the bottom of the page. If group is enabled, they will be listed. Otherwise, they will not be listed. Note: If the help node is a child of ", <$format, ["tt", [], ["$help_obj"], 'do_tt]>, ", ", <$format, ["tt", [], ["$help_sys"], 'do_tt]>, ", ", <$format, ["tt", [], ["$help_cmds"], 'do_tt]>, " or a similar 'place-holder' object, its group should be set to no. ", <$format, ["np", [], [], 'do_np]>, "The holder setting is enabled when a help node exists purely for hierarchical reasons. This changes how the object is listed when a title is generated with all hierarchical information. If holder is enabled, no links will be made to the object. ", <$format, ["np", [], [], 'do_np]>, "The index setting is used to set the help index (children of $help_index). Only specify an index for a help node when the help node is a unique concept (specifically in the name). For instance, the node 'Events' exists, and has several children nodes including the node 'Registering'. In this situation 'Events' is indexed but 'Registering' is not. ", <$format, ["np", [], [], 'do_np]>, "The nolist setting is used to make an object 'invisible', so that it does not showup in groups or hierarchical information."], #[]]>;
var $help_node links = #[];
var $root created_on = 870559923;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_settings];
var $root manager = $help_node_settings;


