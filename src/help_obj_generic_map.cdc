
new object $help_obj_generic_map: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Generic Map", "Generic Map"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Generic map is a simple note that contains a map of the room and its surroundings. While it can be described, it's not strictly necessary, you only need to edit the note's text for the desired effect. The map may be both wider and taller than the screen; in that case, only a part of the map will be displayed. The window to be displayed is configurable. ", <$format, ["subj", [["level", "3"]], ["Tracking the location"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "You can embed pairs of numbers (example: ", <$format, ["tt", [], ["'00'"], 'do_tt]>, ") within the map. All such pairs will be replaced with spaces once the map is printed to the player, except the one that corresponds to the current location. To display that, set map-position on the current room. The map position specifies the window (the upper left corner of the part of the map you want to display), tag (the room tag that will be shown) and the generic map object that is used with the current room. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @set here:map-position=window 0, 0 tag 04 on $map_of_taobh_thiar"], 'do_dfn]>, " This sets the map of the current room to the $map_of_taobh_thiar; its tag to 04. Window (0,0) makes @map display the entire map. Finally, the portion of the $map_of_taobh_thiar for this room looks like:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["\n                        \                   |     /     \ \n   Steam Tunnel 03    Steam Tunnel 04 Steam Tunnel 07   |\n                          \            /                |\n\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@map in the Steam Tunnel will replace 04 with **, 03 and 07 will vanish from the map."], #[]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $root created_on = 874066987;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_generic_map];
var $root manager = $help_obj_generic_map;


