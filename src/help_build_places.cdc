
new object $help_build_places: $help_building;

var $has_name name = ['prop, "Places", "Places"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Places are a form of location in the Virtual Environment. Locations are the key factor of a Virtual Reality--everything must exist somewhere. It is possible for a location to be a location itself, such as a box which can hold something and also be located in a room or on a patio. ", <$format, ["np", [], [], 'do_np]>, "Places have more information than the rudimentary Location. They are generally not located Locations, but instead represent a physical area in the Virtual Environment, such as a room in a building or a sidewalk outside of a building. They also define ", <$format, ["link", [["node", "$help_places_paths"]], ["Pathways"], 'do_link]>, " to other Places, ", <$format, ["link", [["node", "$help_places_realms"]], ["Realms"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_places_env"]], ["environment conditions"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "Realms are a form of meta-place. Multiple places can be grouped into a single realm. Realms can be defined hierarchically, so you can have a building in a realm which is a district of a city, which is in the city's realm, which is in the country's realm, and so forth. The realm defines broad aspects of the Virtual Environment, such as ", <$format, ["link", [["node", "$help_places_env"]], ["Permissions"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_places_env"]], ["Environmental Conditions"], 'do_link]>, " like ", <$format, ["link", [["node", "$help_weather_system"]], ["Weather"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, " See Also: ", <$format, ["link", [["node", "$help_places_realms"]], ["Realms"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_paths"]], ["Pathways"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_env"]], ["Environmental Conditions"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_env"]], ["Permissions"], 'do_link]>], #[['links, #[["Pathways", "$help_places_paths"], ["Realms", "$help_places_realms"], ["environment conditions", "$help_places_env"], ["Permissions", "$help_places_env"], ["Environmental Conditions", "$help_places_env"], ["Weather", "$help_weather_system"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Pathways", $help_places_paths], ["Realms", $help_places_realms], ["environment conditions", $help_places_env], ["Permissions", $help_places_env], ["Environmental Conditions", $help_places_env], ["Weather", $help_weather_system]];
var $help_node nolist = 0;
var $root created_on = 855981673;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_build_places];
var $root manager = $help_build_places;


