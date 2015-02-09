
new object $help_coldc_simple_stmts: $help_coldc_stmts;

var $has_name name = ['prop, "Simple", "Simple"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Simple statements evaluate one instruction, once. There are four different simple statements in ColdC:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_comment_stmt"]], ["Comment"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_expr_stmt"]], ["Expression"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_compound_stmt"]], ["Compound"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_return_stmt"]], ["Return"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_simple_stmts]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Comment", $help_coldc_comment_stmt], ["Expression", $help_coldc_expr_stmt], ["Compound", $help_coldc_compound_stmt], ["Return", $help_coldc_return_stmt]];
var $help_node nolist = 0;
var $root created_on = 854058235;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_simple_stmts];
var $root manager = $help_coldc_simple_stmts;


