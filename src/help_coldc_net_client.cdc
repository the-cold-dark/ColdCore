
new object $help_coldc_net_client: $help_coldc_net;

var $has_name name = ['prop, "Client Connection", "Client Connection"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To establish a client connection call the function ", <$format, ["tt", [], ["open_connection()"], 'do_tt]>, " with the first argument as a STRING specifying the IP address of the host, and the second argument an INTEGER specifying the network port to connect on. This function is not a blocking function. Calling it will simply start the process of opening a connection. If there are no immediate errors the function will return normally. ", <$format, ["np", [], [], 'do_np]>, "When a connection is opened the driver will call the method ", <$format, ["tt", [], [".connect()"], 'do_tt]>, " on the current object, with the argument being an INTEGER task_id for the task which called ", <$format, ["tt", [], ["open_connection()"], 'do_tt]>, ". Connection code may wish to ", <$format, ["tt", [], ["suspend()"], 'do_tt]>, " after calling ", <$format, ["tt", [], ["open_connection()"], 'do_tt]>, ", then have the method ", <$format, ["tt", [], [".connect()"], 'do_tt]>, " resume the task when it is received. ", <$format, ["np", [], [], 'do_np]>, "If the connection could not be established, the method ", <$format, ["tt", [], [".failed()"], 'do_tt]>, " is called instead. The first argument is once again the task id, the second argument is an ERROR representing why the connection could not be established. ", <$format, ["np", [], [], 'do_np]>, "Once the connection is established, input and output is handled the same as on a server connection."], #[['this, $help_coldc_net_client]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854948047;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_net_client];
var $root manager = $help_coldc_net_client;


