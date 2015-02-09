
new object $help_cmd_forget: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@forget", "@forget"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@forget <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This is the opposite of the ", <$format, ["link", [["node", "$help_cmd_remember"]], ["@remember"], 'do_link]>, " command. This allows you to selectively forget things that you have aliased to easier to remember names.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_remembered"]], ["@remembered"], 'do_link]>], #[['links, #[["@remember", "$help_cmd_remember"], ["@remembered", "$help_cmd_remembered"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@remember", $help_cmd_remember], ["@remembered", $help_cmd_remembered]];
var $root created_on = 874199317;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_forget];
var $root manager = $help_cmd_forget;


