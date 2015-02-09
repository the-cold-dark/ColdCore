
new object $help_func_bind_function: $help_funcs_misc;

var $has_name name = ['prop, "bind_function()", "bind_function()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " bind_function(", <$format, ["i", [], ["SYMBOL function"], 'do_i]>, ", ", <$format, ["i", [], ["OBJNUM obj"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to secure other ColdC functions which may have potential security problems. It binds the function specified by the argument ", <$format, ["i", [], ["function"], 'do_i]>, " to the object specified by ", <$format, ["i", [], ["obj"], 'do_i]>, ". After a function is bound to an object, only methods ", <$format, ["i", [], ["defined"], 'do_i]>, " on that object may call the function. The error ", <$format, ["tt", [], ["~perm"], 'do_tt]>, " is thrown if methods defined on descendants of the object or on any other object call a bound function which is not bound to them."], #[['this, $help_func_bind_function]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_bind_function];
var $root manager = $help_func_bind_function;


