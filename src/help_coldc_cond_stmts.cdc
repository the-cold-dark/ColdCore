
new object $help_coldc_cond_stmts: $help_coldc_stmts;

var $has_name name = ['prop, "Conditional", "Conditional"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Conditional statements execute other statements if a test condition evaluates true. There are three types of conditional statements in ColdC:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_cond_if"]], ["if"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_cond_ifelse"]], ["if-else"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_cond_switch"]], ["switch"], 'do_link]>], 'do_li]>], 'do_ul]>, <$format, ["np", [], [], 'do_np]>, "Because the if statement and the if-else statement are similar, they can sometimes be ambiguous. The following code will produce unexpected results:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["if (a)\n    if (b) c;\nelse\n    d;"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The indentation suggests that the ", <$format, ["tt", [], ["else"], 'do_tt]>, " clause should apply to the first ", <$format, ["tt", [], ["if"], 'do_tt]>, " clause, but in fact it applies to the more recent one. Ambiguities like this can be avoided by using braces to create compound statements out of conditional and looping statements, even if there is only one statement. A less ambiguous way to write the above is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["if (a) {\n    if (b)\n        c;\n} else {  \n    d;\n}"], 'do_quote]>], 'do_dfn]>], #[['this, $help_coldc_cond_stmts]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["if", $help_coldc_cond_if], ["if-else", $help_coldc_cond_ifelse], ["switch", $help_coldc_cond_switch]];
var $help_node nolist = 0;
var $root created_on = 854058244;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_cond_stmts];
var $root manager = $help_coldc_cond_stmts;


