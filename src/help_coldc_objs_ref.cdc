
new object $help_coldc_objs_ref: $help_coldc_objs;

var $has_name name = ['prop, "Referencing Objects", "Referencing Objects"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Objects exist within the database, and are referenced with a unique number or ", <$format, ["i", [], ["Object Number"], 'do_i]>, " (", <$format, ["i", [], ["objnum"], 'do_i]>, "), which is assigned to the object upon its creation in the database. ", <$format, ["i", [], ["Object numbers"], 'do_i]>, " cannot be changed after an object is created. When an object is destroyed, it's ", <$format, ["i", [], ["objnum"], 'do_i]>, " is not re-used by the driver unless the database is decompiled to text and recompiled. ", <$format, ["np", [], [], 'do_np]>, "An object can also have an ", <$format, ["i", [], ["Object Name"], 'do_i]>, " assigned to it, which can be changed throughout the life of the object. Object Name's are only unique to that object, while the object has the name. Once the name is changed the old name can be taken by another object. Object Names exist for practical functionality, as it is easier to remember references which consist of alphabetic and numeric characters, compared to references which are simply numeric. ", <$format, ["np", [], [], 'do_np]>, "In ColdC an object number is designated with a hash mark ('#') followed by the object's number. For instance ", <$format, ["tt", [], ["#23"], 'do_tt]>, " refers to ", <$format, ["i", [], ["object number"], 'do_i]>, " ", <$format, ["tt", [], ["23"], 'do_tt]>, ". An object name is designated as an ", <$format, ["link", [["node", "$help_coldc_tokens"]], ["identifier"], 'do_link]>, " beginning with a dollar sign (", <$format, ["tt", [], ["$"], 'do_tt]>, "). For instance, if the object ", <$format, ["tt", [], ["#23"], 'do_tt]>, " has the name ", <$format, ["i", [], ["object_23"], 'do_i]>, " assigned to it, it would be formatted in ColdC as: ", <$format, ["tt", [], ["$object_23"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "A negative object number will appear if there is no object in the database with the given object number--i.e. if it is an invalid object number. This is true for all cases, except ", <$format, ["tt", [], ["#-1"], 'do_tt]>, ", which is the generic ", <$format, ["i", [], ["Invalid Object Number"], 'do_i]>, ". ", <$format, ["np", [], [], 'do_np]>, "Both the object number and object name are generically called ", <$format, ["i", [], ["database references"], 'do_i]>, " (", <$format, ["i", [], ["dbrefs"], 'do_i]>, "). When the driver formats a database reference the Object Name will take precedence over an Object Number, because the name is generally easier to remember and comprehend. ", <$format, ["np", [], [], 'do_np]>, "When the interpreter encounters an object name, it looks up the number associated with that name in a table. If no object has been assigned to that name, a ", <$format, ["tt", [], ["~namenf"], 'do_tt]>, " error is thrown; otherwise the object name is equivalent to the object number when executing."], #[['links, #[["identifier", "$help_coldc_tokens"]]]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["identifier", $help_coldc_tokens]];
var $help_node nolist = 0;
var $root created_on = 853696071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_objs_ref];
var $root manager = $help_coldc_objs_ref;


