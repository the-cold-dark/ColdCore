
new object $help_cmd_rename: $help_cmds;

var $has_name name = ['prop, "@rename", "@rename"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@rename <target> [to] \"<newname>\""], 'do_tt]>, "` ", <$format, ["np", [], [], 'do_np]>, "Used to change the ", <$format, ["i", [], ["target"], 'do_i]>, " object's name or object name. Quotes may be used, but are not required. ", <$format, ["link", [["node", "$help_app_names"]], ["Name templates"], 'do_link]>, " may also be specified with the new name, by separating them from the name with commas, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@rename exit to Gilded Door, w?est, o?ut"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Keep in mind that the name is matched using the beginning of each word, where the templates are mached with ", <$format, ["link", [["node", "$help_commands_matching"]], ["Template Matching"], 'do_link]>, ". Name templates can also be changed with the commands ", <$format, ["link", [["node", "$help_cmd_ant"]], ["@add-name-template"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_cmd_dnt"]], ["@del-name-template"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "The object name can also be changed, by specifying a valid object name as the new name, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@rename $thing_152 to $my_lamp"], 'do_dfn]>], #[['this, $help_cmd_rename]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Name templates", $help_app_names], ["Template Matching", $help_commands_matching], ["@add-name-template", $help_cmd_ant], ["@del-name-template", $help_cmd_dnt]];
var $root created_on = 856649394;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_rename];
var $root manager = $help_cmd_rename;


