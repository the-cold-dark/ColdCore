
new object $help_coldc_tasks: $help_coldc_imp;

var $has_name name = ['prop, "Tasks and Frames", "Tasks and Frames"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The state of a method as it is being evaluated is called the ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_tasks_frames"]], ["Execution Frame"], 'do_link]>], 'do_i]>, ". Each frame has a few unique values associated with it, which may or may not propagate to the next execution frame. ", <$format, ["np", [], [], 'do_np]>, "One or more frames executed in a series is called a ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_tasks_tasks"]], ["Task"], 'do_link]>], 'do_i]>, ". Tasks will originate from either a connection, a heartbeat, or by a fork in another task. There is no restriction on how many frames a task can execute. ", <$format, ["np", [], [], 'do_np]>, "It is possible to stop an executing frame, refresh the ticks it has and then continue executing. This is called ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_tasks_preempt"]], ["Preempting"], 'do_link]>], 'do_i]>, ". When a task is preempted it stops executing and is queued behind other current tasks. When these tasks are finished executing the preempted task continues, with a refreshed tick amount. Further information is given in the following sections:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_tasks_frames"]], ["Execution Frame"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_tasks_tasks"]], ["Task"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_tasks]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Execution Frame", $help_coldc_tasks_frames], ["Task", $help_coldc_tasks_tasks], ["Preempting", $help_coldc_tasks_preempt]];
var $help_node nolist = 0;
var $root created_on = 854058088;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_tasks];
var $root manager = $help_coldc_tasks;


