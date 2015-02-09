
new object $help_func_match_begin: $help_funcs_str;

var $has_name name = ['prop, "match_begin()", "match_begin()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " match_begin(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["STRING search"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING sep"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function looks for the string ", <$format, ["i", [], ["search"], 'do_i]>, " at the beginning of each word in ", <$format, ["i", [], ["str"], 'do_i]>, ". The word separator is given by the string ", <$format, ["i", [], ["sep"], 'do_i]>, " if it is specified; otherwise, a space (", <$format, ["tt", [], ["\" \""], 'do_tt]>, ") is used. The return value of ", <$format, ["tt", [], ["match_begin()"], 'do_tt]>, " is ", <$format, ["tt", [], ["1"], 'do_tt]>, " if ", <$format, ["i", [], ["search"], 'do_i]>, " was found at the beginning of a word in ", <$format, ["i", [], ["string"], 'do_i]>, ", or ", <$format, ["tt", [], ["0"], 'do_tt]>, " if not. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["match_begin(\"foo:bar:baz\", \"fo\", \":\")", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>, " ", <$format, ["dfn", [], ["match_begin(\"foo bar baz\", \"ar\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_match_begin]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_match_begin];
var $root manager = $help_func_match_begin;


