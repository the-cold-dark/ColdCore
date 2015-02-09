
new object $help_places_paths: $help_build_places;

var $has_name name = ['prop, "Pathways|paths|exits|entrances", "Pathways|paths|exits|entrances"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Paths connect ", <$format, ["link", [["node", "$help_build_places"]], ["places"], 'do_link]>, " to each other. A path can have one or more ways, but usually only have two ways (i.e. down the path and up the path). When you build a place you have the option to specify the exit, or in other words, one way for the path. You can use either the command ", <$format, ["link", [["node", "$help_cmd_build"]], ["@build"], 'do_link]>, ", or the command ", <$format, ["link", [["node", "$help_cmd_dig"]], ["@dig"], 'do_link]>, ", depending upon if you want an interactive or passive user interface. ", <$format, ["np", [], [], 'do_np]>, "Before you can link paths from a place you have to be able to build from it. For more information in this regard, see the section ", <$format, ["link", [["node", "$help_places_perms"]], ["Building Permissions"], 'do_link]>, ". You can create a place disconnected from the rest of the Virtual Environment with the command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@dig My New Room"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Which will create a new place with the name ", <$format, ["tt", [], ["\"My New Room\""], 'do_tt]>, ", which is in the realm of Creation (no realm)."], #[['links, #[["places", "$help_build_places"], ["@build", "$help_cmd_build"], ["@dig", "$help_cmd_dig"], ["Building Permissions", "$help_places_perms"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["places", $help_build_places], ["@build", $help_cmd_build], ["@dig", $help_cmd_dig], ["Building Permissions", $help_places_perms]];
var $help_node nolist = 0;
var $root created_on = 856037607;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_places_paths];
var $root manager = $help_places_paths;


