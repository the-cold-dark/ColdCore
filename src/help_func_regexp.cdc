
new object $help_func_regexp: $help_funcs_str;

var $has_name name = ['prop, "regexp()", "regexp()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " regexp(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["STRING regexp"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER cs"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function matches the regular expression argument ", <$format, ["i", [], ["regexp"], 'do_i]>, " against the argument ", <$format, ["i", [], ["str"], 'do_i]>, ". If ", <$format, ["i", [], ["cs"], 'do_i]>, " is specified and is true, the match is case-sensitive; otherwise, it is case-insensitive. If the match succeeds, ", <$format, ["tt", [], ["regexp()"], 'do_tt]>, " returns a list of the matches in ", <$format, ["i", [], ["string"], 'do_i]>, ", or zero if it did not match. If ", <$format, ["i", [], ["regexp"], 'do_i]>, " is not a valid regular expression the error ", <$format, ["tt", [], ["~regexp"], 'do_tt]>, " is thrown. ", <$format, ["np", [], [], 'do_np]>, "For more information on Regular Expressions see the section ", <$format, ["link", [["node", "$help_coldc_regexp"]], ["ColdC Regular Expressions"], 'do_link]>, ". The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_match_regexp"]], ["match_regexp()"], 'do_link]>], 'do_tt]>, " is similar, and better when all that is desired is whether the regexp matches or not. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["regexp(\"fooBAR\", \"bar\")", <$format, ["br", [], [], 'do_br]>, "=> [\"BAR\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["regexp(\"Greg says, 'Hello.'\", \"^([^ ]+) says, '(.*)'$\")", <$format, ["br", [], [], 'do_br]>, "=> [\"Greg\", \"Hello.\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["regexp(\" 300 100 200 \", \"[0-9]+\")", <$format, ["br", [], [], 'do_br]>, "=> [\"300\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["regexp(\"bar\", \"foo\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>, " ", <$format, ["dfn", [], ["regexp(\"Foo\", \"foo\", 1)", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['links, #[["ColdC Regular Expressions", "$help_coldc_regexp"], ["match_regexp()", "$help_func_match_regexp"]]]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["ColdC Regular Expressions", $help_coldc_regexp], ["match_regexp()", $help_func_match_regexp]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_regexp];
var $root manager = $help_func_regexp;


