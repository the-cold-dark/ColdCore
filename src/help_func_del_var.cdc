
new object $help_func_del_var: $help_funcs_var;

var $has_name name = ['prop, "del_var()", "del_var()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " del_var(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function deletes the object variable pointed to by the argument ", <$format, ["i", [], ["name"], 'do_i]>, " defined on the current object (it does not delete an instance of a variable). If the object variable is not defined on the current object, the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " is thrown. Upon successful execution ", <$format, ["tt", [], ["del_var()"], 'do_tt]>, " returns ", <$format, ["tt", [], ["1"], 'do_tt]>, "."], #[['this, $help_func_del_var]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_del_var];
var $root manager = $help_func_del_var;


