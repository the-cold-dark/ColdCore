
new object $help_func_connection: $help_funcs_net;

var $has_name name = ['prop, "connection()", "connection()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " connection()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns a list of information on the current connection. If no connection exists, ", <$format, ["tt", [], ["~net"], 'do_tt]>, " is thrown. The list is ordered as:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["INTEGER boolean (true if the connection is readable)"], 'do_li]>, <$format, ["li", [], ["INTEGER boolean (true if the connection is writable)"], 'do_li]>, <$format, ["li", [], ["INTEGER boolean (true if the connection is dead)"], 'do_li]>, <$format, ["li", [], ["INTEGER file descriptor"], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "Most of this information is useful only for debugging, as it can change immediately (all but the file descriptor). This function is useful for determining if the current object has a valid connection."], #[['this, $help_func_connection]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_connection];
var $root manager = $help_func_connection;


