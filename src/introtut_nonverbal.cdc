
new object $introtut_nonverbal: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Another common form of communication is the \"emote\" command, or emotion command. It is used for situations where you would not normally vocalize. For instance, if you are feeling happy, it would seem unusual to say, \"I am happy\", when there are many ways you would normally express this in real life, such as smiling or laughing. This is what the emote command is used for. ", <$format, ["np", [], [], 'do_np]>, "The emote command simply displays your name followed by whatever you typed, to everybody in the room. The command to use is either 'emote', or like say, it can also be abbreviated for convenience--this time to a colon (:). To try emote enter the following:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["emote smiles happily."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Keep in mind, an emote has no actual effect on your environment, so if you typed:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [":throws Neale out of the house."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "People would see:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " throws Neale out of the house."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "But Neale ", <$format, ["i", [], ["wouldn't"], 'do_i]>, " actually go anywhere. Nothing has happened in the Virtual Environment, except you might have made somebody angry. Emoting can be used to represent events that have not occurred, but this is generally not encouraged. A simple way of looking at it is you can emote anything about yourself, but if you intrusively involve others they may get annoyed."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Non-verbal Communication", "Non-verbal Communication"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177643;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_nonverbal];
var $root manager = $introtut_nonverbal;
var $root settings = #[["prev-topic", $introtut_speaking], ["next-topic", $introtut_remote], ["more-topic", $introtut_communication], ["map-position", 0], ["propagate", 0]];


