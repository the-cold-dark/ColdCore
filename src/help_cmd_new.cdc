
new object $help_cmd_new: $help_cmds;

var $has_name name = ['prop, "@new", "@new"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@new <parent> [named <name>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Creates a new VR object with the given parent, and optionally set the name. This command is preferred when working with VR objects, as it will correctly handle both real and ", <$format, ["link", [["node", "$help_coldc_types_frobs"]], ["Frob"], 'do_link]>, " instances. The alternative is ", <$format, ["link", [["node", "$help_cmd_spawn"]], ["@spawn"], 'do_link]>, " which will always create new objects. If you want to create a new non-VR object, use @spawn or call the parent's .new() method.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_destroy"]], ["@destroy"], 'do_link]>], #[['links, #[["Frob", "$help_coldc_types_frobs"], ["@spawn", "$help_cmd_spawn"], ["@destroy", "$help_cmd_destroy"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Frob", $help_coldc_types_frobs], ["@spawn", $help_cmd_spawn], ["@destroy", $help_cmd_destroy]];
var $root created_on = 856032830;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_new];
var $root manager = $help_cmd_new;


