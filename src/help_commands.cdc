
new object $help_commands: $help_general;

var $has_name name = ['prop, "Commands", "Commands"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "This section outlines some of the basics of commands, from understanding the logic behind why they are named what they are, to using them, to programming them. (Programmer's note: Commands in the Cold Dark are handled entirely in the database, the driver is oblivious to the intent or meaning of what it is you type).", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_commands_vr"]], ["VR vs Non-VR"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["The difference between the two"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_commands_types"]], ["Types"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Local, remote, shortcuts and aliases"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_commands_matching"]], ["Matching"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Conventions used in matching commands"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_commands_enhanced"]], ["Enhanced"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["ColdCore's Enhanced Commands"], 'do_dd]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_index_cmds"]], ["All Commands"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["An index of all commands"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_prog_commands"]], ["Programming"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Programming Commands"], 'do_dd]>], 'do_dl]>], #[['links, #[["VR vs Non-VR", "$help_commands_vr"], ["Types", "$help_commands_types"], ["Matching", "$help_commands_matching"], ["Enhanced", "$help_commands_enhanced"], ["All Commands", "$help_index_cmds"], ["Programming", "$help_prog_commands"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["VR vs Non-VR", $help_commands_vr], ["Types", $help_commands_types], ["Matching", $help_commands_matching], ["Enhanced", $help_commands_enhanced], ["All Commands", $help_index_cmds], ["Programming", $help_prog_commands]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_commands];
var $root manager = $help_commands;


