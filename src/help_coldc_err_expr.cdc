
new object $help_coldc_err_expr: $help_coldc_expr;

var $has_name name = ['prop, "Error Handling Expression", "Error Handling Expression"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Two mechanisms exist for handling errors in expressions. These are the ", <$format, ["i", [], ["critical expression"], 'do_i]>, " and the ", <$format, ["i", [], ["propagation expression"], 'do_i]>, ". The ", <$format, ["i", [], ["critical expression"], 'do_i]>, " is used to ignore any errors thrown from inside the expression. It has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["(| expression |)"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If an error occurs in ", <$format, ["i", [], ["expression"], 'do_i]>, " the interpreter will stop evaluating ", <$format, ["i", [], ["expression"], 'do_i]>, " and continue to execute the current method as if it had succeeded evaluating ", <$format, ["i", [], ["expression"], 'do_i]>, ". The value of ", <$format, ["i", [], ["expression"], 'do_i]>, " will be the error code for the error which occurred. ", <$format, ["np", [], [], 'do_np]>, "The ", <$format, ["i", [], ["propagation expression"], 'do_i]>, " causes any error thrown by a method call within the expression to be thrown as if the current method threw it. It has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["(> expression <)"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "If an error occurs in ", <$format, ["i", [], ["expression"], 'do_i]>, " it will propagate to the calling method as if the error had originated in the calling method and not in the current method. Otherwise, the calling method will receive the error as ", <$format, ["tt", [], ["~methoderr"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "Critical expressions override the behavior of catch statements so that errors which occur within critical expressions do not trigger catch error handlers. Propagation expressions do not override critical expressions or catch statements, however. They do not prevent errors from being caught; they only determine how errors propagate if they are not caught. ", <$format, ["np", [], [], 'do_np]>, "For more information on handling errors, see section ", <$format, ["link", [["node", "$help_coldc_errors"]], ["Errors"], 'do_link]>, "."], #[['this, $help_coldc_err_expr]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Errors", $help_coldc_errors]];
var $help_node nolist = 0;
var $root created_on = 854057983;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_err_expr];
var $root manager = $help_coldc_err_expr;


