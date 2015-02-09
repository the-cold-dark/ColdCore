
new object $help_func_sublist: $help_funcs_list;

var $has_name name = ['prop, "sublist()", "sublist()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " sublist(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER start"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER length"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a subrange of the list specified by ", <$format, ["i", [], ["list"], 'do_i]>, ". The subrange starts at position ", <$format, ["i", [], ["start"], 'do_i]>, ", and continues ", <$format, ["i", [], ["length"], 'do_i]>, " elements. If ", <$format, ["i", [], ["length"], 'do_i]>, " is unspecified, it will continue to the end of the list. If ", <$format, ["i", [], ["start"], 'do_i]>, " is outside of the range of the list, or ", <$format, ["i", [], ["length"], 'do_i]>, " will extend past the end of the list, the error ", <$format, ["tt", [], ["~range"], 'do_tt]>, " is thrown. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["sublist([2, 3, 4, 5, 6, 7], 2, 3)", <$format, ["br", [], [], 'do_br]>, "=> [3, 4, 5]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["sublist([2, 3, 4, 5, 6, 7], 3)", <$format, ["br", [], [], 'do_br]>, "=> [4, 5, 6, 7]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["sublist([2, 3, 4, 5, 6, 7], 7)", <$format, ["br", [], [], 'do_br]>, "=> []"], 'do_dfn]>], #[['this, $help_func_sublist]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_sublist];
var $root manager = $help_func_sublist;


