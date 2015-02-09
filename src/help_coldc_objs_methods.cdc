
new object $help_coldc_objs_methods: $help_coldc_objs;

var $has_name name = ['prop, "Methods", "Methods"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A method is a series of ColdC statements which are grouped together as a procedure, to perform a task. Method's are given a name and bound to a specific object. Methods determine the object's behavior.", <$format, ["p", [], [], 'do_p]>, "Methods have a specific structure to them. The number of arguments they will accept is defined at the beginning of the method, followed by the definition all of the variables used within the method. Subsequent lines compose the actual method (See ", <$format, ["link", [["node", "$help_coldc_methods"]], ["Defining Methods"], 'do_link]>, " for more information on method structure).", <$format, ["p", [], [], 'do_p]>, "When ", <$format, ["i", [], [<$format, ["link", [["node", "$help_coldc_oop"]], ["descendants"], 'do_link]>], 'do_i]>, " of an object wish to change their behavior, they may define their own methods, or ", <$format, ["i", [], ["override"], 'do_i]>, " a method defined on an ", <$format, ["i", [], ["ancestor"], 'do_i]>, ". A method is overriden by simply naming it the same as an existing method on an ancestor of the object. When a method is called, the interpreter looks for it first on the object, then on the object's ancestors. If this occurs, it is possible for a method overriding another to stop executing and pass back to the method on its ancestor, and then resume executing when the overriden method completes executing.", <$format, ["p", [], [], 'do_p]>, "It is possible for a method to disallow descendants to override a method, see ", <$format, ["link", [["node", "$help_coldc_methods"]], ["Defining Methods"], 'do_link]>, "."], #[['this, $help_coldc_objs_methods]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Defining Methods", $help_coldc_methods], ["descendants", $help_coldc_oop]];
var $help_node nolist = 0;
var $root created_on = 853696071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_objs_methods];
var $root manager = $help_coldc_objs_methods;


