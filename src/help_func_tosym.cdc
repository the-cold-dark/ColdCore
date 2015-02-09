
new object $help_func_tosym: $help_funcs_data;

var $has_name name = ['prop, "tosym()", "tosym()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["SYMBOL"], 'do_i]>, " tosym(", <$format, ["i", [], ["STRING input"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function creates a symbol from the string ", <$format, ["i", [], ["input"], 'do_i]>, ". Symbols can only contain alphanumeric characters, and the underscore character. If a string is specified with more than these characters, the error ", <$format, ["tt", [], ["~symbol"], 'do_tt]>, " is thrown."], #[['this, $help_func_tosym]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_tosym];
var $root manager = $help_func_tosym;


