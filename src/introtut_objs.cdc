
new object $introtut_objs: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Everything in your Virtual Environment on ", <$generator, ["servname", [], [], 'gen_servname]>, " is an object. This includes people, items and locations. Every object has a unique name, which is used to refer to it. This name is often called a database reference (dbref for short) or object name. An object name begins with a dollar-sign (", <$format, ["tt", [], ["$"], 'do_tt]>, ") and is followed by one or more alphabetic or numeric characters, or the underscore. All of the following are object names:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["$root", <$format, ["br", [], [], 'do_br]>, "$thing_35", <$format, ["br", [], [], 'do_br]>, <$generator, ["viewer", [], [], 'gen_viewer]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Objects also have another type of dbref called an object number. You will not likely see too many object numbers, as all valid objects should have a name--which is easier to remember. An object number begins with a pound sign (", <$format, ["tt", [], ["#"], 'do_tt]>, ") followed by a number (positive or negative). If it is a negative number, it is referring to an object which either no longer exists, or has never existed."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Objects", "Objects"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874259889;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_objs];
var $root manager = $introtut_objs;
var $root settings = #[["prev-topic", $introtut_help], ["next-topic", $introtut_names], ["map-position", 0], ["propagate", 0]];


