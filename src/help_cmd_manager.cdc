
new object $help_cmd_manager: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@manager", "@manager"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: '", <$format, ["tt", [], ["@manager [object]"], 'do_tt]>, "' ", <$format, ["np", [], [], 'do_np]>, "Show the object's manager. The default object is the one in context."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926068;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_manager];
var $root manager = $help_cmd_manager;


