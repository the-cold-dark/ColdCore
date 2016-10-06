
new object $help_coldc_net_server: $help_coldc_net;

var $has_name name = ['prop, "Server Connection", "Server Connection"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To establish a server connection first call the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_bind_port"]], ["bind_port()"], 'do_link]>], 'do_tt]>, ". The argument to this function is the network port to listen on. Note: most operating systems will restrict low numbered ports (usually anything below 1024 is restricted, and can only be opened with special privileges). If there are no errors, the current object is listening as a server on the specified port. ", <$format, ["np", [], [], 'do_np]>, "When an external client opens a connection the driver will call the method ", <$format, ["tt", [], [".connect()"], 'do_tt]>, " with two arguments. The first argument is a STRING, specifying the remote IP address of the client. The second argument is an INTEGER, specifying the socket where the connection was established. In general this number can be ignored. ", <$format, ["np", [], [], 'do_np]>, "Data received on the connection will be sent as a buffer to the method ", <$format, ["tt", [], [".parse()"], 'do_tt]>, ", after the method ", <$format, ["tt", [], [".connect()"], 'do_tt]>, " is called. Data is sent to the connection using the functions ", <$format, ["tt", [], ["cwrite()"], 'do_tt]>, " and ", <$format, ["tt", [], ["cwritef()"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "If the client terminates the connection, the method ", <$format, ["tt", [], [".disconnect()"], 'do_tt]>, " is called. Note: this method will not be called if the object terminates the connection through ", <$format, ["tt", [], ["close_connection()"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "If multiple connections will be received on the network port, it is suggested that when a connection is started the connection object either reassigns the connection to another connection object (using the function ", <$format, ["tt", [], ["reassign_connection()"], 'do_tt]>, "), or it notifies a new connection object to re-bind the port to itself. If this is not done, new connections will preempt and close the older connection (as only one connection can be on an object at a time)."], #[['this, $help_coldc_net_server]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854948047;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_net_server];
var $root manager = $help_coldc_net_server;


