
new object $help_cmd_ant: $help_cmds;

var $has_name name = ['prop, "@ant|@add-name-template", "@ant|@add-name-template"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@ant|@add-name-template <template> [to] <target>"], 'do_tt]>, "` ", <$format, ["np", [], [], 'do_np]>, "Add the given name template to the target object. The template uses ", <$format, ["link", [["node", "$help_commands_matching"]], ["Template Matching"], 'do_link]>, ". If the template is redundant and conflicts with the current name, an error will be returned and the template will not be added. ", <$format, ["np", [], [], 'do_np]>, "The command ", <$format, ["link", [["node", "$help_cmd_rename"]], ["@rename"], 'do_link]>, " may also be used to specify the name templates. The section ", <$format, ["link", [["node", "$help_app_names"]], ["Names"], 'do_link]>, " explains more about names and name templates."], #[['this, $help_cmd_ant]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Template Matching", $help_commands_matching], ["@rename", $help_cmd_rename], ["Names", $help_app_names]];
var $root created_on = 856650064;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_ant];
var $root manager = $help_cmd_ant;


