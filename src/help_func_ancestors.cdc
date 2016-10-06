
new object $help_func_ancestors: $help_funcs_obj;

var $has_name name = ['prop, "ancestors()", "ancestors()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " ancestors([", <$format, ["i", [], ["SYMBOL order"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a list of the ancestors of the current object. The order of the list is specified by sending either ", <$format, ["tt", [], ["'depth"], 'do_tt]>, " or ", <$format, ["tt", [], ["'breadth"], 'do_tt]>, " (for a depth-first or breadth-first order, respectively). If no order is specified, the order is depth-first (similar to methods). The current object is always the first element in this list. The hierarchy:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["    $root\n    /   \\\\\n$obj_a   |\n   |     |\n$obj_b $obj_c\n    \\\   /\n   $obj_d"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Is used in the following examples, as called from ", <$format, ["tt", [], ["$obj_d"], 'do_tt]>, ":", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["ancestors()", <$format, ["br", [], [], 'do_br]>, "=> [$obj_d, $obj_b, $obj_a, $obj_c, $root]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["ancestors('breadth)", <$format, ["br", [], [], 'do_br]>, "=> [$obj_d, $obj_b, $obj_c, $obj_a, $root]"], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_ancestors];
var $root manager = $help_func_ancestors;


