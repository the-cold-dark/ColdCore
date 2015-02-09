
new object $introtut_names: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Every object in your Virtual Environment has a name. When you see an object listed as the contents of a location, you are seeing its name. You can change the name of any object you manage with the command '", <$format, ["link", [["node", "$help_cmd_rename"]], ["@rename"], 'do_link]>, "'. ", <$format, ["np", [], [], 'do_np]>, "Names can include any number of words, such as 'a blue sock'. When you refer to an object with its name, you can use any or all of the words in the name to refer to the object. You should use as much of the name as you can, to make a correct match. You can always leave off the article--or use it, if it makes it easier. For instance, to look at the blue sock, you could type any of the following:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> look at sock", <$format, ["br", [], [], 'do_br]>, "> look at soc", <$format, ["br", [], [], 'do_br]>, "> look at blue sock", <$format, ["br", [], [], 'do_br]>, "> look at bl", <$format, ["br", [], [], 'do_br]>, "> look at the blue sock"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "More information is available on Names and Name Templates (aliases)."], #[['links, #[["@rename", "$help_cmd_rename"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Object Names", "Object Names"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874465166;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_names];
var $root manager = $introtut_names;
var $root settings = #[["prev-topic", $introtut_objs], ["next-topic", $introtut_env], ["more-topic", $introtut_names_tmpl], ["map-position", 0], ["propagate", 0]];


