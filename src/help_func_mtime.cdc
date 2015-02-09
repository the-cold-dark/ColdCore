
new object $help_func_mtime: $help_funcs_misc;

var $has_name name = ['prop, "mtime()", "mtime()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " mtime()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If the system the server is on does not have the unix function ", <$format, ["tt", [], ["gettimeofday()"], 'do_tt]>, " then this function will return ", <$format, ["tt", [], ["-1"], 'do_tt]>, ". If it does, this function will return the current microseconds, from the C structure ", <$format, ["tt", [], ["struct timeval"], 'do_tt]>, ". This is useful in certain situations, but in general its granularity is too fine for most cases. This will only work if cold is running on some unix systems."], #[['this, $help_func_mtime]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_mtime];
var $root manager = $help_func_mtime;


