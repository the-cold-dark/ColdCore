
new object $help_cmd_display: $help_cmds;

var $has_name name = ['prop, "@display", "@display"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@d?isplay <objref> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Shows general information about an object, including it's size, owner, parents, location, and what permissions it has. You can optionally have it list all the public methods you have defined on an object, or all the variables, and which object defines them as below. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@display $vampire\nObject:   $vampire (Vampire)\nCreated:  Mon Jan 13 18:19:17 1997\nQuota:    75000 bytes\nPerms:\nSize:     6,132 bytes (on disk)\nManager:  $vampire (Vampire)\nWriters:  (none)\nParents:  $admin (Generic Admin) and $antisocial\nLocation: $the_pit (The Pit)\n---"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@display $vampire,\nObject Variables matching \"*\"\n  ,test_dict: #[]\n  ,test: 0\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@display $vampire.\nPublic Methods matching \"*\":\n ----   34 .edit_cmd(cmdstr, com, args)\n ----   14 .quit_editor()\n ----   49 .pulse()\n ----   24 .startup()\n ----    8 .dict_test(cmdstr, cmd, @str)\n ----   51 .tmp_pulse()\n"], 'do_quote]>], 'do_dfn]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+c?hop"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Chops lines longer than the players cols ", <$format, ["link", [["node", "$help_interface_settings"]], ["setting"], 'do_link]>, "."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+g?enerations"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Sets which object to go back from."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["setting", "$help_interface_settings"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["setting", $help_interface_settings]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_display];
var $root manager = $help_cmd_display;


