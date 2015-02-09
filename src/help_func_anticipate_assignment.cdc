
new object $help_func_anticipate_assignment: $help_funcs_sys;

var $has_name name = ['prop, "anticipate_assignment()", "anticipate_assignment()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " anticipate_assignment()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Do not use this unless you know exactly what you are doing, and how stacks and frames work in the ColdC driver. ", <$format, ["np", [], [], 'do_np]>, "This function is used to reduce the amount of references to data on the stack, in order to keep from unecessarily copying data. It does this by breaking encapsulation and looking at the calling frame's execution stack. If an assignment will be made to data passed as an argument, as a result of the current method's return--the variable is cleared of any references before the data is modified in the current frame. ", <$format, ["np", [], [], 'do_np]>, "Because of how this works be careful to only call anticipate_assignment() after any ", <$format, ["link", [["node", "$help_coldc_errors"]], ["Errors"], 'do_link]>, " are thrown. Any errors thrown after this function is called will have the potential of losing data in the calling method."], #[['links, #[["Errors", "$help_coldc_errors"]]]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Errors", $help_coldc_errors]];
var $help_node nolist = 0;
var $root created_on = 855388597;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_anticipate_assignment];
var $root manager = $help_func_anticipate_assignment;


