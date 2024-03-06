
new object $help_cmd_register_name: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@register|@unregister|@register-name|@unregister-name", "@register|@unregister|@register-name|@unregister-name"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@register <name>"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@unregister <name>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@register adds a name to the registration database that can optionally identify your character. @unregister removes a name from the database. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@register HelpGod\nRegistered alternate name \"HelpGod\".\nRegistered names: Vamp and Vampire, HelpGod.\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@unregister HelpGod\nUnregistered alternate name \"HelpGod\".\nRegistered names: Vamp and Vampire.\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_registered"]], ["@registered"], 'do_link]>, "."], #[['links, #[["@registered", "$help_cmd_registered"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@registered", $help_cmd_registered]];
var $root created_on = 878186871;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_register_name];
var $root manager = $help_cmd_register_name;


