
new object $help_func_subbuf: $help_funcs_buf;

var $has_name name = ['prop, "subbuf()", "subbuf()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["BUFFER"], 'do_i]>, " subbuf(", <$format, ["i", [], ["BUFFER buf"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER start"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER length"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a subrange of the buffer specified by ", <$format, ["i", [], ["buf"], 'do_i]>, ". The subrange starts at position ", <$format, ["i", [], ["start"], 'do_i]>, ", and continues ", <$format, ["i", [], ["length"], 'do_i]>, " characters. If ", <$format, ["i", [], ["length"], 'do_i]>, " is unspecified, it will continue to the end of the buffer. If ", <$format, ["i", [], ["start"], 'do_i]>, " is outside of the range of the buffer, or ", <$format, ["i", [], ["length"], 'do_i]>, " will extend past the end of the buffer, the error ", <$format, ["tt", [], ["~range"], 'do_tt]>, " is thrown. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["subbuf(`[1, 2, 3, 4], 2, 2)", <$format, ["br", [], [], 'do_br]>, "=> `[2, 3]"], 'do_dfn]>], #[['this, $help_func_subbuf]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_subbuf];
var $root manager = $help_func_subbuf;


