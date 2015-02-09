
new object $help_coldcore: $help_node;

var $has_name name = ['prop, "Cold Help System", "Cold Help System"];
var $help_node body = <$ctext_frob, [[<$format, ["img", [["plain", <$format, ["quote", [], ["\n        ___     _    _   _  _     _        ___         _\n       / __|___| |__| | | || |___| |_ __  / __|_  _ __| |_ ___ _ __\n      | (__/ _ \ / _` | | __ / -_) | '_ \ \__ \ || (_-<  _/ -_) '  \ \n       \___\___/_\__,_| |_||_\___|_| .__/ |___/\_, /__/\__\___|_|_|_|\n                                   |_|         |__/\n"], 'do_quote]>], ["src", "http://www.cold.org/coldcore/cold-help.jpg"]], [], 'do_img]>, <$format, ["p", [], [], 'do_p]>, "Welcome to ", <$generator, ["servname", [], [], 'gen_servname]>, ". This is a hypertext help system. If you are on an interactive login you can type ", <$format, ["tt", [], ["@help help"], 'do_tt]>, " for help on how to use this help system. Following is a list of Launch Points to the help system:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help"]], ["Help"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["How to use this help system"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_general"]], ["General"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["General Information"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_building"]], ["Building"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Extending your Environment"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_prog"]], ["Programming"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Topics about programming"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_admin"]], ["Administration"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["ColdCore Administration"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_reference"]], ["Reference"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Core Reference Information"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_updates"]], ["Updates"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["ChangeLog for this system"], 'do_dd]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_administrators"]], ["Administrators"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["List of Administrators and Roles"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_credit"]], ["Credit"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Credit and Copyright Information"], 'do_dd]>], 'do_dl]>], #[['links, #[["Help", "$help_help"], ["General", "$help_general"], ["Building", "$help_building"], ["Programming", "$help_prog"], ["Administration", "$help_admin"], ["Reference", "$help_reference"], ["Updates", "$help_updates"], ["Administrators", "$help_administrators"], ["Credit", "$help_credit"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_core;
var $help_node links = #[["Help", $help_help], ["General", $help_general], ["Building", $help_building], ["Programming", $help_prog], ["Administration", $help_admin], ["Reference", $help_reference], ["Updates", $help_updates], ["Administrators", $help_administrators], ["Credit", $help_credit]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_coldcore];
var $root manager = $help_coldcore;


