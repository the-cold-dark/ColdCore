
new object $help_cmd_remembered: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@remembered", "@remembered"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@remembered"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays the objects you ", <$format, ["link", [["node", "$help_cmd_remember"]], ["@remember"], 'do_link]>, " and the names that you have given them. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@remembered\nRemembered Items:\n  goofy is $user_gorren (Gorren)\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@remember", "$help_cmd_remember"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@remember", $help_cmd_remember]];
var $root created_on = 874198526;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_remembered];
var $root manager = $help_cmd_remembered;


