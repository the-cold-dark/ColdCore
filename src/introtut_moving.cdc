
new object $introtut_moving: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Central to the concept of the Virtual Environment is your location. Generally, when you are in one place, you can only see and interact with things in that same location. Just like in real life, you cannot interact with people who are not nearby. ", <$format, ["np", [], [], 'do_np]>, "Exits are used to link locations together. You can move from place to place using exits. Most places on ", <$generator, ["servname", [], [], 'gen_servname]>, " will be connected in a consistent way, and the exits will usually be compass directions, as well as up and down. You can set how exits are listed in a room with:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set exit-style"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Even if you choose your exit-style to be 'none', you can always type '@ways' to see a list of visible exits. ", <$format, ["np", [], [], 'do_np]>, "Try going east now, by typing 'east' or just 'e'. ", <$format, ["!--", [["This", 1], [" ", 1], ["is", 1], ["a", 1], ["small,", 1], ["poshly-decorated", 1], ["room.", 1], ["The", 1], ["walls", 1], ["are", 1], ["decorated", 1], ["with", 1], ["lavish", 1], ["tapestries,", 1], ["and", 1], ["all", 1], ["around", 1], ["you", 1], ["expensive-looking", 1], ["furniture.", 1], ["So", 1], ["expensive,", 1], ["in", 1], ["fact,", 1], ["that", 1], ["afraid", 1], ["to", 1], ["sit", 1], ["down", 1], ["on", 1], ["it,", 1], ["indeed", 1], ["owner", 1], ["seems", 1], ["have", 1], ["exact", 1], ["same", 1], ["opinion,", 1], ["for", 1], ["cushions", 1], ["covered", 1], ["plastic.", 1], ["Perhaps", 1], ["had", 1], ["better", 1], ["just", 1], ["leave", 1], ["room,", 1], ["lest", 1], ["breathe", 1], ["something.", 1], ["--", 1]], [], 'do_]>], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Moving Around", "Moving Around"];
var $location contents = [];
var $place entrances = [$introtut_path1];
var $place exits = [$introtut_path1];
var $place realm = $realm_of_creation;
var $root created_on = 874264042;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_moving];
var $root manager = $introtut_moving;
var $root settings = #[["prev-topic", $introtut_look], ["next-topic", $introtut_desc], ["map-position", 0], ["propagate", 0]];


