
new object $help_places_realms: $help_build_places;

var $has_name name = ['prop, "Realms", "Realms"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Realms are used to group places, and can exist in a heirarchy structure. For instance, all rooms within a building would exist within one realm for that building, and that realm would exist within a realm for that sector of the city, which exists within a realm for the entire city. Realms are useful not only for grouping, but also for events and searching. When an event occurs it can be broadcast to the entire realm, rather than just to the local room. ", <$format, ["np", [], [], 'do_np]>, "New realms are created with the command ", <$format, ["link", [["node", "$help_cmd_spawn"]], ["@spawn"], 'do_link]>, ", such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@spawn $realm named the Clocktower"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When creating a realm make sure to create it from the right parent, so as to keep the heirarchy intact. For instance, the above realm might be better spawned from a realm for the city. ", <$format, ["np", [], [], 'do_np]>, "Realms keep track of all the rooms they contain. When room is created or destroyed, its realm is updated accordingly. You can change the room's realm using its :realm ", <$format, ["link", [["node", "$help_interface_settings"]], ["setting"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "Realms also keep track of realm properties. You can add your own realm property as you would add any other setting, but make sure that +get method is set to get_realm_setting (read ", <$format, ["link", [["node", "$help_cmd_defsetting"]], ["@def-setting"], 'do_link]>, " helpnode for information about this). Realm properties have special inheritance scheme: rooms inherit them from their realm, and realms inherit it from their parents. There are two default realm properties: propagate, which controls propagation mask from the parent realm, and weather-time, which sets the weather and time for the realm. ", <$format, ["np", [], [], 'do_np]>, "You can announce a message to all the players in a realm using realm_announce method on the realm object. Note that it will be propagated using the propagation masks."], #[['links, #[["@spawn", "$help_cmd_spawn"], ["setting", "$help_interface_settings"], ["@def-setting", "$help_cmd_defsetting"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@spawn", $help_cmd_spawn], ["setting", $help_interface_settings], ["@def-setting", $help_cmd_defsetting]];
var $help_node nolist = 0;
var $root created_on = 856037606;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_places_realms];
var $root manager = $help_places_realms;


