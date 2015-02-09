
new object $help_func_fromliteral: $help_funcs_data;

var $has_name name = ['prop, "fromliteral()", "fromliteral()"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " fromliteral(", <$format, ["i", [], ["STRING data"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function takes the literal representation of the data given in the string argument ", <$format, ["i", [], ["data"], 'do_i]>, " and parses it to actual data, returning the result. If it cannot parse the data, the error ", <$format, ["tt", [], ["~type"], 'do_tt]>, " is thrown. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["fromliteral(\"[1, 'foo]\")", <$format, ["br", [], [], 'do_br]>, "=> [1, 'foo]"], 'do_dfn]>], #[['this, $help_func_fromliteral]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855441374;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fromliteral];
var $root manager = $help_func_fromliteral;


