
new object $help_func_cancel: $help_funcs_task;

var $has_name name = ['prop, "cancel()", "cancel()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " cancel(", <$format, ["i", [], ["INTEGER task_id"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function cancels the suspended or preempted task with the task id given by ", <$format, ["i", [], ["task_id"], 'do_i]>, ". If the task does not exist, ", <$format, ["tt", [], ["~type"], 'do_tt]>, " is thrown."], #[['this, $help_func_cancel]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_cancel];
var $root manager = $help_func_cancel;


