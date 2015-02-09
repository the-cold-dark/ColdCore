
new object $help_coldc_tasks_preempt: $help_coldc_tasks;

var $has_name name = ['prop, "Preempting", "Preempting"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "When a task is preempted it stops executing and is queued behind other current tasks. When these tasks are finished executing the preempted task continues, with a refreshed tick amount. Preempting can be caused by calling either ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_pause"]], ["pause()"], 'do_link]>], 'do_tt]>, " or ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_refresh"]], ["refresh()"], 'do_link]>], 'do_tt]>, ". ", <$format, ["tt", [], ["pause()"], 'do_tt]>, " will always preempt immediately. ", <$format, ["tt", [], ["refresh()"], 'do_tt]>, " will only preempt if the tick count is nearly exhausted. Furthermore, if executing atomically ", <$format, ["tt", [], ["refresh()"], 'do_tt]>, " will not preempt, but will immediately refresh the tick count and continue executing. ", <$format, ["np", [], [], 'do_np]>, "Tasks may also be suspended indefinitely by using the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_suspend"]], ["suspend()"], 'do_link]>], 'do_tt]>, ". The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_resume"]], ["resume()"], 'do_link]>], 'do_tt]>, " will resume a suspended task. The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_cancel"]], ["cancel()"], 'do_link]>], 'do_tt]>, " will cancel a suspended task. ", <$format, ["np", [], [], 'do_np]>, "For more information see ", <$format, ["link", [["node", "$help_coldc_tasks_preempt_examp"]], ["A Preempting Example"], 'do_link]>, "."], #[['links, #[["pause()", "$help_func_pause"], ["refresh()", "$help_func_refresh"], ["suspend()", "$help_func_suspend"], ["resume()", "$help_func_resume"], ["cancel()", "$help_func_cancel"], ["A Preempting Example", "$help_coldc_tasks_preempt_examp"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["pause()", $help_func_pause], ["refresh()", $help_func_refresh], ["suspend()", $help_func_suspend], ["resume()", $help_func_resume], ["cancel()", $help_func_cancel], ["A Preempting Example", $help_coldc_tasks_preempt_examp]];
var $help_node nolist = 0;
var $root created_on = 854946002;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_tasks_preempt];
var $root manager = $help_coldc_tasks_preempt;


