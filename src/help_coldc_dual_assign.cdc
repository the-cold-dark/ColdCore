
new object $help_coldc_dual_assign: $help_coldc_assign;

var $has_name name = ['prop, "Dual", "Dual"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Dual Role Assignment operators join an arithmetic operator and the simple assignment operator into one for the purpose of simplicity and optimization. The Dual Role Assignment operators are:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["+=", <$format, ["br", [], [], 'do_br]>, "-=", <$format, ["br", [], [], 'do_br]>, "*=", <$format, ["br", [], [], 'do_br]>, "/="], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "These operators must have a variable as the left argument. When used, the arithmetic expression is evaluated as normal, and the result is assigned back into the variable on the left. The following examples are equivalent:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["x = x + 5", <$format, ["br", [], [], 'do_br]>, "x += 5"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When evaluating the arithmetic expression the operator behaves the same as the equivalent ", <$format, ["link", [["node", "$help_coldc_arith"]], ["Arithmetic Operator"], 'do_link]>, ", including any ", <$format, ["link", [["node", "$help_coldc_non_arith"]], ["Non-Arithmetic Behaviour"], 'do_link]>, "."], #[['this, $help_coldc_dual_assign]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Arithmetic Operator", $help_coldc_arith], ["Non-Arithmetic Behaviour", $help_coldc_non_arith]];
var $help_node nolist = 0;
var $root created_on = 854129007;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_dual_assign];
var $root manager = $help_coldc_dual_assign;


