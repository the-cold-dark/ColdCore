
new object $help_func_insert: $help_funcs_list;

var $has_name name = ['prop, "insert()", "insert()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " insert(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function inserts ", <$format, ["i", [], ["value"], 'do_i]>, " into ", <$format, ["i", [], ["list"], 'do_i]>, " before the element specified by the integer ", <$format, ["i", [], ["pos"], 'do_i]>, ". If ", <$format, ["i", [], ["pos"], 'do_i]>, " is outside the range of the list, the error ", <$format, ["tt", [], ["~range"], 'do_tt]>, " is thrown. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["insert([2, 3, 4], 3, 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [2, 3, 'foo, 4]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["insert([\"foo\", 'bar, ~none], 4, 'baz)", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", 'bar, ~none, 'baz]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_listgraft"]], ["listgraft()"], 'do_link]>], 'do_tt]>, " performs a similar role to ", <$format, ["tt", [], ["insert()"], 'do_tt]>, "."], #[['this, $help_func_insert]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["listgraft()", $help_func_listgraft]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_insert];
var $root manager = $help_func_insert;


