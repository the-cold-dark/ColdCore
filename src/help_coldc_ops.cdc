
new object $help_coldc_ops: $help_coldc_expr;

var $has_name name = ['prop, "Operators", "Operators"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Operators are tokens used to perform simple operations on expression values, such as adding two values together. ", <$format, ["tt", [], ["ColdC"], 'do_tt]>, " provides a variety of operators to perform arithmetic and logical operations on data. Most of these operators fall into two categories: ", <$format, ["i", [], ["unary operators"], 'do_i]>, " and ", <$format, ["i", [], ["binary operators"], 'do_i]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["i", [], ["Unary operators"], 'do_i]>, " act on a single expression value. In ", <$format, ["tt", [], ["ColdC"], 'do_tt]>, ", all unary operators are single characters which precede expressions. For example, ", <$format, ["tt", [], ["!str"], 'do_tt]>, " is the logical negation of the variable ", <$format, ["tt", [], ["str"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["i", [], ["Binary operators"], 'do_i]>, " act on two expression values. For example, ", <$format, ["tt", [], ["a + b"], 'do_tt]>, " is the sum of the variables ", <$format, ["tt", [], ["a"], 'do_tt]>, " and ", <$format, ["tt", [], ["b"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "Some operators are neither unary nor binary. More information on these operators can be found in each sub section:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_prec"]], ["Operator Precedence"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_index"]], ["Index Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_arith"]], ["Arithmetic Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_assign"]], ["Assignment Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_logical"]], ["Logical Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_cond"]], ["Conditional Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_splice"]], ["List Splice Operator"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_ops]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Operator Precedence", $help_coldc_prec], ["Index Operators", $help_coldc_index], ["Arithmetic Operators", $help_coldc_arith], ["Assignment Operators", $help_coldc_assign], ["Logical Operators", $help_coldc_logical], ["Conditional Operators", $help_coldc_cond], ["List Splice Operator", $help_coldc_splice]];
var $help_node nolist = 0;
var $root created_on = 853827084;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_ops];
var $root manager = $help_coldc_ops;


