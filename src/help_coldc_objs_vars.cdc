
new object $help_coldc_objs_vars: $help_coldc_objs;

var $has_name name = ['prop, "Variables", "Variables"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "In ColdC there are two types of variables, ", <$format, ["i", [], ["local variables"], 'do_i]>, " and ", <$format, ["i", [], ["object variables"], 'do_i]>, ". An object variable is defined on the object, and can be accessed by any method defined on the same object. Object variables exist outside of the scope of methods. Local variables are defined within a method, with their scope being limited to that method. Object variables will always exist until they are explicitly removed. Local variables only exist while the method defining them is executing. ", <$format, ["p", [], [], 'do_p]>, "If a variable is used within the body of a method, but it is not defined as an argument or a local variable (at the top of the method), it is assumed to be an object variable. When the method is executed the interpreter looks on the object for the variable. If the interpreter cannot find the variable on the object, the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " is thrown. ", <$format, ["p", [], [], 'do_p]>, "It is important to remember that object variables may only be accessed by methods ", <$format, ["i", [], ["defined by same object defining the variable"], 'do_i]>, ". No other method may reference that variable. For instance, assume two objects exist as ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " and ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, ", where ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, " is a child of ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, ". ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " defines the variable ", <$format, ["tt", [], ["text"], 'do_tt]>, " and the methods ", <$format, ["tt", [], ["set_text"], 'do_tt]>, " and ", <$format, ["tt", [], ["get_text"], 'do_tt]>, ": ", <$format, ["dfn", [], [<$format, ["quote", [], ["\nobject $obj_a: $root;\nvar $obj_a text;\n\npublic method $obj_a.get_text {\n    return text;\n};\n\npublic method $obj_a.set_text {\n    arg new_text;\n\n    text = new_text;\n};"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Calling ", <$format, ["tt", [], ["$obj_a.set_text(\"text\")"], 'do_tt]>, " will set $obj_a's instance of the object variable ", <$format, ["tt", [], ["text"], 'do_tt]>, " to \"text\". ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, " does inherit the ability to use and write to it's own instance of ", <$format, ["tt", [], ["text"], 'do_tt]>, " (using methods defined on ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, "), but it does not inherit values assigned to the same object variable on it's ancestors. For instance, calling ", <$format, ["tt", [], ["$obj_b.get_text()"], 'do_tt]>, " will currently return ", <$format, ["tt", [], ["0"], 'do_tt]>, " (the default unset value), as it's instance of ", <$format, ["tt", [], ["text"], 'do_tt]>, " has not yet been defined, even though ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, "'s instance of ", <$format, ["tt", [], ["text"], 'do_tt]>, " has been defined. This is called ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_oop"]], ["encapsulation"], 'do_link]>], 'do_i]>, ". ", <$format, ["p", [], [], 'do_p]>, "Calling ", <$format, ["tt", [], ["$obj_b.set_text(\"more\")"], 'do_tt]>, " would set ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, "'s instance of ", <$format, ["tt", [], ["text"], 'do_tt]>, " to \"more\". If, following this, ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, " were to override the method ", <$format, ["tt", [], ["get_text"], 'do_tt]>, " defined on ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " as: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\npublic method $obj_b.get_text {\n    return \"more text: \" + text;\n};"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Calling ", <$format, ["tt", [], ["$obj_b.get_text()"], 'do_tt]>, " would cause the error ", <$format, ["tt", [], ["~varnf"], 'do_tt]>, " to be thrown, rather than having \"more text: more\" returned. This is because the object variable ", <$format, ["tt", [], ["text"], 'do_tt]>, " is not defined by $obj_b (where the new ", <$format, ["tt", [], ["get_text"], 'do_tt]>, " is defined), even though it has it's own instance from $obj_a. ", <$format, ["p", [], [], 'do_p]>, "Another way to look at this is from a ", <$format, ["i", [], ["C++"], 'do_i]>, " perspective. All object variables in ColdC are equivalent to being private object variables in C++."], #[['this, $help_coldc_objs_vars]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["encapsulation", $help_coldc_oop]];
var $help_node nolist = 0;
var $root created_on = 853696071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_objs_vars];
var $root manager = $help_coldc_objs_vars;


