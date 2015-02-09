
new object $help_func_set_var: $help_funcs_var;

var $has_name name = ['prop, "set_var()", "set_var()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " set_var(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the instance of an object variable on the current object. The variable must be defined on the same object which defined the method which calls ", <$format, ["tt", [], ["set_var()"], 'do_tt]>, ". Using this function is the same as using the ", <$format, ["link", [["node", "$help_coldc_assign"]], ["assignment operator"], 'do_link]>, ". If the object variable is not defined, the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " is thrown. The return value for ", <$format, ["tt", [], ["set_var()"], 'do_tt]>, " is the second argument ", <$format, ["tt", [], ["value"], 'do_tt]>, ". The following two examples are equivalent:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["set_var('time_stamp, time())", <$format, ["br", [], [], 'do_br]>, "=> 855723496"], 'do_dfn]>, " ", <$format, ["dfn", [], ["time_stamp = time()"], 'do_dfn]>], #[['this, $help_func_set_var]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["assignment operator", $help_coldc_assign]];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_set_var];
var $root manager = $help_func_set_var;


