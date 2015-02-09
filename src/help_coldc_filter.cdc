
new object $help_coldc_filter: $help_coldc_loop_expr;

var $has_name name = ['prop, "filter", "filter"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["tt", [], ["filter"], 'do_tt]>, " expression is used to selectively pull elements from a list or dictionary. It loops through the given list or dictionary and adds each element to a new list if the iteration expression tests true. The final list is returned after filter finishes looping. The syntax of filter is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["filter var in (what expr) where (iteration expr)", <$format, ["br", [], [], 'do_br]>, "filter var in [lower expr .. upper expr] where (iteration expr)"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The following examples assume the variable ", <$format, ["i", [], ["list"], 'do_i]>, " is set as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[\"First line\", \"second line\", \"3rd line\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["filter x in (list) where (x.match_regexp(\"co\"))", <$format, ["br", [], [], 'do_br]>, "=> [\"second line\"]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["filter x in [1 .. list.length()] where (list[x].match_regexp(\"co\"));", <$format, ["br", [], [], 'do_br]>, "=> [2]"], 'do_dfn]>], #[['this, $help_coldc_filter]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854330811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_filter];
var $root manager = $help_coldc_filter;


