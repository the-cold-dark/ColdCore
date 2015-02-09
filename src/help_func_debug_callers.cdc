
new object $help_func_debug_callers: $help_funcs_task;

var $has_name name = ['prop, "debug_callers()", "debug_callers()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>], 'do_tt]>, " debug_callers(", <$format, ["i", [], ["INTEGER mode"], 'do_i]>, ")"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the mode for ", <$format, ["link", [["node", "$help_func_call_trace"]], ["call_trace"], 'do_link]>, " function. If mode is set to non-zero value, the method calling sampler will automatically start. The result of this function is 0."], #[['this, $help_func_debug_callers]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["call_trace", $help_func_call_trace]];
var $help_node nolist = 0;
var $root created_on = 855811820;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_debug_callers];
var $root manager = $help_func_debug_callers;


