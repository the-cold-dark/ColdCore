
new object $help_func_open_connection: $help_funcs_net;

var $has_name name = ['prop, "open_connection()", "open_connection()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " open_connection(", <$format, ["i", [], ["STRING host"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER port"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function opens an outbound connection to ", <$format, ["i", [], ["host"], 'do_i]>, " at port ", <$format, ["i", [], ["port"], 'do_i]>, ", on the current object. If the host address ", <$format, ["i", [], ["host"], 'do_i]>, " is invalid, the error ", <$format, ["tt", [], ["~address"], 'do_tt]>, " is thrown. If the socket could not be established, ", <$format, ["tt", [], ["~socket"], 'do_tt]>, " is thrown. For more information, see the section on ", <$format, ["link", [["node", "$help_coldc_net"]], ["Networking"], 'do_link]>, "."], #[['this, $help_func_open_connection]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Networking", $help_coldc_net]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_open_connection];
var $root manager = $help_func_open_connection;


