
new object $help_func_task_info: $help_funcs_task;

var $has_name name = ['prop, "task_info()", "task_info()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " task_info(", <$format, ["i", [], ["INTEGER task_id"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns full information on the task specified with the argument ", <$format, ["i", [], ["task_id"], 'do_i]>, ". If the task does not exist, ", <$format, ["tt", [], ["~type"], 'do_tt]>, " is thrown. The returned list contains a minimum of seven elements, with subsequent elements defining the specific frames, these are:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["INTEGER task id"], 'do_li]>, <$format, ["li", [], ["INTEGER preempted"], 'do_li]>, <$format, ["li", [], ["INTEGER datasize limit"], 'do_li]>, <$format, ["li", [], ["INTEGER fork limit"], 'do_li]>, <$format, ["li", [], ["INTEGER recursion limit"], 'do_li]>, <$format, ["li", [], ["INTEGER objswap limit"], 'do_li]>, <$format, ["li", [], ["INTEGER calldepth limit"], 'do_li]>, <$format, ["li", [], ["LIST frame"], 'do_li]>, <$format, ["li", [], ["..."], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "The second element ", <$format, ["i", [], ["preempted"], 'do_i]>, " is true if this task was preempted, false if it was suspended. For more information on the limit elements, see ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_config"]], ["config()"], 'do_link]>], 'do_tt]>, ". Remaining frame elements are eight element lists formatted as:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["OBJNUM current object"], 'do_li]>, <$format, ["li", [], ["OBJNUM caller"], 'do_li]>, <$format, ["li", [], ["OBJNUM sender"], 'do_li]>, <$format, ["li", [], ["OBJNUM user"], 'do_li]>, <$format, ["li", [], ["INTEGER current opcode"], 'do_li]>, <$format, ["li", [], ["INTEGER last opcode"], 'do_li]>, <$format, ["li", [], ["INTEGER ticks remaining"], 'do_li]>, <$format, ["li", [], ["SYMBOL method name"], 'do_li]>], 'do_ol]>], #[['this, $help_func_task_info]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["config()", $help_func_config]];
var $help_node nolist = 0;
var $root created_on = 855811820;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_task_info];
var $root manager = $help_func_task_info;


