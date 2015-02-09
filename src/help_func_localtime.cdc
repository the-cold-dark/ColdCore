
new object $help_func_localtime: $help_funcs_misc;

var $has_name name = ['prop, "localtime()", "localtime()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " localtime([", <$format, ["i", [], ["INTEGER time"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns an 11 element list representing the specified by the argument ", <$format, ["i", [], ["time"], 'do_i]>, ". If no argument is given, it will use the current time instead. The elements are taken from ", <$format, ["tt", [], ["struct tm"], 'do_tt]>, " in C and altered as needed to begin at one instead of zero. Elements are broken down in the list as follows:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["INTEGER time (same as returned by the function ", <$format, ["tt", [], ["time()"], 'do_tt]>, ")"], 'do_li]>, <$format, ["li", [], ["INTEGER seconds (1-60)"], 'do_li]>, <$format, ["li", [], ["INTEGER minutes (1-60)"], 'do_li]>, <$format, ["li", [], ["INTEGER hours (1-24))"], 'do_li]>, <$format, ["li", [], ["INTEGER day of month (1-31)"], 'do_li]>, <$format, ["li", [], ["INTEGER month in year (1-12)"], 'do_li]>, <$format, ["li", [], ["INTEGER year (use year + 1900 for the full year)"], 'do_li]>, <$format, ["li", [], ["INTEGER week day (1-7, Sunday=1)"], 'do_li]>, <$format, ["li", [], ["INTEGER year day (1-366)"], 'do_li]>, <$format, ["li", [], ["INTEGER is daylight savings in effect?"], 'do_li]>, <$format, ["li", [], ["STRING time zone name"], 'do_li]>, <$format, ["li", [], ["INTEGER timezone offset in seconds from GMT"], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "Note: there is one bug, in order to optimize the speed of this function the timezone name (as a string) is cached. This will mean that if the timezone name changes while genesis is running the name will not update correctly."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_localtime];
var $root manager = $help_func_localtime;


