
new object $help_func_split: $help_funcs_str;

var $has_name name = ['prop, "split()", "split()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " split(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["STRING regexp"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER regexp-args"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function breaks ", <$format, ["i", [], ["string"], 'do_i]>, " into a list of strings, using the second argument ", <$format, ["i", [], ["regexp"], 'do_i]>, " (a ", <$format, ["link", [["node", "$help_coldc_regexp"]], ["regular expression"], 'do_link]>, ") as a delimiter. The third argument is optional, and is a string containing character flags which can change the behaviour of ", <$format, ["tt", [], ["split()"], 'do_tt]>, ". Flags can be any: ", <$format, ["dfn", [["ind", "4"], ["nobound", 1]], [<$format, ["table", [["cols", "5%,95%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["b"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Keep blank entries (default is to ignore)"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["c"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Case sensitive match"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["i"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Case insensitive match (default)"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["split(\" foo bar baz\", \" +\")", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", \"bar\", \"baz\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["split(\"foo:bar::baz\", \":\", \"b\")", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", \"bar\", \"\", \"baz\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["split(\"fobibobIbidilly\", \"i\")", <$format, ["br", [], [], 'do_br]>, "=> [\"fob\", \"bob\", \"b\", \"d\", \"lly\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["split(\"fobIbobibidIlly\", \"i\", \"cb\")", <$format, ["br", [], [], 'do_br]>, "=> [\"fobIbob\", \"b\", \"dIlly\"]"], 'do_dfn]>], #[['this, $help_func_split]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["regular expression", $help_coldc_regexp]];
var $help_node nolist = 0;
var $root created_on = 855434905;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_split];
var $root manager = $help_func_split;


