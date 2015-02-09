
new object $help_coldc_types_strings: $help_coldc_types;

var $has_name name = ['prop, "String", "String"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["string"], 'do_i]>, " is a sequence of printable characters. A string is logically true if it is not empty. A string is denoted in ColdC by enclosing the printable characters within double quote characters (", <$format, ["tt", [], ["\""], 'do_tt]>, "). To include a double quote inside a string precede it with a backslash. Any other occurance of a backslash in a string has no special meaning, unless it follows another backslash (at which point it is assumed to be escaping itself, and reduces as appropriate). The following are some examples of strings: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n\"foo\"\n\"\\\"foo\\\" is a metasyntactic variable.\"\n\"The backslash (`\') is a much-abused character in many languages.\""], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See Also: ", <$format, ["link", [["node", "$help_funcs_str"]], ["String Functions"], 'do_link]>], #[['links, #[["String Functions", "$help_funcs_str"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["String Functions", $help_funcs_str]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_strings];
var $root manager = $help_coldc_types_strings;


