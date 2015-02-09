
new object $help_cmd_dig: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@dig", "@dig"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@dig <place>"], 'do_tt]>, <$format, ["br", [], [], 'do_br]>, "Syntax: ", <$format, ["tt", [], ["@dig <leaving way>[|<arriving way>] to <place>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The first form of this command creates a new place, with the name being whatever you specify for <place>. The object name for the new place will be displayed, for easy reference later. ", <$format, ["np", [], [], 'do_np]>, "The second form of the command works the same as the first, but also allows you to define a path and attach leaving and arriving ways for the path, at the same time the place is created. This path will be linked from your current location to the new place. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@dig north|south to Hallway"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This will create a new place named ", <$format, ["tt", [], ["\"Hallway\""], 'do_tt]>, " and will build a path with ", <$format, ["tt", [], ["\"north\""], 'do_tt]>, " going from the current location to the Hallway (e.g. leaving), and ", <$format, ["tt", [], ["\"south\""], 'do_tt]>, " going from the Hallway to the current location (e.g. arriving). ", <$format, ["np", [], [], 'do_np]>, "See also: ", <$format, ["link", [["node", "$help_cmd_attach"]], ["@attach"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_build"]], ["@build"], 'do_link]>], #[['links, #[["@attach", "$help_cmd_attach"], ["@build", "$help_cmd_build"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@attach", $help_cmd_attach], ["@build", $help_cmd_build]];
var $root created_on = 870664099;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_dig];
var $root manager = $help_cmd_dig;


