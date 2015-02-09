
new object $help_func_strsub: $help_funcs_str;

var $has_name name = ['prop, "strsub()", "strsub()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " strsub(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["STRING what"], 'do_i]>, ", ", <$format, ["i", [], ["STRING replace"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING flags"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function searches for occurances of the string ", <$format, ["i", [], ["what"], 'do_i]>, " within the string ", <$format, ["i", [], ["str"], 'do_i]>, " and replaces them with ", <$format, ["i", [], ["replace"], 'do_i]>, ". By default it will replace any occurance, and will do case-insensitive comparisons. The optional fourth argument can be any of the following characters within the string: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "5%,95%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], ["g"], 'do_b]>], 'do_td]>, <$format, ["td", [], ["Match globally througout the string (default)"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], ["s"], 'do_b]>], 'do_td]>, <$format, ["td", [], ["Single match--Match the first occurance only"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], ["c"], 'do_b]>], 'do_td]>, <$format, ["td", [], ["Case matters when matching"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], ["i"], 'do_b]>], 'do_td]>, <$format, ["td", [], ["Case doesn't matter when matching (default)"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["strsub(\"fooBar\", \"bar\", \"baz\")", <$format, ["br", [], [], 'do_br]>, "=> \"foobaz\" ", <$format, ["np", [], [], 'do_np]>, "strsub(\"fooBar\", \"bar\", \"baz\", \"c\")", <$format, ["br", [], [], 'do_br]>, "=> \"fooBar\""], 'do_dfn]>], #[['this, $help_func_strsub]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_strsub];
var $root manager = $help_func_strsub;


