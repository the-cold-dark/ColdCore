
new object $help_func_rethrow: $help_funcs_err;

var $has_name name = ['prop, "rethrow()", "rethrow()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], ["rethrow(", <$format, ["i", [], ["ERROR code"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function continues propagation of an error condition. The interpreter will abort the current method and throw the error specified by ", <$format, ["i", [], ["code"], 'do_i]>, " in the calling method. Calling this function outside of an error handler will result in the error ", <$format, ["tt", [], ["~error"], 'do_tt]>, "."], #[['this, $help_func_rethrow]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_rethrow];
var $root manager = $help_func_rethrow;


