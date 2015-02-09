
new object $help_func_add_method: $help_funcs_meth;

var $has_name name = ['prop, "add_method()", "add_method()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " add_method(", <$format, ["i", [], ["LIST code"], 'do_i]>, ", ", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function compiles ", <$format, ["i", [], ["code"], 'do_i]>, " (which should be a list of strings) and uses the result as the definition of the method named by the symbol ", <$format, ["i", [], ["name"], 'do_i]>, ". If there were errors in compiling, a list of strings describing the errors is returned, otherwise an empty list is returned. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["add_method([\"cwrite(\\\"foo\\\");\"], 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [] ", <$format, ["np", [], [], 'do_np]>, "add_method([\"cwrite(\\\"foo\\\")\"], 'foo)", <$format, ["br", [], [], 'do_br]>, "=> [\"Line 2: parse error\"]"], 'do_tt]>], 'do_dfn]>], #[['this, $help_func_add_method]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_add_method];
var $root manager = $help_func_add_method;


