
new object $help_func_method_bytecode: $help_funcs_meth;

var $has_name name = ['prop, "method_bytecode()", "method_bytecode()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " method_bytecode(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Returns the bytecode for the specified method, defined on the current object. For instance, consider the following method: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\npublic method .test() {\n    return \"test\";\n};"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Would return the following bytecode:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["method_bytecode('test)", <$format, ["br", [], [], 'do_br]>, "=> ['STRING, \"test\", 'RETURN_EXPR, 'RETURN]"], 'do_dfn]>], #[['this, $help_func_method_bytecode]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_method_bytecode];
var $root manager = $help_func_method_bytecode;


