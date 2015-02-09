
new object $help_coldc_cond_ifelse: $help_coldc_cond_stmts;

var $has_name name = ['prop, "if-else|else", "if-else|else"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["if-else statement"], 'do_i]>, " is similar to the ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_cond_if"]], ["if statement"], 'do_link]>], 'do_i]>, ". It further extends the ", <$format, ["i", [], ["if statement"], 'do_i]>, "'s syntax to include a second statement for when the ", <$format, ["i", [], ["condition expression"], 'do_i]>, " evaluates false. It has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["if (", <$format, ["i", [], ["condition expression"], 'do_i]>, ") ", <$format, ["dfn", [["ind", "4"]], [<$format, ["i", [], ["true statement"], 'do_i]>], 'do_dfn]>, "else ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["i", [], ["false statement"], 'do_i]>], 'do_dfn]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When the interpreter encounters the ", <$format, ["i", [], ["if-else statement"], 'do_i]>, " it will first evaluate the ", <$format, ["i", [], ["condition expression"], 'do_i]>, ". If the value of the ", <$format, ["i", [], ["condition expression"], 'do_i]>, " is true, it will execute the ", <$format, ["i", [], ["true expression"], 'do_i]>, ", otherwise it will execute the ", <$format, ["i", [], ["false expression"], 'do_i]>, ". The ", <$format, ["link", [["node", "$help_coldc_compound_stmt"]], ["compound statement"], 'do_link]>, " can be used to group multiple statements."], #[['this, $help_coldc_cond_ifelse]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["if statement", $help_coldc_cond_if], ["compound statement", $help_coldc_compound_stmt]];
var $help_node nolist = 0;
var $root created_on = 854395484;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_cond_ifelse];
var $root manager = $help_coldc_cond_ifelse;


