
new object $help_interaction: $help_general;

var $has_name name = ['prop, "Interaction", "Interaction"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The following common interaction commands exist:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_say"]], ["say"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Speak and talk to others"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_emote"]], ["emote"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Do free-form actions"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_tosay"]], ["to"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Direct messages to people in the room"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_whisper"]], ["whisper"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Privately talk to somebody"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_think"]], ["think"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Thinks something out loud"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_spoof"]], ["spoof"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Similar to eval, but formatted differently"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_page"]], ["@page"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Talk to somebody not in the room"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_paste"]], ["@paste"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Paste a block of text to people"], 'do_dd]>, <$format, ["br", [], [], 'do_br]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cmd_shortcuts"]], ["shortcuts"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Additional unnamed interaction shortcuts"], 'do_dd]>], 'do_dl]>], #[['this, $help_interaction]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["say", $help_cmd_say], ["emote", $help_cmd_emote], ["to", $help_cmd_tosay], ["whisper", $help_cmd_whisper], ["think", $help_cmd_think], ["spoof", $help_cmd_spoof], ["@page", $help_cmd_page], ["@paste", $help_cmd_paste], ["shortcuts", $help_cmd_shortcuts]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_interaction];
var $root manager = $help_interaction;


