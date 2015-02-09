
new object $help_coldc_objs_special: $help_coldc_objs;

var $has_name name = ['prop, "Special Object Status", "Special Object Status"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "There are always two objects which exists within a ColdC database. The first object is ", <$format, ["tt", [], ["$root"], 'do_tt]>, " (", <$format, ["tt", [], ["#1"], 'do_tt]>, "). The root object has no parents, and is the base for all other objects. This is a requirement in order to allow for a secure database to be created. ", <$format, ["p", [], [], 'do_p]>, "The second object is ", <$format, ["tt", [], ["$sys"], 'do_tt]>, " (", <$format, ["tt", [], ["#0"], 'do_tt]>, "). The system object is the only object the driver directly calls methods on, with without previously setting up with the driver (i.e. connections). These methods include ", <$format, ["tt", [], ["$sys.startup()"], 'do_tt]>, ", ", <$format, ["tt", [], ["$sys.heartbeat()"], 'do_tt]>, " and ", <$format, ["tt", [], ["$sys.signal()"], 'do_tt]>, ". ", <$format, ["p", [], [], 'do_p]>, "The root and system objects are automatically created by the database compiler."], #[['this, $help_coldc_objs_special]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 853696071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_objs_special];
var $root manager = $help_coldc_objs_special;


