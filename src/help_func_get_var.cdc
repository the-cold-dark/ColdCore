
new object $help_func_get_var: $help_funcs_var;

var $has_name name = ['prop, "get_var()", "get_var()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " get_var(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the current object's instance of the object variable specified to by the argument ", <$format, ["i", [], ["name"], 'do_i]>, ". The variable must be defined on the same object which defined the method which calls ", <$format, ["tt", [], ["get_var()"], 'do_tt]>, ". If the object variable is not defined, the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " is thrown. Otherwise the current object's value for the variable is returned. ", <$format, ["np", [], [], 'do_np]>, "This is an obtuse way of retrieving the value of an object variable, and is generally only used when there is confusion with a local variable. For more information see ", <$format, ["link", [["node", "$help_coldc_vars"]], ["Variable Expressions"], 'do_link]>, "."], #[['this, $help_func_get_var]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Variable Expressions", $help_coldc_vars]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_get_var];
var $root manager = $help_func_get_var;


