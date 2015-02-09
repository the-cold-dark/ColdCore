
new object $help_cmd_monitor: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@monitor", "@monitor"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@monitor [on | off]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command turns on and off monitoring of actions, and spoofs. If you have monitoring turned on, you can see what, if anything has been spoofed, by simply doing @monitor without any arguments. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["ind", "3"]], [<$format, ["quote", [], [">@monitor\n$user_bruce (Bruce)  $courtyard.announce() line 9   Bruce says, \"it does...\n$vampire (Vampire)   $courtyard.announce() line 9   Vampire says, \"bah\"\n$vampire (Vampire)   $courtyard.announce() line 9   Vampire doesn't like...\n0                    $courtyard.announce() line 9   <$message_frob, #[[\"gene...\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926114;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_monitor];
var $root manager = $help_cmd_monitor;


