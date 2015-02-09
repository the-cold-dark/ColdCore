
new object $help_func_dict_add: $help_funcs_dict;

var $has_name name = ['prop, "dict_add()", "dict_add()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["DICTIONARY"], 'do_i]>, " dict_add(", <$format, ["i", [], ["DICTIONARY dict"], 'do_i]>, ", ", <$format, ["i", [], ["ANY key"], 'do_i]>, ", ", <$format, ["i", [], ["ANY value"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function adds an association to the dictionary ", <$format, ["i", [], ["dict"], 'do_i]>, ". The key and value of the association are given as the ", <$format, ["i", [], ["key"], 'do_i]>, " and ", <$format, ["i", [], ["value"], 'do_i]>, " arguments. The new dictionary is returned. If ", <$format, ["i", [], ["key"], 'do_i]>, " already exists in ", <$format, ["i", [], ["dict"], 'do_i]>, ", then the value of the existing key is replaced with ", <$format, ["i", [], ["value"], 'do_i]>, ". Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict_add(#[[\"foo\", \"bar\"]], 3, 'quux)", <$format, ["br", [], [], 'do_br]>, "=> #[[\"foo\", \"bar\"], [3, 'quux]]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["dict_add(#[[\"foo\", 1], [\"bar\", 2], [\"baz\", 3]], \"bar\", 4)", <$format, ["br", [], [], 'do_br]>, "=> #[[\"foo\", 1], [\"bar\", 4], [\"baz\", 3]]"], 'do_dfn]>], #[['this, $help_func_dict_add]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_dict_add];
var $root manager = $help_func_dict_add;


