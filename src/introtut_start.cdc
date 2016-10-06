
new object $introtut_start: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["This is the beginner tutorial to ColdCore and ", <$generator, ["servname", [], [], 'gen_servname]>, ".", <$format, ["br", [], [], 'do_br]>, " It is designed to help introduce you to some of the common commands", <$format, ["br", [], [], 'do_br]>, " you will be using most often. Throughout this tutorial you may be asked", <$format, ["br", [], [], 'do_br]>, " to try a command. We encourage you to do so, and to experiment as much", <$format, ["br", [], [], 'do_br]>, " as you desire. If the command causes the topic's instructions to scroll", <$format, ["br", [], [], 'do_br]>, " off the screen, simply type '", <$format, ["tt", [], ["look"], 'do_tt]>, "' to see them again. ", <$format, ["np", [], [], 'do_np]>, "Each topic in the tutorial is given in a separate step. You can move", <$format, ["br", [], [], 'do_br]>, " back and forth between steps with the commands '", <$format, ["tt", [], ["next"], 'do_tt]>, "' and '", <$format, ["tt", [], ["prev"], 'do_tt]>, "'.", <$format, ["br", [], [], 'do_br]>, " You can exit the tutorial at any time by typing the command '", <$format, ["tt", [], ["exit"], 'do_tt]>, "'."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Welcome!", "Welcome!"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874181387;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_start];
var $root manager = $introtut_start;
var $root settings = #[["next-topic", $introtut_lines], ["map-position", 0], ["propagate", 0]];


