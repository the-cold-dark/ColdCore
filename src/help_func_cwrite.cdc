
new object $help_func_cwrite: $help_funcs_net;

var $has_name name = ['prop, "cwrite()", "cwrite()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " cwrite(", <$format, ["i", [], ["BUFFER buffer"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function writes the buffer data in the argument ", <$format, ["i", [], ["buffer"], 'do_i]>, " to the connection on the current object. If there is no connection on the current object a zero is returned. Otherwise a one is returned."], #[['this, $help_func_cwrite]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_cwrite];
var $root manager = $help_func_cwrite;


