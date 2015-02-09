
new object $help_coldc_err_stmts: $help_coldc_stmts;

var $has_name name = ['prop, "Error-Handling|catch", "Error-Handling|catch"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["catch statement"], 'do_i]>, " is used to catch and recuperate from errors. The catch statement has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["catch ", <$format, ["i", [], ["error code"], 'do_i]>, ", ", <$format, ["i", [], ["error code"], 'do_i]>, ", ", <$format, ["i", [], [".."], 'do_i]>, " ", <$format, ["dfn", [["ind", "4"]], [<$format, ["i", [], ["body-statement"], 'do_i]>], 'do_dfn]>, "with ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["i", [], ["handler-statement"], 'do_i]>], 'do_dfn]>], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The keyword ", <$format, ["tt", [], ["any"], 'do_tt]>, " can be substituded for the list of errors to to catch all errors. The handler statement is optional, and does not need to be defined. ", <$format, ["np", [], [], 'do_np]>, "If an error listed in the error list is thrown inside the ", <$format, ["i", [], ["body-statement"], 'do_i]>, ", the interpreter will catch the error and start executing ", <$format, ["i", [], ["handler-statement"], 'do_i]>, " rather than aborting the method. After the handler is done, the interpreter continues executing after the end of the catch statement, as if ", <$format, ["i", [], ["body-statement"], 'do_i]>, " had completed with no errors. ", <$format, ["np", [], [], 'do_np]>, "Inside the handler statement, the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_error"]], ["error()"], 'do_link]>], 'do_tt]>, " can be used to retrieve the error code which triggered the handler and the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_traceback"]], ["traceback()"], 'do_link]>], 'do_tt]>, " can be used to retrieve the propagated error stack. The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_rethrow"]], ["rethrow()"], 'do_link]>], 'do_tt]>, " is used to continue propagating an error. The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_throw"]], ["throw()"], 'do_link]>], 'do_tt]>, " can be used at any time to throw an error. ", <$format, ["np", [], [], 'do_np]>, "Here is an example of how a catch statement could intelligently handle a ", <$format, ["tt", [], ["~methodnf"], 'do_tt]>, " error thrown from the ", <$format, ["tt", [], ["list_method()"], 'do_tt]>, " function:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["catch ~methodnf\n    code = list_method(method_name);\nwith\n    .tell(\"There is no method named \" + tostr(method_name) + \".\");"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Note that ", <$format, ["link", [["node", "$help_coldc_err_expr"]], ["critical expressions"], 'do_link]>, " inside ", <$format, ["i", [], ["body-statement"], 'do_i]>, " will override the behavior of the catch statement."], #[['this, $help_coldc_err_stmts]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["error()", $help_func_error], ["traceback()", $help_func_traceback], ["rethrow()", $help_func_rethrow], ["throw()", $help_func_throw], ["critical expressions", $help_coldc_err_expr]];
var $help_node nolist = 0;
var $root created_on = 854058264;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_err_stmts];
var $root manager = $help_coldc_err_stmts;


