
new object $introtut_who: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["It is possible to get a list of everybody who is using ", <$generator, ["servname", [], [], 'gen_servname]>, " at the same time you are. This information is useful for many things, from finding if friends are currently connected to finding somebody's location. ", <$format, ["np", [], [], 'do_np]>, "The command to list everybody connected is ", <$format, ["help", [["node", "$help_cmd_who"]], ["@who"], 'do_help]>, ". Type ", <$format, ["help", [["node", "$help_cmd_who"]], ["@who"], 'do_help]>, " now, to see who is online, how long they have been online, how long it has been since they have typed anything, and where they currently are located. Go ahead and try it now, see who is online. ", <$format, ["np", [], [], 'do_np]>, "You can also specify a specific person with @who. Doing this will only show you information on that specific person. Try this by using yourself as the person, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@who ", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If you want to learn more information about a person, you may want to use the ", <$format, ["link", [["node", "$help_cmd_finger"]], ["@finger"], 'do_link]>, " command. For more information on either of these commands, read the help documents for them."], #[['links, #[["@finger", "$help_cmd_finger"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Who's on-line?", "Who's on-line?"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177643;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_who];
var $root manager = $introtut_who;
var $root settings = #[["prev-topic", $introtut_remote], ["next-topic", $introtut_end], ["map-position", 0], ["propagate", 0]];


