
new object $help_coldc_types_ints: $help_coldc_types;

var $has_name name = ['prop, "Integer|Number", "Integer|Number"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "An ", <$format, ["i", [], ["integer"], 'do_i]>, " is a rational number (in mathematical terms). Integers can reliably be from 2147483647 to -2147483647 (unless the driver has been compiled with BIG_NUMBERS, in which case they are larger). An integer is logically true if it is not zero (negative numbers are logically true). Integers are denoted in ColdC with a series of digits, optionally preceded with a plus (", <$format, ["tt", [], ["+"], 'do_tt]>, ") or minus (", <$format, ["tt", [], ["-"], 'do_tt]>, ") sign. ", <$format, ["np", [], [], 'do_np]>, "See also: ", <$format, ["link", [["node", "$help_funcs_num"]], ["Numeric Functions"], 'do_link]>], #[['links, #[["Numeric Functions", "$help_funcs_num"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Numeric Functions", $help_funcs_num]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_ints];
var $root manager = $help_coldc_types_ints;


