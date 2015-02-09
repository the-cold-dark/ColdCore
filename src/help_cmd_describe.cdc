
new object $help_cmd_describe: $help_cmds;

var $has_name name = ['prop, "@describe", "@describe"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@desc?ribe|@prose <what> [as <description>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Sets the description (prose) for an object. If nothing other than the target object is given on the command line, you will be prompted for the description. Otherwise it will take anything after the preposition '", <$format, ["i", [], ["as"], 'do_i]>, "' as the description. ", <$format, ["np", [], [], 'do_np]>, "The description is not written in plaintext, but is in ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, ". Because of this, all plaintext formatting you include will be disregarded. Use CML tags for any desired formatting. ", <$format, ["np", [], [], 'do_np]>, "Note: This will overwrite the current description. To edit the description on the object, use the ", <$format, ["link", [["node", "$help_cmd_edit"]], ["@edit"], 'do_link]>, " command."], #[['links, #[["CML", "$help_cml"], ["@edit", "$help_cmd_edit"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["CML", $help_cml], ["@edit", $help_cmd_edit]];
var $root created_on = 856029245;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_describe];
var $root manager = $help_cmd_describe;


