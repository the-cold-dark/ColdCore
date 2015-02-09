
new object $help_cmd_delvariable: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-variable|@dv", "@del-variable|@dv"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@del-v?ariable|@dv <objref>,<variable>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The purpose of @del-variable is to remove variables from an <objref>.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_addvariable"]], ["@add-v?ariable"], 'do_link]>], #[['links, #[["@add-v?ariable", "$help_cmd_addvariable"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-v?ariable", $help_cmd_addvariable]];
var $root created_on = 870645893;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_delvariable];
var $root manager = $help_cmd_delvariable;


