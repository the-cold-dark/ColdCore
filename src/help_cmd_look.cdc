
new object $help_cmd_look: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "look|examine", "look|examine"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["look|examine <location | object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command displays your current surroundings including the description and contents of the location; or the description and contents of the object you are looking at."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926567;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_look];
var $root manager = $help_cmd_look;


