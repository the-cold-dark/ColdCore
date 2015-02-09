
new object $help_cmd_attach: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@attach", "@attach"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@attach <place1> to <place2>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command attaches an exit from <place1> to <place2>. It will prompt for the name of the exit, and a description for the exit.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_build"]], ["@build"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_places_paths"]], ["Exits and Entrances"], 'do_link]>], #[['links, #[["@build", "$help_cmd_build"], ["Exits and Entrances", "$help_places_paths"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@build", $help_cmd_build], ["Exits and Entrances", $help_places_paths]];
var $root created_on = 870659823;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_attach];
var $root manager = $help_cmd_attach;


