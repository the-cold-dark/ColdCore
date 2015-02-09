
new object $help_commands_types: $help_commands;

var $has_name name = ['prop, "Types", "Types"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Each command is associated with a specific method. When a command match is found, that method is executed with arguments depending upon what you typed. The Cold Dark recognizes three types of commands:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["b", [], ["Local Commands"], 'do_b]>], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "Local commands are any non-directed command, or any command which does not require a target in the command template. Matching for local commands uses ColdC template matching. The parser looks for local commands on the user, the user's ancestry, and the user's location (but not anything the user is carrying or in the user's location).", <$format, ["p", [], [], 'do_p]>], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], ["Remote Commands"], 'do_b]>], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "Remote commands differ from Local Commands in that they require the target of the command, in the command string. For instance, \"get button\" would be a remote command, because it requires the target of button to function correctly. Matching for Remote Commands uses ColdC template matching", <$format, ["p", [], [], 'do_p]>], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], ["Shortcuts"], 'do_b]>], 'do_dt]>, <$format, ["dd", [], [<$format, ["p", [], [], 'do_p]>, "Shortcuts are intented as wrap-arounds for commands, using ColdC pattern matching instead of template matching."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 810075676;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_commands_types];
var $root manager = $help_commands_types;


