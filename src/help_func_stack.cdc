
new object $help_func_stack: $help_funcs_task;

var $has_name name = ['prop, "stack()", "stack()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " stack()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the call stack for the current task. Each element in the list is a list itself, representing a specific frame. The first element represents the first frame, and so on, up to the current frame. ", <$format, ["np", [], [], 'do_np]>, "Each frame list is ordered as follows:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["OBJNUM sender"], 'do_li]>, <$format, ["li", [], ["OBJNUM caller"], 'do_li]>, <$format, ["li", [], ["SYMBOL method name"], 'do_li]>, <$format, ["li", [], ["INTEGER line number"], 'do_li]>, <$format, ["li", [], ["INTEGER current op code"], 'do_li]>], 'do_ol]>], #[['this, $help_func_stack]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_stack];
var $root manager = $help_func_stack;


