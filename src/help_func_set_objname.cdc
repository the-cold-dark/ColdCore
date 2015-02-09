
new object $help_func_set_objname: $help_funcs_obj;

var $has_name name = ['prop, "set_objname()", "set_objname()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " set_objname(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the argument ", <$format, ["i", [], ["name"], 'do_i]>, " as the current object's objname. If another object already has the object name ", <$format, ["i", [], ["name"], 'do_i]>, ", the error ", <$format, ["tt", [], ["~error"], 'do_tt]>, " is thrown. If the current object already has an object name, it is replaced with the new name. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["set_objname('user_bob)", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>], #[['this, $help_func_set_objname]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_set_objname];
var $root manager = $help_func_set_objname;


