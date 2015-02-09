
new object $help_func_suspend: $help_funcs_task;

var $has_name name = ['prop, "suspend()", "suspend()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " suspend()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function suspends the current task indefinitely. A suspended task is resumed by calling the function (in another task) ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_resume"]], ["resume()"], 'do_link]>], 'do_tt]>, ". The return value of suspend is given as the second argument to ", <$format, ["tt", [], ["resume()"], 'do_tt]>, ". If no second argument is given, the return value of ", <$format, ["tt", [], ["suspend()"], 'do_tt]>, " is zero. See ", <$format, ["link", [["node", "$help_coldc_tasks"]], ["Frames and Tasks"], 'do_link]>, " for more information on task control."], #[['this, $help_func_suspend]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["resume()", $help_func_resume], ["Frames and Tasks", $help_coldc_tasks]];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_suspend];
var $root manager = $help_func_suspend;


