
new object $help_func_refresh: $help_funcs_task;

var $has_name name = ['prop, "refresh()", "refresh()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " refresh()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When the server is running non-atomically this function checks the current frame's tick count and preempts the task if it is nearly depleted (similar to ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_pause"]], ["pause()"], 'do_link]>], 'do_tt]>, "), resuming it with a new tick count after all other current tasks have completed, otherwise it does nothing. If the server is running atomically the task will not preempt, but the tick count will automatically be refreshed. See ", <$format, ["link", [["node", "$help_func_tasks"]], ["Frames and Tasks"], 'do_link]>, " for more information on task preempting."], #[['this, $help_func_refresh]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["pause()", $help_func_pause], ["Frames and Tasks", $help_func_tasks]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_refresh];
var $root manager = $help_func_refresh;


