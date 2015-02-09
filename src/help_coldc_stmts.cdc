
new object $help_coldc_stmts: $help_coldc_lang;

var $has_name name = ['prop, "Statements", "Statements"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["statement"], 'do_i]>, " is a complete instruction to the interpreter. Statements are composed of ", <$format, ["link", [["node", "$help_coldc_expr"]], ["expressions"], 'do_link]>, " or constructs. Statements can be simple (such as comments), or they can be complex (such as loops and conditionals). Most statement types in ColdC have simple structures. Because statements can include other statements (using a compound statement) they can be used to build complex directives for the interpreter. Statements are grouped into four categories:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_simple_stmts"]], ["Simple"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_cond_stmts"]], ["Conditional"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_err_stmts"]], ["Error Handling"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_loop_stmts"]], ["Looping"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_stmts]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["expressions", $help_coldc_expr], ["Simple", $help_coldc_simple_stmts], ["Conditional", $help_coldc_cond_stmts], ["Error Handling", $help_coldc_err_stmts], ["Looping", $help_coldc_loop_stmts]];
var $help_node nolist = 0;
var $root created_on = 854058207;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_stmts];
var $root manager = $help_coldc_stmts;


