
new object $help_funcs_err: $help_coldc_func;

var $has_name name = ['prop, "Error", "Error"];
var $help_node body = <$ctext_frob, [[<$format, ["table", [["cols", "20%,20%,20%,20%,20%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_error"]], ["error()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_rethrow"]], ["rethrow()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_throw"]], ["throw()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_traceback"]], ["traceback()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [], 'do_td]>], 'do_tr]>], 'do_table]>], #[['this, $help_funcs_err]]]>;
var $help_node links = #[["error()", $help_func_error], ["rethrow()", $help_func_rethrow], ["throw()", $help_func_throw], ["traceback()", $help_func_traceback]];
var $help_node nolist = 0;
var $root created_on = 855384021;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_funcs_err];
var $root manager = $help_funcs_err;


