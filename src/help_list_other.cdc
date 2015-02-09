
new object $help_list_other: $help_obj_list;

var $has_name name = ['prop, "Other", "Other"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["list.flatten", 1]], ["flatten"], 'do_method]>, "(", <$format, ["var", [], ["list"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Raise all the sublists to the toplevel."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.sum", 1]], ["sum"], 'do_method]>, "(", <$format, ["var", [], ["list"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Returns the sum of the elements of the list."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.non_alphanumeric", 1]], ["non_alphanumeric"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dt", [], [".", <$format, ["method", [["list.numbers", 1]], ["numbers"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dt", [], [".", <$format, ["method", [["list.alphabet", 1]], ["alphabet"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Returns the lists of characters in each class."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.to_buffer", 1]], ["to_buffer"], 'do_method]>, "([", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], ["Turns a list of strings into ", <$format, ["link", [["node", "$help_coldc_types_buffers"]], ["buffer"], 'do_link]>, ", inserting a newlist (by default) as a separator."], 'do_dd]>], 'do_dl]>, <$format, ["subj", [["level", "3"]], ["Associative lists"], 'do_subj]>, "Associative lists are lists of key/value pairs. Use them only when dealing with very few elements (fewer than 5, for instance). For larger databases, memory advantage of the associative lists ceases to matter, and they are much slower than ", <$format, ["link", [["node", "$help_coldc_types_dicts"]], ["dictionaries"], 'do_link]>, ".", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["list.addkey", 1]], ["addkey"], 'do_method]>, "(", <$format, ["var", [], ["l"], 'do_var]>, ", ", <$format, ["var", [], ["key"], 'do_var]>, ", ", <$format, ["var", [], ["val"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Adds a key/value pair to the list, or modifies the value associated with existing key."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.delkey", 1]], ["delkey"], 'do_method]>, "(", <$format, ["var", [], ["l"], 'do_var]>, ", ", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Removes the key/value pair if exists."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.getkey", 1]], ["getkey"], 'do_method]>, "(", <$format, ["var", [], ["l"], 'do_var]>, ", ", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Returns the value associated with the key, or throws ~keynf."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.getkey_index", 1]], ["getkey_index"], 'do_method]>, "(", <$format, ["var", [], ["l"], 'do_var]>, ", ", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Returns the index if the key, or throws."], 'do_dd]>], 'do_dl]>], #[['links, #[["buffer", "$help_coldc_types_buffers"], ["dictionaries", "$help_coldc_types_dicts"]]]]]>;
var $help_node links = #[["buffer", $help_coldc_types_buffers], ["dictionaries", $help_coldc_types_dicts]];
var $help_node nolist = 0;
var $root created_on = 850833064;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_list_other];
var $root manager = $help_list_other;

