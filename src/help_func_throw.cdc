
new object $help_func_throw: $help_funcs_err;

var $has_name name = ['prop, "throw()", "throw()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], ["throw(", <$format, ["i", [], ["ERROR code"], 'do_i]>, ", ", <$format, ["i", [], ["STRING explanation"], 'do_i]>, "[, ", <$format, ["i", [], ["ANY additional"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function throws an error with the code ", <$format, ["i", [], ["code"], 'do_i]>, " in the calling method, not the current method. The current method does not have the ability to stop an error originating in itself. The variables ", <$format, ["i", [], ["explanation"], 'do_i]>, " and ", <$format, ["i", [], ["additional"], 'do_i]>, " appear in the traceback. For more information on error handling see ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_traceback"]], ["traceback()"], 'do_link]>], 'do_tt]>, " and ", <$format, ["link", [["node", "$help_coldc_errors"]], ["Errors"], 'do_link]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["throw(~perm, \"Sender is not the system object.\");"], 'do_dfn]>], #[['this, $help_func_throw]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["traceback()", $help_func_traceback], ["Errors", $help_coldc_errors]];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_throw];
var $root manager = $help_func_throw;


