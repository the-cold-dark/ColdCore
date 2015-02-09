
new object $help_func_listidx: $help_funcs_list;

var $has_name name = ['prop, "listidx()", "listidx()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " listidx(", <$format, ["i", [], ["LIST list"], 'do_i]>, ", ", <$format, ["i", [], ["ANY what"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER origin"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the position in the ", <$format, ["i", [], ["list"], 'do_i]>, " where ", <$format, ["i", [], ["what"], 'do_i]>, " exists--starting from ", <$format, ["i", [], ["origin"], 'do_i]>, "--or a zero if it does not exist. If ", <$format, ["i", [], ["origin"], 'do_i]>, " is not specified it will default to ", <$format, ["i", [], ["1"], 'do_i]>, ". The ", <$format, ["i", [], ["origin"], 'do_i]>, " represents where to start searching in the list. If it is a positive number it starts that many elements into the list. If it is a negative number it starts that many elements from the end of the list, and searches backwards--from the end of the list to the start. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["listidx([4, \"this\", [], 'bar], [])", <$format, ["br", [], [], 'do_br]>, "=> 3"], 'do_dfn]>, " ", <$format, ["dfn", [], ["listidx([4, \"this\", [], \"this\", 'bar], \"this\", -1)", <$format, ["br", [], [], 'do_br]>, "=> 4"], 'do_dfn]>, " ", <$format, ["dfn", [], ["listidx([4, \"this\", [], \"this\", 'bar], \"this\", -3)", <$format, ["br", [], [], 'do_br]>, "=> 2"], 'do_dfn]>], #[['this, $help_func_listidx]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855452888;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_listidx];
var $root manager = $help_func_listidx;


