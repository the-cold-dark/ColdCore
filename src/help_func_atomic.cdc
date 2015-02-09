
new object $help_func_atomic: $help_funcs_task;

var $has_name name = ['prop, "atomic()", "atomic()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " atomic(", <$format, ["i", [], ["INTEGER goatomic"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to turn on and off atomic execution. When executing atomically ", <$format, ["i", [], ["no other tasks will be run"], 'do_i]>, ". This also means that any function that normally preempts will throw an error (with the exception of ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_refresh"]], ["refresh()"], 'do_link]>], 'do_tt]>, "). If the argument is false (zero) the interpreter stops executing atomically. If the argument is true (non-zero) the interpreter starts executing atomically. Note: ", <$format, ["i", [], ["read the section ", <$format, ["link", [["node", "$help_coldc_tasks"]], ["Frames and Tasks"], 'do_link]>], 'do_i]>, " before using ", <$format, ["tt", [], ["atomic()"], 'do_tt]>, "."], #[['this, $help_func_atomic]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["refresh()", $help_func_refresh], ["Frames and Tasks", $help_coldc_tasks]];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_atomic];
var $root manager = $help_func_atomic;


