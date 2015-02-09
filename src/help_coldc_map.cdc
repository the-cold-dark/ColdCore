
new object $help_coldc_map: $help_coldc_loop_expr;

var $has_name name = ['prop, "map", "map"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["tt", [], ["map"], 'do_tt]>, " expression loops a variable through a list, dictionary or integer range, evaluating an expression for each iteration. Results from each iteration are collected into a list and returned when the loop is completed. The syntax for map can be either of the following:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["map ", <$format, ["i", [], ["var"], 'do_i]>, " in (", <$format, ["i", [], ["what expr"], 'do_i]>, ") to (", <$format, ["i", [], ["iteration expr"], 'do_i]>, ")", <$format, ["br", [], [], 'do_br]>, "map ", <$format, ["i", [], ["var"], 'do_i]>, " in [", <$format, ["i", [], ["lower expr"], 'do_i]>, " .. ", <$format, ["i", [], ["upper expr"], 'do_i]>, "] to (", <$format, ["i", [], ["iteration expr"], 'do_i]>, ")"], 'do_tt]>, " "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["map x in ([1, 2, 3]) to (tostr(x))", <$format, ["br", [], [], 'do_br]>, "=> [\"1\", \"2\", \"3\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["map x in [5 .. 15] to (x)", <$format, ["br", [], [], 'do_br]>, "=> [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]"], 'do_dfn]>], #[['this, $help_coldc_map]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854330811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_map];
var $root manager = $help_coldc_map;


