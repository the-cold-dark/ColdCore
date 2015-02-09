
new object $help_cmd_registered: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@registered", "@registered"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@registered"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Shows all names currently registered by your character. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@registered\nRegistered names: Vamp and Vampire.\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_register_name"]], ["@register|@unregister"], 'do_link]>, "."], #[['links, #[["@register|@unregister", "$help_cmd_register_name"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@register|@unregister", $help_cmd_register_name]];
var $root created_on = 878186815;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_registered];
var $root manager = $help_cmd_registered;


