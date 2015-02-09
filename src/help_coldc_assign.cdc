
new object $help_coldc_assign: $help_coldc_ops;

var $has_name name = ['prop, "Assignments", "Assignments"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Data is stored in a ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_vars"]], ["variable"], 'do_link]>], 'do_i]>, " through an assignment. Assignments can either be ", <$format, ["i", [], ["Simple"], 'do_i]>, ", ", <$format, ["i", [], ["Scattered"], 'do_i]>, ", ", <$format, ["i", [], ["Dual Role"], 'do_i]>, " or ", <$format, ["i", [], ["Default"], 'do_i]>, ". Simple Assignments store the result of an expression to a single variable. A Scatter Assignment stores each element in the result of a list expression across multiple variables. Dual Role Assignments join another operator and the simple assignment operator into one for the purpose of simplicity and optimizing, such as ", <$format, ["tt", [], ["+="], 'do_tt]>, " which is both the the addition operator and the assignment operator. Default assignments only assign the value if the current value of the variable is false. More information can be found in each section:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_simple_assign"]], ["Simple Assignments"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_scatter_assign"]], ["Scatter Assignments"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_dual_assign"]], ["Dual Role Assignments"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_default_assign"]], ["Default Assignments"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_assign]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["variable", $help_coldc_vars], ["Simple Assignments", $help_coldc_simple_assign], ["Scatter Assignments", $help_coldc_scatter_assign], ["Dual Role Assignments", $help_coldc_dual_assign], ["Default Assignments", $help_coldc_default_assign]];
var $help_node nolist = 0;
var $root created_on = 853827084;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_assign];
var $root manager = $help_coldc_assign;


