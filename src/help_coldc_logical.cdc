
new object $help_coldc_logical: $help_coldc_ops;

var $has_name name = ['prop, "Logical Operators", "Logical Operators"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["tt", [], ["ColdC"], 'do_tt]>, " provides a number of relational and logical operators. These operators are primarily useful for expressing conditions, since they return either true or false, represented by the integers ", <$format, ["tt", [], ["1"], 'do_tt]>, " and ", <$format, ["tt", [], ["0"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "The binary operators ", <$format, ["tt", [], ["=="], 'do_tt]>, " and ", <$format, ["tt", [], ["!="], 'do_tt]>, " test the left and right arguments for equality and inequality, respectively. The arguments are equal if each side has the same data type and contains the same value. Equality of strings is not case-sensitive, but equality of symbols is, so ", <$format, ["tt", [], ["(\"foo\" == \"fOo\")"], 'do_tt]>, " is true, but ", <$format, ["tt", [], ["('car == 'CAr)"], 'do_tt]>, " is false. Lists are equal if all of the elements in each list are equal and are in the same order. ", <$format, ["np", [], [], 'do_np]>, "The ", <$format, ["tt", [], ["<"], 'do_tt]>, ", ", <$format, ["tt", [], ["<="], 'do_tt]>, ", ", <$format, ["tt", [], [">="], 'do_tt]>, ", and ", <$format, ["tt", [], [">"], 'do_tt]>, " operators test whether their left-hand arguments are less than, less than or equal to, greater than or equal to, or greater than their right-hand arguments, respectively. Arguments to these operators must both be of the same type, and must be either numeric or a string. String comparison is not case-sensitive, so ", <$format, ["tt", [], ["(\"fooa\" < \"fooB\")"], 'do_tt]>, " is true, even though the ASCII value of ", <$format, ["tt", [], ["`a'"], 'do_tt]>, " is greater than that of ", <$format, ["tt", [], ["`B'"], 'do_tt]>, " (the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_strcmp"]], ["strcmp()"], 'do_link]>], 'do_tt]>, " may be used for a true lexical case-sensitive comparison of strings). ", <$format, ["np", [], [], 'do_np]>, "The unary ", <$format, ["tt", [], ["!"], 'do_tt]>, " operator tests whether its argument is false, thus acting as a logical ", <$format, ["i", [], ["NOT"], 'do_i]>, " operation."], #[['this, $help_coldc_logical]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["strcmp()", $help_func_strcmp]];
var $help_node nolist = 0;
var $root created_on = 853827084;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_logical];
var $root manager = $help_coldc_logical;


