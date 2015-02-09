
new object $help_settings: $help_interface;

var $has_name name = ['prop, "Settings", "Settings"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "There are many configurable settings available for you to use in customizing your environment. The command ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_set"]], ["@set"], 'do_link]>], 'do_tt]>, " is used to make these changes. If you type ", <$format, ["tt", [], ["@set"], 'do_tt]>, " with no arguments it will list all of your current settings. To change a setting you simply type ", <$format, ["tt", [], ["@set"], 'do_tt]>, " followed by the setting name, an equals sign and the new value. If the value does not conform to the setting requirements you will be notified appropriately. For example, the following will turn on the capability to receive variable termination on messages (i.e. you can recieve text prompts that are not terminated with newlines):", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set non-terminated-tell=on"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "There may also exist ", <$format, ["i", [], ["user-info"], 'do_i]>, " settings. These define Real-Life aspects of you. They work slightly different. By default all user-info settings are private, and may not be seen by anybody else unless you include ", <$format, ["tt", [], ["+public"], 'do_tt]>, " at the beginning of the setting, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set real-name=+public Brandon Gilespie"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Read about the ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_set"]], ["@set"], 'do_link]>], 'do_tt]>, " command for more information."], #[['this, $help_settings]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@set", $help_cmd_set]];
var $help_node nolist = 0;
var $root created_on = 847664220;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_settings];
var $root manager = $help_settings;


