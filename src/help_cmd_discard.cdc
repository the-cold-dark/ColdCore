
new object $help_cmd_discard: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "discard", "discard"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["discard <frob>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Destroys a <frob> and removes it from the system. This command will not destroy normal objects, use ", <$format, ["link", [["node", "$help_cmd_destroy"]], ["@destroy"], 'do_link]>, " instead.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_coldc_types_frobs"]], ["Frobs"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_new"]], ["@new"], 'do_link]>], #[['links, #[["@destroy", "$help_cmd_destroy"], ["Frobs", "$help_coldc_types_frobs"], ["@new", "$help_cmd_new"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@destroy", $help_cmd_destroy], ["Frobs", $help_coldc_types_frobs], ["@new", $help_cmd_new]];
var $root created_on = 870757106;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_discard];
var $root manager = $help_cmd_discard;


