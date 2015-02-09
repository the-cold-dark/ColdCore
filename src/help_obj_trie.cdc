
new object $help_obj_trie: $help_obj;

var $has_name name = ['prop, "Trie", "Trie"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Trie is a datastructure that behaves like dictionary with string keys, except that it allows fast match_begin with all the keys. Also, key may be associated with a value list instead of a single value. Its memory overhead is about twice that of a dictionary, and all the operations are slower, except match_begin (which, unlike the dictionary's, does not have to loop through all the keys). Empty trie is represented as ", <$format, ["tt", [], ["<$trie,[0,\"\"]>"], 'do_tt]>, ".", <$format, ["p", [], [], 'do_p]>, <$format, ["subj", [["level", "3"]], ["Methods"], 'do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["trie.add", 1]], ["add"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ", ", <$format, ["var", [], ["value"], 'do_var]>, "[,", <$format, ["var", [], ["value"], 'do_var]>, "...])"], 'do_dt]>, <$format, ["dd", [], ["Associate a list of values with a key."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["trie.del", 1]], ["del"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Remove the key from trie."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["trie.match_exact", 1]], ["match_exact"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Find an exact match to the key."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["trie.match_begin", 1]], ["match_begin"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Find an approximate match."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["trie.keys", 1]], ["keys"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Get a list of the keys. This is very slow operation."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["trie.to_dict", 1]], ["to_dict"], 'do_method]>, "(), $dictionary.", <$format, ["method", [["dictionary.to_trie", 1]], ["to_trie"], 'do_method]>, "(", <$format, ["var", [], ["dict"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Conversions. The first one converts a trie with a single-element values into dictionary, reverse converts a dictionary with string keys to trie."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 838774726;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_trie];
var $root manager = $help_obj_trie;


