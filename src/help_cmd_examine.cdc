
new object $help_cmd_examine: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@examine", "@examine"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@ex?amine [+c?hop]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays an overview of information about the object, such as the name, manager, parents, location, and description. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@examine Vampire\nObject (@rename):    Vampire ($vampire)\nTemplates (@ant):    none\nCreated:             Mon Jan 13 18:19:17 1997\nQuota:               75,000 bytes\nSize:                6,710 bytes (on disk)\nPerms (@chmod):\nManager (@chmanage): Vampire ($vampire)\nWriters (@aw/@dw):   (none)\nTrusted (@at/@dt):   (none)\nParents (@ap/@dp):   $admin and $antisocial\nLocation (@move):    $the_pit (The Pit)\nDescription (@describe):\nAn insane, poorly spelling creature.\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+c?hop"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Chops lines longer than the players cols ", <$format, ["link", [["node", "$help_interface_settings"]], ["setting"], 'do_link]>, "."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["setting", "$help_interface_settings"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["setting", $help_interface_settings]];
var $root created_on = 870926002;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_examine];
var $root manager = $help_cmd_examine;


