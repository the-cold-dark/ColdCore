
new object $help_cmd_audit: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@audit", "@audit"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@audit <object> +m?anages"], 'do_tt]>, <$format, ["br", [], [], 'do_br]>, "Syntax: ", <$format, ["tt", [], ["@audit <object> +w?rites"], 'do_tt]>, <$format, ["br", [], [], 'do_br]>, "Syntax: ", <$format, ["tt", [], ["@audit <object> +trusted-by"], 'do_tt]>, <$format, ["br", [], [], 'do_br]>, "Syntax: ", <$format, ["tt", [], ["@audit <object> +q?uota [+s?ummary]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Display a list of objects managed, writable or trusted by the given <object>. In the case of the +quota option, list a total byte usage for the <object>. If +summary is also specified, only a summary of the total used and allocated for <object> is displayed. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@audit Vampire +quota\nObjects managed by Vampire ($vampire):      bytes Location\n  $vampire (Vampire)                        6,701 [The Pit]\n  $note_79 (UI_stuff)                         492 [Vampire]\n  $thing_265 (parser)                         406 [Vampire]\n  $help_cmd_addshortcut (@add-s?hortcut       414\nTotal usage: 27,885 bytes\nTotal quota: 75,000 bytes\nRemaining:   47,115 bytes"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870925742;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_audit];
var $root manager = $help_cmd_audit;


