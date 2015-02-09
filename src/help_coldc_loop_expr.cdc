
new object $help_coldc_loop_expr: $help_coldc_expr;

var $has_name name = ['prop, "Looping Expressions", "Looping Expressions"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Cold offers several expressions that enable looping through lists, dictionaries or integer ranges. Their main advantages over looping statements are brevity and preallocating of lists/dictionaries they return (for greater speed). The loop expressions are:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_map"]], ["map"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_hash"]], ["hash"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_find"]], ["find"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_filter"]], ["filter"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_loop_expr]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["map", $help_coldc_map], ["hash", $help_coldc_hash], ["find", $help_coldc_find], ["filter", $help_coldc_filter]];
var $help_node nolist = 0;
var $root created_on = 854057996;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_loop_expr];
var $root manager = $help_coldc_loop_expr;


