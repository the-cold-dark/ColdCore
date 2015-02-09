
new object $help_func_method_info: $help_funcs_meth;

var $has_name name = ['prop, "method_info()", "method_info()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " method_info(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a list of miscellaneous information on the method named by ", <$format, ["i", [], ["name"], 'do_i]>, ". If the method is not found, the error ", <$format, ["tt", [], ["~methodnf"], 'do_tt]>, " is thrown. Otherwise a list is returned. The elements in the list are (in order):", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["STRING args"], 'do_li]>, <$format, ["li", [], ["INTEGER number of arguments"], 'do_li]>, <$format, ["li", [], ["INTEGER number of local variables defined"], 'do_li]>, <$format, ["li", [], ["INTEGER number of opcodes used"], 'do_li]>, <$format, ["li", [], ["SYMBOL method access"], 'do_li]>, <$format, ["li", [], ["LIST method flags"], 'do_li]>], 'do_ol]>], #[['this, $help_func_method_info]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_method_info];
var $root manager = $help_func_method_info;


