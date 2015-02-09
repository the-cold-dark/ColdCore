
new object $help_cmd_audit: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@audit", "@audit"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@audit <objref> [+f?ull]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays how much quota (in bytes) <objref> is using, how much it can use, and how much is remaining. With the +full option, @audit additionally displays the name, number of bytes, and location of each object that <objref> owns. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@audit Vampire +full\nObjects managed by Vampire ($vampire):      bytes Location\n  $vampire (Vampire)                        6,701 [The Pit]\n  $note_79 (UI_stuff)                         492 [Vampire]\n  $thing_265 (parser)                         406 [Vampire]\n  $help_cmd_addshortcut (@add-s?hortcut       414\nTotal usage: 27,885 bytes\nTotal quota: 75,000 bytes\nRemaining:   47,115 bytes\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870925742;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_audit];
var $root manager = $help_cmd_audit;


