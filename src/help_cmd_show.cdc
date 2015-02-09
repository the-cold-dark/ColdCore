
new object $help_cmd_show: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@show", "@show"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@show <objref> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@show displays an object's methods and variables, as long as you are either the owner, are trusted by the object, or the object is set visible. To see the contents of the methods, you will need to use ", <$format, ["link", [["node", "$help_cmd_list"]], ["@list"], 'do_link]>, " You can optionally have @show list all the public methods you have defined on an object, or all the variables, and which object defines them as below. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@show me.\nObject:  $vampire [6,146 bytes]\nParents: $admin, $antisocial\nPublic methods matching \"*\":\n  .pulse()\n  .startup()\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@show me,\nObject:  $vampire [6,146 bytes]\nParents: $admin, $antisocial\n$root variables matching \"*\":\n  manager: $vampire\n  managed: [$vampire]\n  inited: 1\n  writes: []\n$user variables matching \"*\":\n  task_connections: #[[54965, $login_connection_23564]]\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["np", [], [], 'do_np]>, "Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+c?hop"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Chops lines longer than the players cols ", <$format, ["link", [["node", "$help_interface_settings"]], ["setting"], 'do_link]>, "."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["@list", "$help_cmd_list"], ["setting", "$help_interface_settings"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@list", $help_cmd_list], ["setting", $help_interface_settings]];
var $help_node nolist = 0;
var $root created_on = 869285903;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_show];
var $root manager = $help_cmd_show;


