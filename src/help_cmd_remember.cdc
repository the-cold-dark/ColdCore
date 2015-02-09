
new object $help_cmd_remember: $help_cmds;

var $has_name name = ['prop, "@remember", "@remember"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@remember <item> as <what>"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["np", [], [], 'do_np]>, "Using this command you can alias something which is either hard to type or hard to remember, so that later you can reference it with the new alias you set to it, rather than it's full name. Remembered items do not have to be in the environment for them to be matched. This is also useful, as you do not need to remember full object names. An example would be:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@remember $robot_1512 as fred"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If you do this, you will be able to reference ", <$format, ["tt", [], ["$robot_1512"], 'do_tt]>, " as ", <$format, ["tt", [], ["fred"], 'do_tt]>, ", even if it is not in your environment. This can potentially cause conflicts, as anything remembered is given priority over anything in your environment.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_remembered"]], ["@remembered"], 'do_link]>], #[['links, #[["@remembered", "$help_cmd_remembered"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@remembered", $help_cmd_remembered]];
var $root created_on = 856651645;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_remember];
var $root manager = $help_cmd_remember;


