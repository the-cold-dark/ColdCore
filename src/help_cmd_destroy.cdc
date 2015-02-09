
new object $help_cmd_destroy: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@destroy", "@destroy"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@destroy <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Destroys an <object> and removes it from the system. This command will not destroy ", <$format, ["link", [["node", "$help_coldc_types_frobs"]], ["Frobs"], 'do_link]>, ", use ", <$format, ["link", [["node", "$help_cmd_discard"]], ["discard"], 'do_link]>, " instead.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_new"]], ["@new"], 'do_link]>], #[['links, #[["Frobs", "$help_coldc_types_frobs"], ["discard", "$help_cmd_discard"], ["@new", "$help_cmd_new"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Frobs", $help_coldc_types_frobs], ["discard", $help_cmd_discard], ["@new", $help_cmd_new]];
var $root created_on = 870660035;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_destroy];
var $root manager = $help_cmd_destroy;


