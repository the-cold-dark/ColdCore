
new object $help_cmd_boot: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@boot", "@boot"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@boot <objref> | <player>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@boot notifies the player or object specified that it is being returned to it's home, and does so if the player that invoked the command is allowed to do the action."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870563995;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_boot];
var $root manager = $help_cmd_boot;


