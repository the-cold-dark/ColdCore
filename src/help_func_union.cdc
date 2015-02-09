
new object $help_func_union: $help_funcs_list;

var $has_name name = ['prop, "union()", "union()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " union(", <$format, ["i", [], ["LIST list1"], 'do_i]>, ", ", <$format, ["i", [], ["LIST list2"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function adds each element of ", <$format, ["i", [], ["list2"], 'do_i]>, " to ", <$format, ["i", [], ["list1"], 'do_i]>, " which does not already exist in ", <$format, ["i", [], ["list1"], 'do_i]>, ". Elements which exist more than once in ", <$format, ["i", [], ["list2"], 'do_i]>, " will only be added to ", <$format, ["i", [], ["list1"], 'do_i]>, " once, but duplicate elements in ", <$format, ["i", [], ["list1"], 'do_i]>, " will remain. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["union([2, 3, 4], [4, 5, 4, 6])", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 4, 5, 6]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["union([2, 2, 4, 5], [4, 5, 6, 6, 7])", <$format, ["br", [], [], 'do_br]>, "=> [2, 2, 4, 5, 6, 7])"], 'do_dfn]>], #[['this, $help_func_union]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384460;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_union];
var $root manager = $help_func_union;


