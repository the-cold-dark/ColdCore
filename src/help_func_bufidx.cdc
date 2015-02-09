
new object $help_func_bufidx: $help_funcs_buf;

var $has_name name = ['prop, "bufidx()", "bufidx()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " bufidx(", <$format, ["i", [], ["BUFFER buf"], 'do_i]>, ", ", <$format, ["i", [], ["BUFFER|INTEGER what"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER origin"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the position in ", <$format, ["i", [], ["buf"], 'do_i]>, " where ", <$format, ["i", [], ["what"], 'do_i]>, " exists--starting from ", <$format, ["i", [], ["origin"], 'do_i]>, "--or a zero if it does not exist. If ", <$format, ["i", [], ["origin"], 'do_i]>, " is not specified it will default to ", <$format, ["i", [], ["1"], 'do_i]>, ". If ", <$format, ["i", [], ["what"], 'do_i]>, " is an integer, it is equivalent to ", <$format, ["i", [], ["`[what]"], 'do_i]>, ". The ", <$format, ["i", [], ["origin"], 'do_i]>, " represents where to start searching in the buffer. If it is a positive number it starts that many elements into the buffer. If it is a negative number it starts that many elements from the end of the buffer, and searches backwards--from the end of the buffer to the start. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["bufidx(`[1, 7, 1, 6, 7, 1], 7)", <$format, ["br", [], [], 'do_br]>, "=> 2 ", <$format, ["np", [], [], 'do_np]>, "bufidx(`[1, 7, 1, 6, 7, 1], 7, -1)", <$format, ["br", [], [], 'do_br]>, "=> 5 ", <$format, ["np", [], [], 'do_np]>, "bufidx(`[1, 7, 1, 6, 7, 1], `[6, 7])", <$format, ["br", [], [], 'do_br]>, "=> 4 ", <$format, ["np", [], [], 'do_np]>, "bufidx(`[1, 7, 1, 6, 7, 1], `[6, 8])", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_bufidx]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855393081;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_bufidx];
var $root manager = $help_func_bufidx;


