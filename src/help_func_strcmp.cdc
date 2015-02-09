
new object $help_func_strcmp: $help_funcs_str;

var $has_name name = ['prop, "strcmp()", "strcmp()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " strcmp(", <$format, ["i", [], ["STRING str1"], 'do_i]>, ", ", <$format, ["i", [], ["STRING str2"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function compares ", <$format, ["i", [], ["str1"], 'do_i]>, " against ", <$format, ["i", [], ["str2"], 'do_i]>, " and returns zero if they are equal, greater than zero if ", <$format, ["i", [], ["string1"], 'do_i]>, " is lexically greater than ", <$format, ["i", [], ["string2"], 'do_i]>, ", and less than zero if ", <$format, ["i", [], ["string1"], 'do_i]>, " is lexically less than ", <$format, ["i", [], ["string2"], 'do_i]>, ". The comparison performed by ", <$format, ["tt", [], ["strcmp()"], 'do_tt]>, " is case-sensitive. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["strcmp(\"Foo\", \"bar\")", <$format, ["br", [], [], 'do_br]>, "=> -28"], 'do_dfn]>, " ", <$format, ["dfn", [], ["strcmp(\"cashmir\", \"cashmiR\")", <$format, ["br", [], [], 'do_br]>, "=> 32"], 'do_dfn]>, " ", <$format, ["dfn", [], ["strcmp(\"foo\", \"foo\")", <$format, ["br", [], [], 'do_br]>, "=> 0"], 'do_dfn]>], #[['this, $help_func_strcmp]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_strcmp];
var $root manager = $help_func_strcmp;


