
new object $help_func_reassign_connection: $help_funcs_net;

var $has_name name = ['prop, "reassign_connection()", "reassign_connection()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " reassign_connection(", <$format, ["i", [], ["OBJNUM new"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function changes the controlling object for a connection from the current object to the object specified by the argument ", <$format, ["i", [], ["new"], 'do_i]>, ". If the new object does not exist, ", <$format, ["tt", [], ["~objnf"], 'do_tt]>, " is thrown. If the new object already has a connection, the error ", <$format, ["tt", [], ["~perm"], 'do_tt]>, " is thrown."], #[['this, $help_func_reassign_connection]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_reassign_connection];
var $root manager = $help_func_reassign_connection;


