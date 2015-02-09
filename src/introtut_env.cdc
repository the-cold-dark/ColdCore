
new object $introtut_env: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Up to now you may have seen a few references to the Virtual Environment. This is a generic term applied to everything which exists in the same virtual location as you, including the location itself. When you want to look at something, it has to exist in your environment first (i.e. it has to be in the same place you are). ", <$format, ["np", [], [], 'do_np]>, "For instance, if you were in a place named The Courtyard, and in The Courtyard was a friend, a box and a bench--your environment would consist of The Courtyard, your friend, a box, a bench and yourself. ", <$format, ["np", [], [], 'do_np]>, "To learn more about your environment, type 'more'. Or, for later reference, you can get more information on your environment in the ", <$format, ["link", [["node", "$help_environment"]], ["Environment"], 'do_link]>, " help document."], #[['links, #[["Environment", "$help_environment"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Your Environment", "Your Environment"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874260896;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_env];
var $root manager = $introtut_env;
var $root settings = #[["prev-topic", $introtut_names], ["next-topic", $introtut_look], ["more-topic", $introtut_objs_env], ["map-position", 0], ["propagate", 0]];


