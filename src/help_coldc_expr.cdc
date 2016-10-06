
new object $help_coldc_expr: $help_coldc_lang;

var $has_name name = ['prop, "Expressions", "Expressions"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Expressions are ColdC ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_tokens"]], ["tokens"], 'do_link]>], 'do_i]>, " and ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_expr_ops"]], ["operators"], 'do_link]>], 'do_i]>, " which--when evaluated--perform their defined behavior and take on a value after completion (also known as the ", <$format, ["i", [], ["return value"], 'do_i]>, "). If they evaluated without error, the return value is a standard ColdC data type. If an error occurred, the return value is an error data type, and execution of the method is halted. ", <$format, ["np", [], [], 'do_np]>, "There are many different types of expressions:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_data"]], ["Data"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_ops"]], ["Operators"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_vars"]], ["Variable"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_fcall"]], ["Function Call"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_mcall"]], ["Method Call"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_err_expr"]], ["Error Handling"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_loop_expr"]], ["Looping"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_expr]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["tokens", $help_coldc_tokens], ["operators", $help_coldc_ops], ["Data", $help_coldc_data], ["Variable", $help_coldc_vars], ["Function Call", $help_coldc_fcall], ["Method Call", $help_coldc_mcall], ["Error Handling", $help_coldc_err_expr], ["Looping", $help_coldc_loop_expr]];
var $help_node nolist = 0;
var $root created_on = 853826333;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_expr];
var $root manager = $help_coldc_expr;


