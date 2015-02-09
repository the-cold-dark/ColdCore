
new object $help_coldc_types_lists: $help_coldc_types;

var $has_name name = ['prop, "List", "List"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["list"], 'do_i]>, " is an ordered grouping of data. The data contained within a list can be of any type, and does not have to be the same type througout the list. Lists are useful for grouping different data elements together. A list is logically true if it contains one or more elements, and is logically false if it is empty. A list is constructed by enclosing a comma-separated series of data elements within square brackets. For example both of the following are both valid lists:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[1, 2, 3] ", <$format, ["br", [], [], 'do_br]>, "[1, [\"foo\", 'bar], $sys]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See Also: ", <$format, ["link", [["node", "$help_funcs_list"]], ["List Functions"], 'do_link]>], #[['links, #[["List Functions", "$help_funcs_list"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["List Functions", $help_funcs_list]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_lists];
var $root manager = $help_coldc_types_lists;


