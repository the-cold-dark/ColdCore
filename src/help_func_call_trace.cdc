
new object $help_func_call_trace: $help_funcs_task;

var $has_name name = ['prop, "call_trace()", "call_trace()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST|INTEGER"], 'do_i]>], 'do_tt]>, " call_trace()"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Depending on the ", <$format, ["link", [["node", "$help_func_debug_callers"]], ["debug mode"], 'do_link]>, ", one of the following will be returned:", <$format, ["subj", [["level", "3"]], ["mode 0"], 'do_subj]>, "Return 0 ", <$format, ["subj", [["level", "3"]], ["mode 1"], 'do_subj]>, "Returns a list samples gathered by debugger. Each method call is sampled as the following list:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[tick#, this, definer, method]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], ["tick#"], 'do_dt]>, <$format, ["dd", [], ["tick in which the call occured"], 'do_dd]>, <$format, ["dt", [], ["this"], 'do_dt]>, <$format, ["dd", [], ["receiver of the call"], 'do_dd]>, <$format, ["dt", [], ["definer"], 'do_dt]>, <$format, ["dd", [], ["definer of the called method"], 'do_dd]>, <$format, ["dt", [], ["method"], 'do_dt]>, <$format, ["dd", [], ["method name (a symbol)"], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "Each method return is sampled as a tick#.", <$format, ["np", [], [], 'do_np]>, "Note: The tick counts will be off if the task has been preepmpted and another task executed during the pause.", <$format, ["subj", [["level", "3"]], ["mode 2"], 'do_subj]>, "In addition to the above, each method call has fifth element, giving the list of all the arguments passed in the call. Optional arguments (those defined as @rest in the arg list) are gathered into a list and placed into the result as a single element.", <$format, ["np", [], [], 'do_np]>, "This function will automatically set the debug mode to 0."], #[['this, $help_func_call_trace]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["debug mode", $help_func_debug_callers]];
var $help_node nolist = 0;
var $root created_on = 855811820;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_call_trace];
var $root manager = $help_func_call_trace;


