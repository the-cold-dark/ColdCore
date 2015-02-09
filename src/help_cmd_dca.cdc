
new object $help_cmd_dca: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-command-a?lias|@dca?lias", "@del-command-a?lias|@dca?lias"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@del-command-a?lias|@dca?lias <alias>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command deletes an alias previously created with ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@del-command-alias \"poof %1\"\nDeleted command alias \"poof %1\"."], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_ca"]], ["@command-aliases"], 'do_link]>], #[['links, #[["@add-command-alias", "$help_cmd_aca"], ["@command-aliases", "$help_cmd_ca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-command-alias", $help_cmd_aca], ["@command-aliases", $help_cmd_ca]];
var $root created_on = 874972098;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_dca];
var $root manager = $help_cmd_dca;


