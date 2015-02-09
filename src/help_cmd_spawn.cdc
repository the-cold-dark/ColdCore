
new object $help_cmd_spawn: $help_cmds;

var $has_name name = ['prop, "@spawn", "@spawn"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@spawn <parent>[named <name>]"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "Create a new object with the given parent, and optionally set the name. This command is generally used only by programmers, as it always creates a real object and does not create a frob instance, and it will create any type of object, not just a VR object. In general the command ", <$format, ["link", [["node", "$help_cmd_new"]], ["@new"], 'do_link]>, " is used instead."], #[['links, #[["@new", "$help_cmd_new"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@new", $help_cmd_new]];
var $root created_on = 856034653;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_spawn];
var $root manager = $help_cmd_spawn;


