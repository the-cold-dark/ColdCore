
new object $help_func_replace: $help_funcs_list;

var $has_name name = ['prop, "replace()", "replace()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " replace(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function replaces the element in the argument ", <$format, ["i", [], ["list"], 'do_i]>, "--pointed to by the position argument ", <$format, ["i", [], ["pos"], 'do_i]>, "--with the argument ", <$format, ["tt", [], ["value"], 'do_tt]>, ", and returns the result. If the position argument is outside the range of the list, the error ", <$format, ["tt", [], ["~range"], 'do_tt]>, " is thrown. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["replace([2, 3, 4], 2, 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [2, 'foo, 4]"], 'do_dfn]>], #[['this, $help_func_replace]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_replace];
var $root manager = $help_func_replace;


