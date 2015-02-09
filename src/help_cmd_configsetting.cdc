
new object $help_cmd_configsetting: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@config-setting|@configure-setting", "@config-setting|@configure-setting"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@config-set?ting|@configure-set?ting <definer>:<setting>[=default] [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command displays how settings are currently setup, and can modify the options that were set when the setting was created with ", <$format, ["link", [["node", "$help_cmd_defsetting"]], ["@def-setting"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@config-set me:rl-email\nReconfigured setting $user_info:rl-email as:\n    +get=get_user_info\n    +set=set_user_info\n    +clear=clear_user_info\n    +format=format_user_info\n    +access=public_user_info\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The complete list of options and their definitions can be found by looking at the ", <$format, ["link", [["node", "$help_cmd_defsetting"]], ["@def-setting"], 'do_link]>, " help page."], #[['links, #[["@def-setting", "$help_cmd_defsetting"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@def-setting", $help_cmd_defsetting]];
var $root created_on = 870647269;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_configsetting];
var $root manager = $help_cmd_configsetting;


