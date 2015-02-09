
new object $help_funcs_var: $help_coldc_func;

var $has_name name = ['prop, "Variable", "Variable"];
var $help_node body = <$ctext_frob, [[<$format, ["table", [["cols", "20%,20%,20%,20%,20%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_add_var"]], ["add_var()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_clear_var"]], ["clear_var()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_del_var"]], ["del_var()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_get_var"]], ["get_var()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_set_var"]], ["set_var()"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_variables"]], ["variables()"], 'do_link]>], 'do_td]>, <$format, ["td", [], [], 'do_td]>, <$format, ["td", [], [], 'do_td]>, <$format, ["td", [], [], 'do_td]>, <$format, ["td", [], [], 'do_td]>], 'do_tr]>], 'do_table]>], #[['this, $help_funcs_var]]]>;
var $help_node links = #[["add_var()", $help_func_add_var], ["clear_var()", $help_func_clear_var], ["del_var()", $help_func_del_var], ["get_var()", $help_func_get_var], ["set_var()", $help_func_set_var], ["variables()", $help_func_variables]];
var $help_node nolist = 0;
var $root created_on = 855384020;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_funcs_var];
var $root manager = $help_funcs_var;


