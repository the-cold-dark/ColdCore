
new object $help_coldc_simple_assign: $help_coldc_assign;

var $has_name name = ['prop, "Simple", "Simple"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Both simple and scatter assignments use the same equals sign ", <$format, ["tt", [], ["="], 'do_tt]>, " operator. A simple assignment stores the result of the expression on the right into the variable on the left, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["variable"], 'do_i]>, " = ", <$format, ["i", [], ["expression"], 'do_i]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_set_var"]], ["set_var()"], 'do_link]>], 'do_tt]>, " may also be used for the same purpose, but only on an object variable (see ", <$format, ["link", [["node", "$help_coldc_vars"]], ["Variables"], 'do_link]>, ")."], #[['this, $help_coldc_simple_assign]]]>;
var $help_node links = #[["set_var()", $help_func_set_var], ["Variables", $help_coldc_vars]];
var $help_node nolist = 0;
var $root created_on = 854128989;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_simple_assign];
var $root manager = $help_coldc_simple_assign;


