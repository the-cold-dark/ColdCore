
new object $help_coldc_find: $help_coldc_loop_expr;

var $has_name name = ['prop, "find", "find"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The find expression is used to find the position of something in a list or dictionary. It does this by looping through the given list or dictionary and testing the iteration expression. When the iteration expression evaluates true it stops and returns the given position. The syntax of find is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["find var in (what expr) where (iteration expr)", <$format, ["br", [], [], 'do_br]>, "find var in [lower expr .. upper expr] where (iteration expr)"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If iteration expression never evaluated true, find returns a zero. The following examples assume the variable ", <$format, ["i", [], ["list"], 'do_i]>, " is set as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[\"First line\",\"second line\",\"3rd line\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["list[find x in (list) where (x.match_regexp(\"co\"))]", <$format, ["br", [], [], 'do_br]>, "=> \"second line\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["find x in [1 .. listlen(list)] where (list[x].match_regexp(\"co\"))", <$format, ["br", [], [], 'do_br]>, "=> 2"], 'do_dfn]>], #[['this, $help_coldc_find]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854330811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_find];
var $root manager = $help_coldc_find;


