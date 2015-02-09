
new object $help_func_unbind_port: $help_funcs_net;

var $has_name name = ['prop, "unbind_port()", "unbind_port()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " unbind_port(", <$format, ["i", [], ["INTEGER port"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function stops listening to the port specified by ", <$format, ["i", [], ["port"], 'do_i]>, ". If the object is not listening to the specified port, ", <$format, ["tt", [], ["~servnf"], 'do_tt]>, " is thrown."], #[['this, $help_func_unbind_port]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384460;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_unbind_port];
var $root manager = $help_func_unbind_port;


