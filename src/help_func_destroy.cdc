
new object $help_func_destroy: $help_funcs_obj;

var $has_name name = ['prop, "destroy()", "destroy()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " destroy()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function marks the current object for removal from the database. The object is destroyed when all methods executing on it are completed (suspended and preempted methods as well as the current task). Objects left orphaned by the destruction of their only parent are reparented to the parents of the parent which was destroyed. ", <$format, ["np", [], [], 'do_np]>, "Attempts to destroy the root or system objects will fail with the error ", <$format, ["tt", [], ["~perm"], 'do_tt]>, "."], #[['this, $help_func_destroy]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_destroy];
var $root manager = $help_func_destroy;


