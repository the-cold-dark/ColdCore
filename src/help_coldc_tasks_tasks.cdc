
new object $help_coldc_tasks_tasks: $help_coldc_tasks;

var $has_name name = ['prop, "Tasks", "Tasks"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "One or more frames executed in a series is called a ", <$format, ["i", [], ["task"], 'do_i]>, ". Tasks will originate from either a connection, a heartbeat, or by a fork in another task. There is no restriction on how many frames a task can execute. ", <$format, ["np", [], [], 'do_np]>, "Several different functions return information about a task, or are used on a task-wide scale: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "23%,77%"]], [<$format, ["tr", [], [<$format, ["th", [], ["FUNCTION"], 'do_th]>, <$format, ["th", [], ["BEHAVIOUR"], 'do_th]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_task_id"]], ["task_id()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Returns unique ID for the current task"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_task_info"]], ["task_info()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Returns information on a task"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_tasks"]], ["tasks()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Returns a list of all paused or preempted tasks"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_stack"]], ["stack()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Returns full execution frame stack"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_user"]], ["user()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Returns task user"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_set_user"]], ["set_user()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Sets task user"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_atomic"]], ["atomic()"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Used to turn on/off Atomic execution"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["task_id()", "$help_func_task_id"], ["task_info()", "$help_func_task_info"], ["tasks()", "$help_func_tasks"], ["stack()", "$help_func_stack"], ["user()", "$help_func_user"], ["set_user()", "$help_func_set_user"], ["atomic()", "$help_func_atomic"]]]]]>;
var $help_node links = #[["task_id()", $help_func_task_id], ["task_info()", $help_func_task_info], ["tasks()", $help_func_tasks], ["stack()", $help_func_stack], ["user()", $help_func_user], ["set_user()", $help_func_set_user], ["atomic()", $help_func_atomic]];
var $help_node nolist = 0;
var $root created_on = 854937905;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_tasks_tasks];
var $root manager = $help_coldc_tasks_tasks;

