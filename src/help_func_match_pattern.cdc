
new object $help_func_match_pattern: $help_funcs_str;

var $has_name name = ['prop, "match_pattern()", "match_pattern()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " match_pattern(", <$format, ["i", [], ["STRING string"], 'do_i]>, ", ", <$format, ["i", [], ["STRING pattern"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function matches the wildcard pattern ", <$format, ["i", [], ["pattern"], 'do_i]>, " against ", <$format, ["i", [], ["string"], 'do_i]>, ". A wildcard pattern is a string with asterixes (", <$format, ["tt", [], ["`*'"], 'do_tt]>, ") signifying wildcards. A regular character matches itself, while a wildcard matches any number of arbitrary characters. The return value of ", <$format, ["tt", [], ["match_pattern()"], 'do_tt]>, " is a list of the substrings of ", <$format, ["i", [], ["string"], 'do_i]>, " which matched the wildcards in ", <$format, ["i", [], ["pattern"], 'do_i]>, ", or ", <$format, ["tt", [], ["0"], 'do_tt]>, " if the match fails. More information on pattern matching can be found in the section ", <$format, ["link", [["node", "$help_commands_matching"]], ["Matching Conventions"], 'do_link]>, ". Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["match_pattern(\"foobar\", \"*\")", <$format, ["br", [], [], 'do_br]>, "=> [\"foobar\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["match_pattern(\"foo quux bar quuux baz\", \"foo * bar * baz\")", <$format, ["br", [], [], 'do_br]>, "=> [\"quux\", \"quuux\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["match_pattern(\"narf:fnord\", \"narf:*\")", <$format, ["br", [], [], 'do_br]>, "=> [\"fnord\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["match_pattern(\"foo baz\", \"foo * bar\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_match_pattern]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Matching Conventions", $help_commands_matching]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_match_pattern];
var $root manager = $help_func_match_pattern;


