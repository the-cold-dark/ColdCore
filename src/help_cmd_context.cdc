
new object $help_cmd_context: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@context", "@context"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@context"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays your environmental contexts. The server records the last object you named, as well as all of the last objects you named (with a gender).", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_environment"]], ["Environment"], 'do_link]>, " ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@context\nLast thing: Generic User Object\nLast it:    Generic User Object\nLast her:   Squeak the lemming\nLast him:   Brad\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["Environment", "$help_environment"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Environment", $help_environment]];
var $root created_on = 870925820;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_context];
var $root manager = $help_cmd_context;


