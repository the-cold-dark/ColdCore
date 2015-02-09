
new object $help_func_listgraft: $help_funcs_list;

var $has_name name = ['prop, "listgraft()", "listgraft()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " listgraft(", <$format, ["i", [], ["LIST list1"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER"], 'do_i]>, " pos, ", <$format, ["i", [], ["LIST list2"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is similar to the ", <$format, ["link", [["node", "$help_coldc_splice"]], ["splice operator"], 'do_link]>, " and ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_insert"]], ["insert()"], 'do_link]>], 'do_tt]>, ", except it grafts a list into another list, rather than inserting an element at a point in the list. It will take the list specified by ", <$format, ["i", [], ["list2"], 'do_i]>, " and place each element in that list into the list specified by ", <$format, ["i", [], ["list1"], 'do_i]>, ", starting at the position specified by ", <$format, ["i", [], ["pos"], 'do_i]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["listgraft([1, 2, 3, 4, 5], 3, [\"foo\", \"bar\", \"baz\"])", <$format, ["br", [], [], 'do_br]>, "=> [1, 2, \"foo\", \"bar\", \"baz\", 3, 4, 5]"], 'do_dfn]>], #[['this, $help_func_listgraft]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["splice operator", $help_coldc_splice], ["insert()", $help_func_insert]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_listgraft];
var $root manager = $help_func_listgraft;


