
new object $help_func_setremove: $help_funcs_list;

var $has_name name = ['prop, "setremove()", "setremove()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " setremove(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function removes the argument ", <$format, ["i", [], ["value"], 'do_i]>, " from the argument ", <$format, ["i", [], ["list"], 'do_i]>, ", if it exists, and returns the result. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["setremove([2, 3, 4, 'foo], 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 4]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["setremove([2, 3, 4], 5)", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 4]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["setremove([2, 3, 2, 4], 2)", <$format, ["br", [], [], 'do_br]>, "=> [3, 2, 4]"], 'do_dfn]>], #[['this, $help_func_setremove]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_setremove];
var $root manager = $help_func_setremove;


