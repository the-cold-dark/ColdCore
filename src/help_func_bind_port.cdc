
new object $help_func_bind_port: $help_funcs_net;

var $has_name name = ['prop, "bind_port()", "bind_port()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " bind_port(", <$format, ["i", [], ["INTEGER port"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING addr"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function binds a network port to the current object. If successful, the current object will receive connections on the port. The first argument specifies the port to bind to. Positive port numbers represent the TCP protocol. Negative port numbers represent the UDP protocol. The second optional argument is the address to bind to, which must be a standard IP address (not an internet domain name). This is usually not required, but can be useful if multiple addresses exist on the system and only one must be bound. ", <$format, ["np", [], [], 'do_np]>, "If the port is pre-bound (see the Genesis documentation) but the address does not match up, the error ", <$format, ["tt", [], ["~preaddr"], 'do_tt]>, " may be thrown. If the port is pre-bound and the protocols do not match, the error ", <$format, ["tt", [], ["~pretype"], 'do_tt]>, " is thrown. If the given address is not a valid IP address the error ", <$format, ["tt", [], ["~address"], 'do_tt]>, " is thrown. Other errors may be thrown as ", <$format, ["tt", [], ["~socket"], 'do_tt]>, " or ", <$format, ["tt", [], ["~bind"], 'do_tt]>, " if other problems arise."], #[['this, $help_func_bind_port]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_bind_port];
var $root manager = $help_func_bind_port;


