
new object $help_coldc_cond_if: $help_coldc_cond_stmts;

var $has_name name = ['prop, "if", "if"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["if statement"], 'do_i]>, " is used to selectively execute code. It will only execute the code if the ", <$format, ["i", [], ["condition expression"], 'do_i]>, " evaluates true. It has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["if (", <$format, ["i", [], ["condition expression"], 'do_i]>, ") ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["i", [], ["statement"], 'do_i]>], 'do_dfn]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When the interpreter encounters the ", <$format, ["i", [], ["if statement"], 'do_i]>, " it will first evaluate the ", <$format, ["i", [], ["condition expression"], 'do_i]>, ". If the value of the ", <$format, ["i", [], ["condition expression"], 'do_i]>, " is true then it will evaluate the ", <$format, ["i", [], ["statement"], 'do_i]>, ". If it is not true it will skip the ", <$format, ["i", [], ["statement"], 'do_i]>, ". The ", <$format, ["link", [["node", "$help_coldc_compound_stmt"]], ["compound statement"], 'do_link]>, " can be used to group multiple statements."], #[['this, $help_coldc_cond_if]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["compound statement", $help_coldc_compound_stmt]];
var $help_node nolist = 0;
var $root created_on = 854395476;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_cond_if];
var $root manager = $help_coldc_cond_if;


