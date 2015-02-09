
new object $help_func_set_user: $help_funcs_task;

var $has_name name = ['prop, "set_user()", "set_user()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " set_user()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the task's user to the current object. Later calls to the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_user"]], ["user()"], 'do_link]>], 'do_tt]>, " will return this object, until this function is called again. If no user is set, zero is returned instead. This is intended as an easy means to define a controlling object for a task."], #[['this, $help_func_set_user]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["user()", $help_func_user]];
var $help_node nolist = 0;
var $root created_on = 855723148;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_set_user];
var $root manager = $help_func_set_user;


