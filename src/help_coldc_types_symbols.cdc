
new object $help_coldc_types_symbols: $help_coldc_types;

var $has_name name = ['prop, "Symbol", "Symbol"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["symbol"], 'do_i]>, " is similar to a string, but it has been abstracted into a ", <$format, ["link", [["node", "$help_coldc_tokens"]], ["ColdC identifier"], 'do_link]>, ". This makes comparisons between symbols much faster than with strings, as when comparing a string each character in the string must be compared, but when comparing a symbol only one comparison occurs. ", <$format, ["p", [], [], 'do_p]>, "Symbols are denoted in ColdC by preceding the identifier with an apostrophe (", <$format, ["tt", [], ["'"], 'do_tt]>, "). Symbols are not terminated with an apostrophe. Symbols are always logically true."], #[['this, $help_coldc_types_symbols]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["ColdC identifier", $help_coldc_tokens]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_symbols];
var $root manager = $help_coldc_types_symbols;


