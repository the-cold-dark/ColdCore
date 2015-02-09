
new object $help_cmd_teleport: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@teleport|@go", "@teleport|@go"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@teleport|@go <location>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command transports your user character to <location>, if it can pass through any locks and permission checks that are in place on the <location>.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_join"]], ["@join"], 'do_link]>], #[['links, #[["@join", "$help_cmd_join"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@join", $help_cmd_join]];
var $root created_on = 870650078;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_teleport];
var $root manager = $help_cmd_teleport;


