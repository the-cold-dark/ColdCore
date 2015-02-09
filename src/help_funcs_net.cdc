
new object $help_funcs_net: $help_coldc_func;

var $has_name name = ['prop, "Network", "Network"];
var $help_node body = <$ctext_frob, [[<$format, ["table", [["cols", "33%,33%,33%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_bind_port"]], ["bind_port()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_close_connection"]], ["close_connection()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_connection"]], ["connection()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_cwrite"]], ["cwrite()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_cwritef"]], ["cwritef()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_open_connection"]], ["open_connection()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_reassign_connection"]], ["reassign_connection()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_unbind_port"]], ["unbind_port()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [], 'do_td]>], 'do_tr]>], 'do_table]>], #[['this, $help_funcs_net]]]>;
var $help_node links = #[["bind_port()", $help_func_bind_port], ["close_connection()", $help_func_close_connection], ["connection()", $help_func_connection], ["cwrite()", $help_func_cwrite], ["cwritef()", $help_func_cwritef], ["open_connection()", $help_func_open_connection], ["reassign_connection()", $help_func_reassign_connection], ["unbind_port()", $help_func_unbind_port]];
var $help_node nolist = 0;
var $root created_on = 855384021;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_funcs_net];
var $root manager = $help_funcs_net;


