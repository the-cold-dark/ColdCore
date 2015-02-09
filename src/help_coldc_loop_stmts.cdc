
new object $help_coldc_loop_stmts: $help_coldc_stmts;

var $has_name name = ['prop, "Looping Statements", "Looping Statements"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "ColdC provides three kinds of looping statements. These statements are used to traverse a list or a range of numbers, or to execute a statement as long as a certain condition is true. ColdC also provides two kinds of jump statements which are used to prematurely exit from a loop or continue onto the next iteration of a loop.", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_forlist"]], ["for-list"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_forrange"]], ["for-range"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_while"]], ["while"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_break"]], ["break"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_continue"]], ["continue"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_loop_stmts]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["for-list", $help_coldc_forlist], ["for-range", $help_coldc_forrange], ["while", $help_coldc_while], ["break", $help_coldc_break], ["continue", $help_coldc_continue]];
var $help_node nolist = 0;
var $root created_on = 854058280;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_loop_stmts];
var $root manager = $help_coldc_loop_stmts;


