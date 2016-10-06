
new object $help_coldc_security: $help_coldc_imp;

var $has_name name = ['prop, "Security", "Security"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "As the ColdC driver does not know what sort of environment the database defines, by default all functions are callable by any object in the database. In order to preserve integrity it is strongly suggested that the database builds a hierarchy of trusted objects. Bind administrative-level functions to these objects using the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_bind_function"]], ["bind_function()"], 'do_link]>], 'do_tt]>, " and restrict access to them. ", <$format, ["np", [], [], 'do_np]>, "It is suggested that the following functions always be bound and secured: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,30%,30%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_atomic"]], ["atomic()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_cancel"]], ["cancel()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_create"]], ["create()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_backup"]], ["backup()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_shutdown"]], ["shutdown()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_set_heartbeat"]], ["set_heartbeat()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_bind_port"]], ["bind_port()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_unbind_port"]], ["unbind_port()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_open_connection"]], ["open_connection()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fopen"]], ["fopen()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fstat"]], ["fstat()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fchmod"]], ["fchmod()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fmkdir"]], ["fmkdir()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_frmdir"]], ["frmdir()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_files"]], ["files()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fremove"]], ["fremove()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_frename"]], ["frename()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fclose"]], ["fclose()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fseek"]], ["fseek()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_feof"]], ["feof()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fwrite"]], ["fwrite()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fread"]], ["fread()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_execute"]], ["execute()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fflush"]], ["fflush()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_bind_function"]], ["bind_function()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_unbind_function"]], ["unbind_function()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "It is also suggested that any additional function which modifies an object or which alters/retrieves data on an object be bound. ", <$format, ["np", [], [], 'do_np]>, "The database can further be secured by solidifying key methods in its internal security scheme (if one exists) and locking them (by setting the ", <$format, ["tt", [], ["'lock"], 'do_tt]>, " method flag, see section ", <$format, ["link", [["node", "$help_coldc_methods"]], ["Defining Methods"], 'do_link]>, ")."], #[['this, $help_coldc_security]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["bind_function()", $help_func_bind_function], ["atomic()", $help_func_atomic], ["cancel()", $help_func_cancel], ["create()", $help_func_create], ["backup()", $help_func_backup], ["shutdown()", $help_func_shutdown], ["set_heartbeat()", $help_func_set_heartbeat], ["bind_port()", $help_func_bind_port], ["unbind_port()", $help_func_unbind_port], ["open_connection()", $help_func_open_connection], ["fopen()", $help_func_fopen], ["fstat()", $help_func_fstat], ["fchmod()", $help_func_fchmod], ["fmkdir()", $help_func_fmkdir], ["frmdir()", $help_func_frmdir], ["files()", $help_func_files], ["fremove()", $help_func_fremove], ["frename()", $help_func_frename], ["fclose()", $help_func_fclose], ["fseek()", $help_func_fseek], ["feof()", $help_func_feof], ["fwrite()", $help_func_fwrite], ["fread()", $help_func_fread], ["execute()", $help_func_execute], ["fflush()", $help_func_fflush], ["unbind_function()", $help_func_unbind_function], ["Defining Methods", $help_coldc_methods]];
var $help_node nolist = 0;
var $root created_on = 854058097;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_security];
var $root manager = $help_coldc_security;


