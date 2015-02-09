
new object $help_func_rename_method: $help_funcs_meth;

var $has_name name = ['prop, "rename_method()", "rename_method()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " rename_method(", <$format, ["i", [], ["SYMBOL old_name"], 'do_i]>, ", ", <$format, ["i", [], ["SYMBOL new_name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function changes the name of the method on the current object, specified by the argument ", <$format, ["i", [], ["old_name"], 'do_i]>, ", and changes it to the name specified by the argument ", <$format, ["i", [], ["new_name"], 'do_i]>, ". If no method can be found by the name ", <$format, ["i", [], ["old_name"], 'do_i]>, ", the error ", <$format, ["tt", [], ["~methodnf"], 'do_tt]>, " is thrown."], #[['this, $help_func_rename_method]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_rename_method];
var $root manager = $help_func_rename_method;


