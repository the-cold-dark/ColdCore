
new object $help_cmd_map: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@map", "@map"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@map"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "@map shows you your surroundings, if the current room or realm recognize them. See ", <$format, ["link", [["node", "$help_obj_generic_map"]], ["Generic Map"], 'do_link]>, " for more information."], #[['links, #[["Generic Map", "$help_obj_generic_map"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Generic Map", $help_obj_generic_map]];
var $root created_on = 870926082;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_map];
var $root manager = $help_cmd_map;


