
new object $help_coldc_data: $help_coldc_expr;

var $has_name name = ['prop, "Data", "Data"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "All ColdC data has a type and a logical truth value it will take on when evaluated as an ", <$format, ["link", [["node", "$help_coldc_expr"]], ["expression"], 'do_link]>, ". Each data type is explained in the section ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_types"]], ["Data Types"], 'do_link]>], 'do_i]>, "."], #[['this, $help_coldc_data]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["expression", $help_coldc_expr], ["Data Types", $help_coldc_types]];
var $help_node nolist = 0;
var $root created_on = 853827083;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_data];
var $root manager = $help_coldc_data;


