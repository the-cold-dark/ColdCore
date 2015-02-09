
new object $help_cmd_realms: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@realms", "@realms"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@realm?s"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command displays all the names of the known realms on the server.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_places_realms"]], ["Realms"], 'do_link]>], #[['links, #[["Realms", "$help_places_realms"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Realms", $help_places_realms]];
var $root created_on = 870660092;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_realms];
var $root manager = $help_cmd_realms;


