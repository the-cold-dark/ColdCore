
new object $help_func_dict_union: $help_funcs_dict;

var $has_name name = ['prop, "dict_union()", "dict_union()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["DICTIONARY"], 'do_i]>, " dict_union(", <$format, ["i", [], ["DICTIONARY dict1"], 'do_i]>, ", ", <$format, ["i", [], ["DICTIONARY dict2"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function merges the two dictionaries by adding each association from ", <$format, ["i", [], ["dict2"], 'do_i]>, " into ", <$format, ["i", [], ["dict1"], 'do_i]>, ". In the case of conflicts, the values in ", <$format, ["i", [], ["dict2"], 'do_i]>, " take precedence. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict_union(#[[\"foo\", 1], ['baz, 3]], #[[\"foo\", 2], [\"bar\", 2]])", <$format, ["br", [], [], 'do_br]>, "=> #[[\"foo\", 2], ['baz, 3], [\"bar\", 2]]"], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855434224;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_dict_union];
var $root manager = $help_func_dict_union;


