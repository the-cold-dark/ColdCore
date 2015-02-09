
new object $help_func_set_method_flags: $help_funcs_meth;

var $has_name name = ['prop, "set_method_flags()", "set_method_flags()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " set_method_flags(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ", ", <$format, ["i", [], ["LIST flags"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the method flags for the method specified with the first argument ", <$format, ["i", [], ["name"], 'do_i]>, ". The flags are specified as a list of symbols in ", <$format, ["i", [], ["flags"], 'do_i]>, ". Full information on method flags can be found in the section ", <$format, ["link", [["node", "$help_coldc_methods_flags"]], ["Method Flags"], 'do_link]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["set_method_flags('tell, ['nooverride])", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>], #[['this, $help_func_set_method_flags]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Method Flags", $help_coldc_methods_flags]];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_set_method_flags];
var $root manager = $help_func_set_method_flags;


