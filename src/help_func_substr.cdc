
new object $help_func_substr: $help_funcs_str;

var $has_name name = ['prop, "substr()", "substr()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " substr(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER start"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER length"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a subrange of ", <$format, ["i", [], ["string"], 'do_i]>, ". The subrange starts at the character specified by ", <$format, ["i", [], ["start"], 'do_i]>, " and continues ", <$format, ["i", [], ["length"], 'do_i]>, " characters. If ", <$format, ["i", [], ["length"], 'do_i]>, " is unspecified it continues to the end of the string. If ", <$format, ["i", [], ["start"], 'do_i]>, " is outside of the range of the string, or ", <$format, ["i", [], ["length"], 'do_i]>, " will extend past the end of the string, the error ", <$format, ["tt", [], ["~range"], 'do_tt]>, " is thrown. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["substr(\"foobar\", 2, 3)", <$format, ["br", [], [], 'do_br]>, "=> \"oob\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["substr(\"foobar\", 3)", <$format, ["br", [], [], 'do_br]>, "=> \"obar\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["substr(\"foobar\", 7)", <$format, ["br", [], [], 'do_br]>, "=> \"\""], 'do_dfn]>], #[['this, $help_func_substr]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_substr];
var $root manager = $help_func_substr;


