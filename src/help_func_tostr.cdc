
new object $help_func_tostr: $help_funcs_data;

var $has_name name = ['prop, "tostr()", "tostr()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " tostr(", <$format, ["i", [], ["ANY data"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a simple representation of the data specified by ", <$format, ["i", [], ["data"], 'do_i]>, ". It is not a literal representation, as ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_toliteral"]], ["toliteral()"], 'do_link]>], 'do_tt]>, " does, but insteads is more succinct. For instance, with complex data types such as lists, the returned representation is simply ", <$format, ["tt", [], ["\"[list]\""], 'do_tt]>, ". Less complex data types such as integers will still return the correct integer value."], #[['this, $help_func_tostr]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["toliteral()", $help_func_toliteral]];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_tostr];
var $root manager = $help_func_tostr;


