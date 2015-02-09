
new object $help_func_strings_to_buf: $help_funcs_buf;

var $has_name name = ['prop, "strings_to_buf()", "strings_to_buf()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["BUFFER"], 'do_i]>, " strings_to_buf(", <$format, ["i", [], ["LIST strings"], 'do_i]>, "[, ", <$format, ["i", [], ["BUFFER sep"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function builds a buffer from the strings given in the list ", <$format, ["i", [], ["strings"], 'do_i]>, ". Each string represents a line which is terminated with a carriage return and a newline (ASCII 13 and 10). If the argument ", <$format, ["i", [], ["sep"], 'do_i]>, " is specified, each string is terminated with it instead. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["strings_to_buf([\"a\", \"b\", \"c\"])", <$format, ["br", [], [], 'do_br]>, "=> `[97, 13, 10, 98, 13, 10, 99, 13, 10]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["strings_to_buf([\"a\", \"b\", \"c\"], `[9])", <$format, ["br", [], [], 'do_br]>, "=> `[97, 9, 98, 9, 99, 9]"], 'do_dfn]>], #[['this, $help_func_strings_to_buf]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_strings_to_buf];
var $root manager = $help_func_strings_to_buf;


