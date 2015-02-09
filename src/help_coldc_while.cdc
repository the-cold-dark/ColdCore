
new object $help_coldc_while: $help_coldc_loop_stmts;

var $has_name name = ['prop, "while", "while"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["while statement"], 'do_i]>, " is used to execute code as long as the condition expression is true. The while statement has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["while (", <$format, ["i", [], ["condition expression"], 'do_i]>, ") ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["i", [], ["statement"], 'do_i]>], 'do_dfn]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The interpreter continually evaluates ", <$format, ["i", [], ["expression"], 'do_i]>, " and executes ", <$format, ["i", [], ["statement"], 'do_i]>, " until the return value of ", <$format, ["i", [], ["expression"], 'do_i]>, " is false. Here is an example using a while statement: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\na = 1;\nwhile (a < 35)\n    a *= 2;   \n.tell(\"total: \" + a);"], 'do_quote]>], 'do_dfn]>], #[['this, $help_coldc_while]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854403194;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_while];
var $root manager = $help_coldc_while;


