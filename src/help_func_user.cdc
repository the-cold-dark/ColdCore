
new object $help_func_user: $help_funcs_task;

var $has_name name = ['prop, "user()", "user()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " user()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the task's user, as it was set with ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_set_user"]], ["set_user()"], 'do_link]>], 'do_tt]>, ". If no user was set, zero is returned instead. This is intended as an easy means to define a controlling object for a task."], #[['this, $help_func_user]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["set_user()", $help_func_set_user]];
var $help_node nolist = 0;
var $root created_on = 855723311;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_user];
var $root manager = $help_func_user;


