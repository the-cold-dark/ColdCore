
new object $help_func_time: $help_funcs_misc;

var $has_name name = ['prop, "time()", "time()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " time()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns the system time in seconds since midnight GMT, January 1, 1970--likely adjusted for the local timezone (this is OS dependant). The functions ", <$format, ["tt", [], ["ctime()"], 'do_tt]>, ", ", <$format, ["tt", [], ["localtime()"], 'do_tt]>, " and the native method ", <$format, ["tt", [], ["$time.format()"], 'do_tt]>, " can be used in manipulating this number."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_time];
var $root manager = $help_func_time;


