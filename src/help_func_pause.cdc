
new object $help_func_pause: $help_funcs_task;

var $has_name name = ['prop, "pause()", "pause()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " pause()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function instantly preempts the current task, letting other tasks execute before it resumes execution with a refreshed tick count. See ", <$format, ["link", [["node", "$help_coldc_tasks"]], ["Frames and Tasks"], 'do_link]>, " for more information on preempting and task control."], #[['this, $help_func_pause]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Frames and Tasks", $help_coldc_tasks]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_pause];
var $root manager = $help_func_pause;


