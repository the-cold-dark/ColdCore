
new object $help_func_dict_contains: $help_funcs_dict;

var $has_name name = ['prop, "dict_contains()", "dict_contains()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " dict_contains(", <$format, ["i", [], ["DICTIONARY dict"], 'do_i]>, ", ", <$format, ["i", [], ["ANY key"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns 1 if there is an association in ", <$format, ["i", [], ["dict"], 'do_i]>, " with the specified key, or 0 otherwise. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict_contains(#[[\"foo\", \"bar\"]], \"foo\")", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>, " ", <$format, ["dfn", [], ["dict_contains(#[[\"foo\", \"bar\"]], \"bar\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_dict_contains]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_dict_contains];
var $root manager = $help_func_dict_contains;


