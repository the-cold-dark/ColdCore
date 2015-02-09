
new object $help_func_explode: $help_funcs_str;

var $has_name name = ['prop, "explode()", "explode()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " explode(", <$format, ["i", [], ["STRING str"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING sep"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER want-blanks"], 'do_i]>, "]])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function breaks ", <$format, ["i", [], ["string"], 'do_i]>, " into a list of strings, using the string ", <$format, ["i", [], ["sep"], 'do_i]>, " as the delimiter. If ", <$format, ["i", [], ["sep"], 'do_i]>, " is unspecified it uses spaces as the delimiter. If ", <$format, ["i", [], ["want-blanks"], 'do_i]>, " is specified and is true ", <$format, ["tt", [], ["explode()"], 'do_tt]>, " will include zero-length strings in the final list, otherwise it will not. The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_split"]], ["split()"], 'do_link]>], 'do_tt]>, " is similar, but uses a regular expression as the delimiter. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["explode(\" foo bar baz\")", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", \"bar\", \"baz\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["explode(\"foo:bar::baz\", \":\")", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", \"bar\", \"baz\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["explode(\"foo:bar::baz\", \":\", 1)", <$format, ["br", [], [], 'do_br]>, "=> [\"foo\", \"bar\", \"\", \"baz\"]"], 'do_dfn]>], #[['this, $help_func_explode]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["split()", $help_func_split]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_explode];
var $root manager = $help_func_explode;


