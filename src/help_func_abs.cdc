
new object $help_func_abs: $help_funcs_num;

var $has_name name = ['prop, "abs()", "abs()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER|FLOAT"], 'do_i]>, " abs(", <$format, ["i", [], ["INTEGER|FLOAT number"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the absolute value of ", <$format, ["i", [], ["number"], 'do_i]>, ", where ", <$format, ["i", [], ["number"], 'do_i]>, " can be either a float or an integer (and the same type of value is returned). Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["abs(-6)", <$format, ["br", [], [], 'do_br]>, "=> 6 ", <$format, ["np", [], [], 'do_np]>, "abs(7)", <$format, ["br", [], [], 'do_br]>, "=> 7 ", <$format, ["np", [], [], 'do_np]>, "abs(-000.12)", <$format, ["br", [], [], 'do_br]>, "=> 0.120000"], 'do_tt]>], 'do_dfn]>], #[['this, $help_func_abs]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384033;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_abs];
var $root manager = $help_func_abs;


