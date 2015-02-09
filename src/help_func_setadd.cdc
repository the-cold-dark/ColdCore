
new object $help_func_setadd: $help_funcs_list;

var $has_name name = ['prop, "setadd()", "setadd()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " setadd(", <$format, ["tt", [], ["LIST list"], 'do_tt]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function appends the argument ", <$format, ["i", [], ["value"], 'do_i]>, " to the argument ", <$format, ["i", [], ["list"], 'do_i]>, " if it is not already in the list, and returns the result. If ", <$format, ["i", [], ["value"], 'do_i]>, " is already in the list, it does not add it. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["setadd([2, 3, 4], 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 4, 'foo]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["setadd([2, 3, 4], 3)", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 4]"], 'do_dfn]>], #[['this, $help_func_setadd]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_setadd];
var $root manager = $help_func_setadd;


