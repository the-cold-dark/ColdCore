
new object $help_coldc_types_errors: $help_coldc_types;

var $has_name name = ['prop, "Error Codes|errors", "Error Codes|errors"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "An ", <$format, ["i", [], ["error code"], 'do_i]>, " identifies an error. Both the ColdC interpreter and ColdC methods use error codes to identify types of errors when they occur. See section ", <$format, ["link", [["node", "$help_coldc_errors"]], ["Errors"], 'do_link]>, " for information about how errors in ColdC are handled. Errors are denoted in ColdC by preceding an identifier with a tilde (", <$format, ["tt", [], ["~"], 'do_tt]>, "). Error codes are always logically false."], #[['this, $help_coldc_types_errors]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Errors", $help_coldc_errors]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_errors];
var $root manager = $help_coldc_types_errors;


