
new object $help_func_dict_del: $help_funcs_dict;

var $has_name name = ['prop, "dict_del()", "dict_del()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["DICTIONARY"], 'do_i]>, " dict_del(", <$format, ["i", [], ["DICTIONARY dict"], 'do_i]>, ", ", <$format, ["i", [], ["ANY key"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function the ", <$format, ["i", [], ["key"], 'do_i]>, " ", <$format, ["i", [], ["value"], 'do_i]>, " association from the dictionary ", <$format, ["i", [], ["dict"], 'do_i]>, " and returns the result. If there is no association with the specified key, then the error ", <$format, ["tt", [], ["~keynf"], 'do_tt]>, " is thrown. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict_del(#[[\"foo\", 1], [\"bar\", 2]], \"foo\")", <$format, ["br", [], [], 'do_br]>, "=> #[[\"bar\", 2]]"], 'do_dfn]>], #[['this, $help_func_dict_del]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_dict_del];
var $root manager = $help_func_dict_del;


