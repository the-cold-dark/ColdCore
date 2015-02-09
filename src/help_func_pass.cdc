
new object $help_func_pass: $help_funcs_task;

var $has_name name = ['prop, "pass()", "pass()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " pass(", <$format, ["i", [], ["..."], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to call an overridden method, from the current method. When called any arguments sent to ", <$format, ["tt", [], ["pass()"], 'do_tt]>, " are sent to the overridden method, as if it was called with those arguments. When passing to a method, the current frame's values do not change (i.e. the caller and sender stay the same as in the method that is passing back). For more information see the section ", <$format, ["link", [["node", "$help_coldc_mcall_over"]], ["Overridden Methods"], 'do_link]>, "."], #[['this, $help_func_pass]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Overridden Methods", $help_coldc_mcall_over]];
var $help_node nolist = 0;
var $root created_on = 855811819;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_pass];
var $root manager = $help_func_pass;


