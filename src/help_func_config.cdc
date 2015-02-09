
new object $help_func_config: $help_funcs_sys;

var $has_name name = ['prop, "config()", "config()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["ANY"], 'do_i]>, " config(", <$format, ["i", [], ["SYMBOL what"], 'do_i]>, "[, ", <$format, ["i", [], ["ANY value"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This administrative function is used to change run-time values for the driver and execution states. Current Genesis only partially implements this function--it recognizes the changes but does not fully comply with them. The value is specified with the argument ", <$format, ["i", [], ["what"], 'do_i]>, ". If no second argument is given the current value is returned. If a second argument is given, the value is set to that value, if appropriate--if the new value is inappropriate the error ", <$format, ["tt", [], ["~type"], 'do_tt]>, " is thrown. Values are: ", <$format, ["dfn", [["nobound", 1]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], ["'datasize"], 'do_td]>, <$format, ["td", [], ["Maximum Data Size (in bytes)"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["'forkdepth"], 'do_td]>, <$format, ["td", [], ["Maximum fork depth"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["'calldepth"], 'do_td]>, <$format, ["td", [], ["Maximum call depth"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["'recursion"], 'do_td]>, <$format, ["td", [], ["Maximum Swapping"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["'objswap"], 'do_td]>, <$format, ["td", [], ["Object Swapping"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['this, $help_func_config]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855429715;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_config];
var $root manager = $help_func_config;


