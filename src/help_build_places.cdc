
new object $help_build_places: $help_building;

var $has_name name = ['prop, "Places", "Places"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A Location is simply anywhere in the Virtual Environment that another object can reside. Locations can also be located themselves, such as a box which can hold something and also be located in a location. ", <$format, ["np", [], [], 'do_np]>, "A Place is a type of location, which define additional information about themselves. Places are generally not located themselves, such as a room in a building, or a sidewalk outside of the building. Places additionally define ", <$format, ["link", [["node", "$help_places_paths"]], ["Pathways"], 'do_link]>, " to other Places, ", <$format, ["link", [["node", "$help_places_realms"]], ["Realms"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_places_env"]], ["Environment Conditions"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "See Also: ", <$format, ["link", [["node", "$help_places_realms"]], ["Realms"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_paths"]], ["Pathways"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_env"]], ["Environment Conditions"], 'do_link]>, "."], #[['links, #[["Pathways", "$help_places_paths"], ["Realms", "$help_places_realms"], ["Environment Conditions", "$help_places_env"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Pathways", $help_places_paths], ["Realms", $help_places_realms], ["Environment Conditions", $help_places_env]];
var $help_node nolist = 0;
var $root created_on = 855981673;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_build_places];
var $root manager = $help_build_places;


