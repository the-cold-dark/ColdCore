
new object $help_func_set_heartbeat: $help_funcs_sys;

var $has_name name = ['prop, "set_heartbeat()", "set_heartbeat()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " set_heartbeat(", <$format, ["i", [], ["INTEGER interval"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function sets the periodic global heartbeat for the database to the argument ", <$format, ["i", [], ["interval"], 'do_i]>, ", where ", <$format, ["i", [], ["interval"], 'do_i]>, " is in the delay in seconds. The heartbeat can be disabled by setting the interval to zero or a negative number. The default heartbeat interval is five seconds. The heartbeat is sent by the driver calling the method ", <$format, ["tt", [], ["$sys.heartbeat()"], 'do_tt]>, "."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_set_heartbeat];
var $root manager = $help_func_set_heartbeat;


