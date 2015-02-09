
new object $help_coldc_splice: $help_coldc_ops;

var $has_name name = ['prop, "List Splice Operator", "List Splice Operator"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Splicing is used to either expand a list or in scatter assignments and method calls to group remaining arguments into a list. The splice operator is an at sign (", <$format, ["tt", [], ["@"], 'do_tt]>, "). ", <$format, ["np", [], [], 'do_np]>, "Splice can be used to expand a list in three situations: within a method call, within a function call or within another list When expanding, elements within the list to be spliced are placed starting at the appropriate position within the spliced list. For example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[1, @['a, 'b, 'c], 2, 3]", <$format, ["br", [], [], 'do_br]>, "[1, 'a, 'b, 'c, 2, 3]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Note: the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_listgraft"]], ["listgraft()"], 'do_link]>], 'do_tt]>, " behaves in the same manner. When using splice to expand a list as arguments to a function it looks similar:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["others = [1, \"this\"];", <$format, ["br", [], [], 'do_br]>, "$string.do_something(this, that, @others);"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When the method ", <$format, ["tt", [], ["do_something"], 'do_tt]>, " is called it would be called with four arguments, and the last two arguments would have a value of ", <$format, ["tt", [], ["1"], 'do_tt]>, " and ", <$format, ["tt", [], ["\"this\""], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "The splicing operator is always evaluated last, and is not listed in the operator precedence list (see section ", <$format, ["link", [["node", "$help_coldc_prec"]], ["Precedence"], 'do_link]>, "). Because of its restricted nature the splicing operator never causes ambiguity."], #[['this, $help_coldc_splice]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["listgraft()", $help_func_listgraft], ["Precedence", $help_coldc_prec]];
var $help_node nolist = 0;
var $root created_on = 854058343;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_splice];
var $root manager = $help_coldc_splice;


