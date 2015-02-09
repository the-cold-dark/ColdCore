
new object $help_func_bufgraft: $help_funcs_buf;

var $has_name name = ['prop, "bufgraft()", "bufgraft()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["BUFFER"], 'do_i]>, " bufgraft(", <$format, ["i", [], ["BUFFER buf"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ", ", <$format, ["i", [], ["BUFFER what"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function will graft the buffer ", <$format, ["i", [], ["what"], 'do_i]>, " into the buffer ", <$format, ["i", [], ["buf"], 'do_i]>, " at ", <$format, ["i", [], ["pos"], 'do_i]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["bufgraft(`[1, 2, 3, 4], 2, `[100, 100])", <$format, ["br", [], [], 'do_br]>, "=> `[1, 100, 100, 2, 3, 4]"], 'do_dfn]>], #[['this, $help_func_bufgraft]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_bufgraft];
var $root manager = $help_func_bufgraft;


