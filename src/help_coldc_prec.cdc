
new object $help_coldc_prec: $help_coldc_ops;

var $has_name name = ['prop, "Operator Precedence", "Operator Precedence"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "When the interpreter executes an expression it evaluates each operator it in a certain order. It is easy to write an expression which has an unclear order of evaluation. For instance, the expression ", <$format, ["tt", [], ["A - B + C"], 'do_tt]>, " could be parsed as ", <$format, ["tt", [], ["A - B"], 'do_tt]>, " followed by the result plus ", <$format, ["tt", [], ["C"], 'do_tt]>, " or as ", <$format, ["tt", [], ["A"], 'do_tt]>, " minus ", <$format, ["tt", [], ["B + C"], 'do_tt]>, ". To resolve these ambiguities, each operator has two properties when interpreted: ", <$format, ["i", [], ["precedence"], 'do_i]>, " and ", <$format, ["i", [], ["association"], 'do_i]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["i", [], ["Precedence"], 'do_i]>, " determines whether an operator is more important than another operator; for instance, ", <$format, ["tt", [], ["A + B * C"], 'do_tt]>, " is equivalent to ", <$format, ["tt", [], ["A + (B * C)"], 'do_tt]>, " because multiplication has higher precedence (is more important) than addition. ", <$format, ["np", [], [], 'do_np]>, <$format, ["i", [], ["Association"], 'do_i]>, " determines whether operators at the same precedence level associate left to right or right to left; ", <$format, ["tt", [], ["A - B - C"], 'do_tt]>, " is equivalent to ", <$format, ["tt", [], ["(A - B) - C"], 'do_tt]>, " because subtraction associates left to right. ", <$format, ["np", [], [], 'do_np]>, "Here is a list of operators grouped by precedence, in order from highest to lowest: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n[]\n.\n-- ++\n! - (unary)\n* / %\n+ - (binary)\n== != > >= < <=\nin\n&&\n||\n?:\n= += -= /= *= ?="], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "All operators associate from left to right except the ", <$format, ["link", [["node", "$help_coldc_logical"]], ["Logical Operators"], 'do_link]>, " (", <$format, ["tt", [], ["&&"], 'do_tt]>, ", ", <$format, ["tt", [], ["||"], 'do_tt]>, ", and ", <$format, ["tt", [], ["?|"], 'do_tt]>, "), which associate from right to left. Parentheses may be used to group expressions and clarify evaluation."], #[['this, $help_coldc_prec]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Logical Operators", $help_coldc_logical]];
var $help_node nolist = 0;
var $root created_on = 853827084;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_prec];
var $root manager = $help_coldc_prec;


