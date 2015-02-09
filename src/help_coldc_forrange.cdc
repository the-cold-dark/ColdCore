
new object $help_coldc_forrange: $help_coldc_loop_stmts;

var $has_name name = ['prop, "for-range", "for-range"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["for-range statement"], 'do_i]>, " is used to traverse a range of integers. The range is specified by seperating the lower and upper bounds of the range with the range operator (", <$format, ["tt", [], [".."], 'do_tt]>, "), contained within the left and right square brackets (", <$format, ["tt", [], ["["], 'do_tt]>, " and ", <$format, ["tt", [], ["]"], 'do_tt]>, "). A for-list statement of this nature would look like:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["for ", <$format, ["i", [], ["variable"], 'do_i]>, " in [", <$format, ["i", [], ["lower"], 'do_i]>, " .. ", <$format, ["i", [], ["upper"], 'do_i]>, "] ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["i", [], ["statement"], 'do_i]>], 'do_dfn]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, <$format, ["i", [], ["lower"], 'do_i]>, " and ", <$format, ["i", [], ["upper"], 'do_i]>, " must be expressions resulting in an integer type (unlike a range in a switch). The interpreter executes ", <$format, ["i", [], ["statement"], 'do_i]>, " once for each number from ", <$format, ["i", [], ["lower"], 'do_i]>, " to ", <$format, ["i", [], ["upper"], 'do_i]>, ", with ", <$format, ["i", [], ["variable"], 'do_i]>, " being assigned the current number in the range. An example of using a range in a list is: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\nfor i in [1 .. 10]\n    .tell(\"iteration \" + i);"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Assigning to ", <$format, ["i", [], ["variable"], 'do_i]>, " within a for-list statement will not change the status of the loop; the interpreter remembers where it is at in ", <$format, ["i", [], ["what"], 'do_i]>, " and will continue as normal."], #[['this, $help_coldc_forrange]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854403194;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_forrange];
var $root manager = $help_coldc_forrange;


