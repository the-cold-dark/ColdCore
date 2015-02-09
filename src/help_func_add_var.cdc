
new object $help_func_add_var: $help_funcs_var;

var $has_name name = ['prop, "add_var()", "add_var()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " add_var(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function defines an object variable on the current object. The name of the variable is defined by the symbol ", <$format, ["i", [], ["name"], 'do_i]>, ". If an object variable already exists by the desired name, the error ", <$format, ["tt", [], ["~varexists"], 'do_tt]>, " is thrown. ", <$format, ["tt", [], ["add_var()"], 'do_tt]>, " returns ", <$format, ["tt", [], ["1"], 'do_tt]>, " if it is successful."], #[['this, $help_func_add_var]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_add_var];
var $root manager = $help_func_add_var;


