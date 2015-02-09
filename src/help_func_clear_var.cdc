
new object $help_func_clear_var: $help_funcs_var;

var $has_name name = ['prop, "clear_var()", "clear_var()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " clear_var(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function clears the instance of an object variable, on a descendant. The variable specified by ", <$format, ["i", [], ["name"], 'do_i]>, " must be defined on the same ancestor defining the method which is calling ", <$format, ["tt", [], ["clear_var()"], 'do_tt]>, ". If not, the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " is thrown. If this function is not called before an an ancestor is removed, variables defined on that ancestor and set on the current object ", <$format, ["i", [], ["will remain"], 'do_i]>, " (due to encapsulation). This function is also useful in reducing database usage, as a cleared variable takes up no space, where a set variable (even to a value of ", <$format, ["tt", [], ["0"], 'do_tt]>, ") does. Upon successful execution ", <$format, ["tt", [], ["clear_var()"], 'do_tt]>, " returns ", <$format, ["tt", [], ["1"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "See the section ", <$format, ["link", [["node", "$help_coldc_objs_vars"]], ["Objects and Variables"], 'do_link]>, " for more information on the instance of an object variable."], #[['this, $help_func_clear_var]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Objects and Variables", $help_coldc_objs_vars]];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_clear_var];
var $root manager = $help_func_clear_var;


