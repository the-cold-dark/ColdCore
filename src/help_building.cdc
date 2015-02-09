
new object $help_building: $help_coldcore;

var $has_name name = ['prop, "Building", "Building"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Building in ColdCore is considered anything from describing yourself or an object you carry, to designing and creating full areas.", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_theme"]], ["Theme"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["The VR Theme"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_cml"]], ["Dynamic Text"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["The Cold text Markup Language"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_build_places"]], ["Places"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["How Places work"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_sys_message"]], ["Messages"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Dynamic Messages"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_building_commands"]], ["Commands"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Overview of Building Commands"], 'do_dd]>], 'do_dl]>], #[['links, #[["Theme", "$help_theme"], ["Dynamic Text", "$help_cml"], ["Places", "$help_build_places"], ["Messages", "$help_sys_message"], ["Commands", "$help_building_commands"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Theme", $help_theme], ["Dynamic Text", $help_cml], ["Places", $help_build_places], ["Messages", $help_sys_message], ["Commands", $help_building_commands]];
var $help_node nolist = 0;
var $root created_on = 847060847;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_building];
var $root manager = $help_building;


