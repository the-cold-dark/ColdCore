
new object $introtut_names_tmpl: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Sometimes, a few hints may be added to an object's name, in order to make it easier to refer to. These hints are called Name Templates, because they use a different sort of matching than Names. ", <$format, ["np", [], [], 'do_np]>, "When you see a name template, it may have a question mark in the word ('", <$format, ["tt", [], ["?"], 'do_tt]>, "'), and multiple words may be joined together with the pipe character ('", <$format, ["tt", [], ["|"], 'do_tt]>, "'). The question mark signifies that anything beyond that point in the word is optional. For instance, if the name template 'e?ast' were given, you could type 'e', 'ea', 'eas', and 'east'. ", <$format, ["np", [], [], 'do_np]>, "The pipe character is used to specify possible alternatives, and is equivalent to saying the template can match the first word, or the second word, or the third, and so on. For instance, the template 'east|out' would match both 'east' or 'out'. ", <$format, ["np", [], [], 'do_np]>, "More information is available on how User Names work."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Name Templates", "Name Templates"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874470121;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_names_tmpl];
var $root manager = $introtut_names_tmpl;
var $root settings = #[["back-topic", $introtut_names], ["more-topic", $introtut_names_user], ["next-topic", $introtut_env], ["prev-topic", $introtut_objs], ["map-position", 0], ["propagate", 0]];


