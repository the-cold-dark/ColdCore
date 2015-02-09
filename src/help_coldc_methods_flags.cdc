
new object $help_coldc_methods_flags: $help_coldc_methods;

var $has_name name = ['prop, "Flags", "Flags"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Method flags define certain behaviour features of the method. Currently the following method flags exist: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], ["nooverride"], 'do_b]>], 'do_td]>, <$format, ["td", [], ["Methods which specify ", <$format, ["tt", [], ["nooverride"], 'do_tt]>, " cannot be overridden by any of the defining object's descendants."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["b", [], ["lock"], 'do_b]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["This locks all aspects of a method. Locked methods cannot have their access or flags changed, nor can they be recompiled during run-time. Locked methods can be changed outside of the regular running environment (such as in a textdb, or with coldcc)."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["b", [], ["forked"], 'do_b]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["This is used to specify that the method forks from the current task. The return value of a forked method is the task id of the new task."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["b", [], ["native"], 'do_b]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["This specifies a native method. Native methods are not really methods, but are actually functions acting as a method. Because of this native methods cannot be listed or manipulated in most of the usual ways."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "All method flags, with the exception of ", <$format, ["tt", [], ["native"], 'do_tt]>, ", can be manipulated using the functions ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_method_flags"]], ["method_flags()"], 'do_link]>], 'do_tt]>, " and ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_set_method_flags"]], ["set_method_flags()"], 'do_link]>], 'do_tt]>, "."], #[['this, $help_coldc_methods_flags]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["method_flags()", $help_func_method_flags], ["set_method_flags()", $help_func_set_method_flags]];
var $help_node nolist = 0;
var $root created_on = 854665861;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_methods_flags];
var $root manager = $help_coldc_methods_flags;


