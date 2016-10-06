
new object $help_parser_command_modules: $help_sys_parser;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Command Modules", "Command Modules"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Command Modules are a mechanism for extending command sets without adding new objects to a user's command hierarchy. Command Module objects must be a child of $user_interfaces. Commands on a Command Module must use sender() instead of this() to reference the user (as remote commands do). ", <$format, ["np", [], [], 'do_np]>, "To add a Command Module, type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set command-modules=+$command_module"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Where ", <$format, ["tt", [], ["$command_module"], 'do_tt]>, " is the Object Name of the Command Module you are adding. You remove Command Modules in a similar manner, using the dash (", <$format, ["tt", [], ["-"], 'do_tt]>, ") character instead of the plus (", <$format, ["tt", [], ["+"], 'do_tt]>, ") character."], #[]]>;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $root created_on = 889587644;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_parser_command_modules];
var $root manager = $help_parser_command_modules;


