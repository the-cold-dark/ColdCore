
new object $help_func_lookup: $help_funcs_obj;

var $has_name name = ['prop, "lookup()", "lookup()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["OBJNUM"], 'do_i]>, " lookup(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function finds the object number for the object name specified by the argument ", <$format, ["i", [], ["name"], 'do_i]>, ". If no object exists with that name, the error ", <$format, ["tt", [], ["~namenf"], 'do_tt]>, " is thrown. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["lookup('root)", <$format, ["br", [], [], 'do_br]>, "=> #1"], 'do_dfn]>], #[['this, $help_func_lookup]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_lookup];
var $root manager = $help_func_lookup;


