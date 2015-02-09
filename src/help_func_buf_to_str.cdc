
new object $help_func_buf_to_str: $help_funcs_buf;

var $has_name name = ['prop, "buf_to_str()", "buf_to_str()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["BUFFER"], 'do_i]>, " buf_to_str(", <$format, ["i", [], ["BUFFER buf"], 'do_i]>, "[, ", <$format, ["i", [], ["BUFFER sep"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function converts the buffer specified by buf to a list of printable strings, with a final buffer element. Each string is a line in the buffer, terminated by a newline. If any characters remain unterminated, they are placed in the last element as a buffer. The last element will always be a buffer, regarless of whether any characters are in it. ", <$format, ["np", [], [], 'do_np]>, "buf_to_strings() will alternatively split the strings based off the optional second argument. Note: it is not necessary to specify both a carriage return and a newline as the seperator--if both exist--as the newline will be sufficient to break the string, and the carriage return will be discarded as an unprintable character in the string."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node linnverts = 0;
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_buf_to_str];
var $root manager = $help_func_buf_to_str;


