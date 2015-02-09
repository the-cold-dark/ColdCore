
new object $introtut_help_short: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["For convenience, you can abbreviate the '@help' command to a single question mark, followed by the topic, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["?LINK"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Which would be equivalent to:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help LINK"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "You can also use a single question mark (without any LINK name) to view the current help node again (incase it has scrolled off your terminal). ", <$format, ["np", [], [], 'do_np]>, "To learn about your help navigation history, and how to traverse it, type 'more', or type 'back' to go back."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Help Shortcut", "Help Shortcut"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874289888;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_help_short];
var $root manager = $introtut_help_short;
var $root settings = #[["next-topic", $introtut_objs], ["prev-topic", $introtut_lines], ["back-topic", $introtut_help], ["more-topic", $introtut_help_nav], ["map-position", 0], ["propagate", 0]];


