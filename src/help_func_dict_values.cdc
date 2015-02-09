
new object $help_func_dict_values: $help_funcs_dict;

var $has_name name = ['prop, "dict_values()", "dict_values()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " dict_values(", <$format, ["i", [], ["DICTIONARY dict"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a correctly ordered list of the keys of the associations in ", <$format, ["i", [], ["dict"], 'do_i]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict_values(#[[\"foo\", 1], [\"bar\", 2], ['baz, 3]])", <$format, ["br", [], [], 'do_br]>, "=> [1, 2, 3]"], 'do_dfn]>], #[['this, $help_func_dict_values]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855434224;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_dict_values];
var $root manager = $help_func_dict_values;


