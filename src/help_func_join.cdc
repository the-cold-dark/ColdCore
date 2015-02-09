
new object $help_func_join: $help_funcs_list;

var $has_name name = ['prop, "join()", "join()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " join(", <$format, ["i", [], ["LIST list"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING seperator"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function joins a list together as a string. The second argument is used to specify what seperates each element in the list. If the second argument is unspecified, this will default to a single space. If any element in the list is not a string, it will have a literal representation used instead, in the same manner as when using ", <$format, ["link", [["node", "$help_coldc_non_arith"]], ["Non Arithmetic Operators"], 'do_link]>, ". Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["join([\"Joe\", \"Sally\", \"Bob\", \"Sue\"])", <$format, ["br", [], [], 'do_br]>, "=> \"Joe Sally Bob Sue\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["join([\"This\", \"That\", 'there, 10], \", \")", <$format, ["br", [], [], 'do_br]>, "=> \"This, That, there, 10\""], 'do_dfn]>], #[['this, $help_func_join]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Non Arithmetic Operators", $help_coldc_non_arith]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_join];
var $root manager = $help_func_join;


