
new object $help_func_stridx: $help_funcs_str;

var $has_name name = ['prop, "stridx()", "stridx()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " stridx(", <$format, ["i", [], ["BUFFER str"], 'do_i]>, ", ", <$format, ["i", [], ["STRING what"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER origin"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the position in ", <$format, ["i", [], ["str"], 'do_i]>, " where ", <$format, ["i", [], ["what"], 'do_i]>, " exists--starting from ", <$format, ["i", [], ["origin"], 'do_i]>, "--or a zero if it does not exist. If ", <$format, ["i", [], ["origin"], 'do_i]>, " is not specified it will default to ", <$format, ["i", [], ["1"], 'do_i]>, ". The ", <$format, ["i", [], ["origin"], 'do_i]>, " represents where to start searching in the string. If it is a positive number it starts that many elements into the string. If it is a negative number it starts that many elements from the end of the string, and searches backwards--from the end of the string to the start. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["stridx(\"this test ok\", \"e\")", <$format, ["br", [], [], 'do_br]>, "=> 7 ", <$format, ["np", [], [], 'do_np]>, "stridx(\"this test ok\", \"t\", -1)", <$format, ["br", [], [], 'do_br]>, "=> 9 ", <$format, ["np", [], [], 'do_np]>, "stridx(\"this test ok\", \"t\", -5)", <$format, ["br", [], [], 'do_br]>, "=> 6 ", <$format, ["np", [], [], 'do_np]>, "stridx(\"this test ok\", \"alf\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_stridx]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855767859;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_stridx];
var $root manager = $help_func_stridx;


