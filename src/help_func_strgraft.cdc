
new object $help_func_strgraft: $help_funcs_str;

var $has_name name = ['prop, "strgraft()", "strgraft()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " strgraft(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER pos"], 'do_i]>, ", ", <$format, ["i", [], ["STRING str2"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function grafts a string into another string. It will take the string specified by ", <$format, ["i", [], ["str2"], 'do_i]>, " and insert it into ", <$format, ["i", [], ["str"], 'do_i]>, ", starting at the position specified by ", <$format, ["i", [], ["pos"], 'do_i]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["strgraft(\"this string\", 6, \"is a \")", <$format, ["br", [], [], 'do_br]>, "=> \"this is a string\""], 'do_dfn]>], #[['this, $help_func_strgraft]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_strgraft];
var $root manager = $help_func_strgraft;


