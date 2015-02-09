
new object $help_func_ctime: $help_funcs_misc;

var $has_name name = ['prop, "ctime()", "ctime()"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["STRING ctime([INTEGER time])"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function converts the integer ", <$format, ["i", [], ["time"], 'do_i]>, " into a string format, using the operating system's ", <$format, ["i", [], ["ctime"], 'do_i]>, " library call. This call may handle any time conversions automatically (such as Daylight Savings and Leap Years). If ", <$format, ["i", [], ["time"], 'do_i]>, " is not specified, then ", <$format, ["tt", [], ["ctime()"], 'do_tt]>, " uses the current time. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["ctime(739180536)", <$format, ["br", [], [], 'do_br]>, "=> \"Fri Jun 4 03:55:36 1993\""], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_ctime];
var $root manager = $help_func_ctime;


