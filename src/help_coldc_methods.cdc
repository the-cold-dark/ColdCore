
new object $help_coldc_methods: $help_coldc_imp;

var $has_name name = ['prop, "Methods", "Methods"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A method consists of five different aspects: Arguments, Variables, ColdC Code, Access and Flags. Arguments, Variables and ColdC Code are all defined within the Method Code. Access and Flags are set and changed outside the method definition. Arguments define how the method can be called. Variables define any local variables used in the method. Code consists of the rest of the method instructions. Access defines how the method may be called and Flags define any other functionality and behaviour of the method.", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_methods_code"]], ["Method Code"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_methods_flags"]], ["Method Flags"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_coldc_methods_access"]], ["Method Access"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['this, $help_coldc_methods]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Method Code", $help_coldc_methods_code], ["Method Flags", $help_coldc_methods_flags], ["Method Access", $help_coldc_methods_access]];
var $help_node nolist = 0;
var $root created_on = 854058074;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_methods];
var $root manager = $help_coldc_methods;


