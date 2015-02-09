
new object $help_objects: $help_general;

var $has_name name = ['prop, "Objects", "Objects"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Objects are the primary element of Cold. An object is an abstract concept used to aid in program design. In simple terms an object is something which contains information (data) and instructions for manipulating this information (methods or functions). ", <$format, ["np", [], [], 'do_np]>, "If you are unfamiliar with the concepts of Objects and Object Oriented Programming and you want to learn more, you may want to read about ", <$format, ["link", [["node", "$help_coldc_oop"]], ["Object Oriented Programming"], 'do_link]>, " in the ColdC Reference Manual (following this link is not for the faint of heart!) ", <$format, ["np", [], [], 'do_np]>, "Even if you do not intend to program, it is important to know about objects. If you want to specify an object that is not in your ", <$format, ["link", [["node", "$help_environment"]], ["Environment"], 'do_link]>, ", you can do it by using the object database name (sometimes called an objref or dbref). Object database names are single words (no spaces), beginning with a dollar sign ", <$format, ["tt", [], ["$"], 'do_tt]>, ". The following are all object names:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["$root, $sys, $user_joe"], 'do_dfn]>], #[['links, #[["Object Oriented Programming", "$help_coldc_oop"], ["Environment", "$help_environment"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Object Oriented Programming", $help_coldc_oop], ["Environment", $help_environment]];
var $help_node nolist = 0;
var $root created_on = 846994462;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_objects];
var $root manager = $help_objects;


