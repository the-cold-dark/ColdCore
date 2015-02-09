
new object $help_coldc_mcall_over: $help_coldc_mcall;

var $has_name name = ['prop, "Overridden Methods|override", "Overridden Methods|override"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "If a method overrides another method defined on an ancestor, the overriding method can call the overridden method using the function ", <$format, ["tt", [], ["pass()"], 'do_tt]>, ". Arguments to ", <$format, ["tt", [], ["pass()"], 'do_tt]>, " are sent to the overridden method as if the method were called normally. The return value of ", <$format, ["tt", [], ["pass()"], 'do_tt]>, " is the normal return value of the overridden method. ", <$format, ["np", [], [], 'do_np]>, "For instance, passing to an overridden method with:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["pass(\"this arg\", 2);"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Would be rougly equivalent to calling the same method, if it was not overridden, with:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["obj.method(\"this arg\", 2);"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When executed in this manner, the overridden method sees the same object, sender, and caller as the current method. ", <$format, ["np", [], [], 'do_np]>, "In the situation where a descendant overrides a method defined on two of its ancestors, you can determine which method is passed to using the function ", <$format, ["i", [], [<$format, ["link", [["node", "$help_func_find_next_method"]], ["find_next_method()"], 'do_link]>], 'do_i]>, ". The following method (assuming a ColdCore database) can also be of use:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["arg obj, method;\nvar trace, current;\n\ncurrent = (> obj.find_method(method) <);\ntrace = [];\nwhile (current) {\n    trace += [current];\n    current = (| obj.find_next_method(method, current) |);\n}\nreturn trace;"], 'do_quote]>], 'do_dfn]>], #[['this, $help_coldc_mcall_over]]]>;
var $help_node group = 1;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854058039;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_mcall_over];
var $root manager = $help_coldc_mcall_over;


