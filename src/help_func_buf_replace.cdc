
new object $help_func_buf_replace: $help_funcs_buf;

var $has_name name = ['prop, "buf_replace()", "buf_replace()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["BUFFER"], 'do_i]>, " buf_replace(", <$format, ["i", [], ["BUFFER buf"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER char"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function replaces the character in the buffer at position ", <$format, ["i", [], ["pos"], 'do_i]>, " with the character specified by the integer ", <$format, ["i", [], ["char"], 'do_i]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["buf_replace(`[98, 111, 111], 1, 102)", <$format, ["br", [], [], 'do_br]>, "=> `[102, 111, 111]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_bufgraft"]], ["bufgraft()"], 'do_link]>], 'do_tt]>, " performs a similar role."], #[['this, $help_func_buf_replace]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["bufgraft()", $help_func_bufgraft]];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_buf_replace];
var $root manager = $help_func_buf_replace;


