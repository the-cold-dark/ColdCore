
new object $help_coldc_non_arith: $help_coldc_arith;

var $has_name name = ['prop, "Non-Numeric Use", "Non-Numeric Use"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The binary ", <$format, ["tt", [], ["+"], 'do_tt]>, " operator can also be applied to strings, lists and buffers. Using it in this way will cause it to concatenate the two values. For instance, the expression ", <$format, ["tt", [], ["(\"foo\" + \"bar\")"], 'do_tt]>, " would evaluate to ", <$format, ["tt", [], ["\"foobar\""], 'do_tt]>, ", and the expression ", <$format, ["tt", [], ["([\"foo\", \"bar\"] + [\"baz\"])"], 'do_tt]>, " would result in the list ", <$format, ["tt", [], ["[\"foo\", \"bar\", \"baz\"]"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "As long as both sides of the operator are the same data type (which is restricted to strings, lists and buffers) no error will be raised. If one side of the operator is a string (either side), and the other side is not a string, it will be converted to its literal representation and joined with the string. For example, the expression ", <$format, ["tt", [], ["(\"list: \" + [1, 2, 3])"], 'do_tt]>, " would evaluate to ", <$format, ["tt", [], ["\"list: [1, 2, 3]\""], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "The binary ", <$format, ["tt", [], ["*"], 'do_tt]>, " may be applied with a string on the left side and an integer on the right side. In this situation the left side string is duplicated by the number of times specified by the right side integer. Example: ", <$format, ["tt", [], ["(\"-\" * 5)"], 'do_tt]>, " would result in ", <$format, ["tt", [], ["\"-----\""], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["link", [["node", "$help_coldc_dual_assign"]], ["Dual Role Assignment"], 'do_link]>, " operators also behave in the same way, as is applicable. For instance, the dual role arithmetic operator ", <$format, ["tt", [], ["+="], 'do_tt]>, " would behave the same as the standard arithmetic operator ", <$format, ["tt", [], ["+"], 'do_tt]>, " when evaluating the addition expression."], #[['this, $help_coldc_non_arith]]]>;
var $help_node links = #[["Dual Role Assignment", $help_coldc_dual_assign]];
var $help_node nolist = 0;
var $root created_on = 854136779;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_non_arith];
var $root manager = $help_coldc_non_arith;


