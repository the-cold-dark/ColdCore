
new object $introtut_look: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["All objects in ", <$generator, ["servname", [], [], 'gen_servname]>, " have a name and a description. Names are automatically displayed, but descriptions often are not. To see an object's description, you need to look at it with the 'look' command. ", <$format, ["np", [], [], 'do_np]>, "The look command can be used in two ways. If you specify something or somebody to look at, you will see that person or object's description. If you do not specify anything, you will see your current location's description (typing 'look here' is the same as simply typing 'look'). ", <$format, ["np", [], [], 'do_np]>, "If you type 'look' right now, you will see these instructions again, because they are the description of this room. The last line you see should be, \"You see a small mailbox here.\", because there is a mailbox in this room. Type 'look mailbox' now, and follow the instructions in its description."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Looking Around", "Looking Around"];
var $location contents = [$introtut_mailbox];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177644;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_look];
var $root manager = $introtut_look;
var $root settings = #[["prev-topic", $introtut_names], ["next-topic", $introtut_moving], ["map-position", 0], ["propagate", 0]];


