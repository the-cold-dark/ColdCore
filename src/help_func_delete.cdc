
new object $help_func_delete: $help_funcs_list;

var $has_name name = ['prop, "delete()", "delete()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " delete(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function deletes the element in the argument ", <$format, ["i", [], ["list"], 'do_i]>, ", pointed to by the position argument ", <$format, ["i", [], ["pos"], 'do_i]>, ", and returns the result. If ", <$format, ["i", [], ["position"], 'do_i]>, " is less than ", <$format, ["tt", [], ["1"], 'do_tt]>, " or is greater than the length of ", <$format, ["i", [], ["list"], 'do_i]>, ", then ", <$format, ["tt", [], ["delete()"], 'do_tt]>, " throws a ", <$format, ["tt", [], ["~range"], 'do_tt]>, " error. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["delete([2, 3, 4], 2)", <$format, ["br", [], [], 'do_br]>, "=> [2, 4]"], 'do_dfn]>], #[['this, $help_func_delete]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_delete];
var $root manager = $help_func_delete;


