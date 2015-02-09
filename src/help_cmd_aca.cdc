
new object $help_cmd_aca: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-command-a?lias|@aca?lias", "@add-command-a?lias|@aca?lias"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-command-a?lias|@aca?lias \"<alias>\" [to] \"<command>\""], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@aca allows you to alias one command to another name. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@aca \"poof %1\" to \"pub %1\"\nNew command alias \"poof %1\" => \"pub %1\" added.\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The new alias 'poof %1' will now allow you to talk on the public channel (to which 'pub %1' points to) as such: ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">poof hello all!\n<Public> Vampire: hello all!\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_dca"]], ["@dca?lias"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_ca"]], ["@ca?liases"], 'do_link]>], #[['links, #[["@dca?lias", "$help_cmd_dca"], ["@ca?liases", "$help_cmd_ca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@dca?lias", $help_cmd_dca], ["@ca?liases", $help_cmd_ca]];
var $root created_on = 874972060;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_aca];
var $root manager = $help_cmd_aca;


