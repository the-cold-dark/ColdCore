
new object $help_cmd_managed: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@managed", "@managed"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: '", <$format, ["tt", [], ["@managed [object]"], 'do_tt]>, "' ", <$format, ["np", [], [], 'do_np]>, "Lists all the objects managed by the argument."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926041;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_managed];
var $root manager = $help_cmd_managed;


