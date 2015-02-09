
new object $help_coldc_vars: $help_coldc_expr;

var $has_name name = ['prop, "Variable Expression", "Variable Expression"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "ColdC provides two kinds of variables, ", <$format, ["i", [], ["local variables"], 'do_i]>, " and ", <$format, ["i", [], ["object variables"], 'do_i]>, ". ", <$format, ["i", [], ["Local variables"], 'do_i]>, " are used within methods to temporarily store data. In order for a local variable to be used it must first be declared at the top of the method in a ", <$format, ["tt", [], ["var"], 'do_tt]>, " declaration (see section ", <$format, ["link", [["node", "$help_coldc_methods"]], ["Defining Methods"], 'do_link]>, "). ", <$format, ["i", [], ["Object variables"], 'do_i]>, " are defined on an object, and can be used to store data for an indefinite period of time (at least until the object is destroyed). More information on Variables can be found in the section ", <$format, ["link", [["node", "$help_coldc_objs_vars"]], ["Objects and Variables"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "When a variable is evaluated as an expression, its value is that of its contents (the data stored in the variable name). Initially variables will contain the integer data value of zero (", <$format, ["tt", [], ["0"], 'do_tt]>, "). To set the contents of a variable, use the ", <$format, ["link", [["node", "$help_coldc_assign"]], ["assignment expression"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "The value of a local variable is specific to the currently executing method frame. When the method is invoked at another time all of the local variables begin again with the value of zero (", <$format, ["tt", [], ["0"], 'do_tt]>, "). ", <$format, ["np", [], [], 'do_np]>, "If the variable is a local variable, it must be declared as a local variable at the top of the method (see ", <$format, ["link", [["node", "$help_coldc_methods"]], ["Defining Methods"], 'do_link]>, "). If it is not declared at the top of the method, the interpreter will assume it is an object variable. In the case that both a local variable and an object variable have the same name, the local variable will take precedence. ", <$format, ["np", [], [], 'do_np]>, "It is possible to indirectly access and set data on an object variable using the functions ", <$format, ["link", [["node", "$help_func_get_var"]], ["get_var()"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_func_set_var"]], ["set_var()"], 'do_link]>, ". Normally, an object variable is accessed and set just as if it were a local variable. These functions are useful for indirectly setting or accessing the variable, or for when there is a possible conflict with a local variable. If the variable is not declared in the method, the interpreter will always assume it is an object variable."], #[['this, $help_coldc_vars]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Defining Methods", $help_coldc_methods], ["Objects and Variables", $help_coldc_objs_vars], ["assignment expression", $help_coldc_assign]];
var $help_node nolist = 0;
var $root created_on = 854057942;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_vars];
var $root manager = $help_coldc_vars;

