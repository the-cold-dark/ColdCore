
new object $help_func_resume: $help_funcs_task;

var $has_name name = ['prop, "resume()", "resume()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], ["INTEGER resume(", <$format, ["i", [], ["INTEGER task_id"], 'do_i]>, "[, ", <$format, ["i", [], ["ANY value"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function resumes the suspended task specified by the argument ", <$format, ["i", [], ["task_id"], 'do_i]>, ". The error ", <$format, ["tt", [], ["~type"], 'do_tt]>, " is thrown if the task does not exist. The optional second argument ", <$format, ["i", [], ["value"], 'do_i]>, " is used as the return value for the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_suspend"]], ["suspend()"], 'do_link]>], 'do_tt]>, ". If a second argument is not specified the return value of ", <$format, ["tt", [], ["suspend()"], 'do_tt]>, " is zero. See ", <$format, ["link", [["node", "$help_coldc_tasks"]], ["Frames and Tasks"], 'do_link]>, " for more information on preempting and task control."], #[['this, $help_func_resume]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["suspend()", $help_func_suspend], ["Frames and Tasks", $help_coldc_tasks]];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_resume];
var $root manager = $help_func_resume;


