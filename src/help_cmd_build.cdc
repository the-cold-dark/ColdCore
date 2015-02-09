
new object $help_cmd_build: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@build", "@build"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@build"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This is the interactive build command, which takes you step by step through the process of extending your VR surroundings. From creating a path to/from the new place, creating the place itself, setting the place's realm, and setting all of the descriptions for the place, and the ways to and from it. ", <$format, ["np", [], [], 'do_np]>, "To use this command simply go to the place you wish to extend, and type ", <$format, ["tt", [], ["@build"], 'do_tt]>, ". It will prompt you for all of the information to build another place connected to your current location."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870664087;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_build];
var $root manager = $help_cmd_build;


