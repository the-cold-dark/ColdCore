
new object $introtut_objs_env: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["When you use an object in your environment, either by picking it up, looking at it, talking to a friend or something similar (how to do each of these is explained later), ", <$generator, ["servname", [], [], 'gen_servname]>, " will remember the object in your Environment Context. This allows you to refer to previous things in a simple manner. For instance, if you were to use the command 'get' to pick up a bubbly bottle, you could drop the bubbly bottle by simply typing 'drop it', and the system would remember that 'it' refers to the 'bubbly bottle' because it was the last thing you were using. ", <$format, ["np", [], [], 'do_np]>, "In the case where multiple objects may match one name, you can use ordinal references. For instance, if there were five boxes in the same location as you, and each was named 'box', you could not simply pickup 'the box' because the server would not know which one you wanted. However, you could use an ordinal reference, such as 'the 3rd box'. ", <$format, ["np", [], [], 'do_np]>, "The server also has two known keywords which always act the same way. These are '", <$format, ["tt", [], ["me"], 'do_tt]>, "', which will always refer to you, and '", <$format, ["tt", [], ["here"], 'do_tt]>, "', which will always refer to your location. ", <$format, ["np", [], [], 'do_np]>, "More information on Objects in your Environment can be found in the help section ", <$format, ["link", [["node", "$help_environment"]], ["Environment"], 'do_link]>, "."], #[['links, #[["Environment", "$help_environment"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Objects in your Environment", "Objects in your Environment"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874293646;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_objs_env];
var $root manager = $introtut_objs_env;
var $root settings = #[["next-topic", $introtut_look], ["prev-topic", $introtut_names], ["back-topic", $introtut_env], ["map-position", 0], ["propagate", 0]];


