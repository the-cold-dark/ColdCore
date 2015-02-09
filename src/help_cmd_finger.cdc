
new object $help_cmd_finger: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@finger|@ustat", "@finger|@ustat"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@finger|@ustat <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Provides general information about the <objref> such as name, ", <$format, ["link", [["node", "$help_cmd_age"]], ["age"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_audit"]], ["quota"], 'do_link]>, ", and for users, it additionally lists general user information, and information about any connections it is currently using. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@finger Vampire\nInformation on Vampire (use @set to change):\n  Vampire was created on Monday January 13 1997\n  He is 6 months, 19 days, 18 hours, 40 minutes and 4 seconds old.\n  He has logged 4 months, 17 days, 22 hours, 7 minutes and 33 seconds online.\n  Quota:\n    Total:     75,000\n    Used:      28,983\n    Remaining: 46,017\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["age", "$help_cmd_age"], ["quota", "$help_cmd_audit"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["age", $help_cmd_age], ["quota", $help_cmd_audit]];
var $root created_on = 870926022;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_finger];
var $root manager = $help_cmd_finger;


