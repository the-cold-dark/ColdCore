
new object $help_coldc_types_dicts: $help_coldc_types;

var $has_name name = ['prop, "Dictionary", "Dictionary"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["dictionary"], 'do_i]>, " is a collection of data associations, each of which has a key and a value. Dictionaries are similar to lists, however, lookup in a dictionary is with the key (returning the value), rather than with the location in the list. Dictionaries generally take up more storage space in memory than lists, and are slightly slower to add to and remove from than lists, but searching for items in dictionaries is much faster than searching for items in a list.", <$format, ["np", [], [], 'do_np]>, "Dictionaries are denoted by a list of two-element lists, preceded with a hash mark (", <$format, ["tt", [], ["#"], 'do_tt]>, "). Each of the two-element lists is an association, where the first element is the key and the second element is the value. Dictionaries are logically true unless empty. The following are all valid dictionaries:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["#[[\"foo\", 3], ['bar, 'baz]]", <$format, ["br", [], [], 'do_br]>, "#[[\"something\", 'blue], [\"one\", 1], [\"two\", 2]]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When evaluating the key for the value in the dictionary is indexed, rather than the position as in a list, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["dict=#[[\"foo\", 3], ['bar, 'baz]];", <$format, ["br", [], [], 'do_br]>, "dict['bar];", <$format, ["br", [], [], 'do_br]>, "=> 'baz"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See Also: ", <$format, ["link", [["node", "$help_funcs_dict"]], ["Dictionary Functions"], 'do_link]>], #[['links, #[["Dictionary Functions", "$help_funcs_dict"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Dictionary Functions", $help_funcs_dict]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_dicts];
var $root manager = $help_coldc_types_dicts;


