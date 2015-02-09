
new object $help_func_data: $help_funcs_obj;

var $has_name name = ['prop, "data()", "data()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["DICTIONARY"], 'do_i]>, " data([", <$format, ["i", [], ["OBJNUM ancestor"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This administrative function is used to retrieve all instances of object variables the current object has, as well as the values of any object variable they define. If ", <$format, ["i", [], ["ancestor"], 'do_i]>, " is not defined it will return ", <$format, ["i", [], ["all"], 'do_i]>, " instances defined by any ancestor. If ", <$format, ["i", [], ["ancestor"], 'do_i]>, " is defined it will only return data which is defined by the specific ancestor. ", <$format, ["np", [], [], 'do_np]>, "The data is returned in a dictionary, where each object variable is a key and the association to the key is the value for the object variable. If no ancestor is specified and all instances are returned, each ancestor's values are contained within another dictionary, where the key is the ancestor. ", <$format, ["np", [], [], 'do_np]>, "If an ancestor defines an object variable, but no instance of that variable has been created for the current object (or the instance has been cleared with the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_clear_var"]], ["clear_var()"], 'do_link]>], 'do_tt]>, "), it is not included in the dictionary. ", <$format, ["np", [], [], 'do_np]>, "The keys in a dictionary returned by ", <$format, ["tt", [], ["data()"], 'do_tt]>, " do not have any particular ordering."], #[['this, $help_func_data]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["clear_var()", $help_func_clear_var]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_data];
var $root manager = $help_func_data;


