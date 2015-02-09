
new object $help_cmd_msg: $help_sys_message;

var $has_name name = ['prop, "@msg", "@msg"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@msg|@message [-clear] [<target>:][<msg>=<value>]"], 'do_tt]>, "` ", <$format, ["np", [], [], 'do_np]>, "You can view and set messages with this command. When no message is given (and only the target is specified) it will list all messages on the target object. If no target is specified, the target will default to the current object. If a message and value is specified, it will set the value as appropriate. The value is be written in ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "If the message is undefined on an object, it will default to the value given on the defining object. To revert a message back to the default value use the -clear option, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@msg -clear teleport.actor"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Some examples of setting and viewing messages:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @msg", <$format, ["br", [], [], 'do_br]>, "-- Messages on Brandon ($brandon):", <$format, ["br", [], [], 'do_br]>, "teleport.actor = You teleport to [dest].", <$format, ["br", [], [], 'do_br]>, "teleport.dest = [actor] teleports here from [source].", <$format, ["br", [], [], 'do_br]>, "teleport.source = [actor] teleports to [dest]."], 'do_dfn]>, " ", <$format, ["dfn", [], ["> @msg north:invoke.actor=You walk up [exit].", <$format, ["br", [], [], 'do_br]>, "-- Message changed to:", <$format, ["br", [], [], 'do_br]>, "invoke.actor = You walk up [exit]."], 'do_dfn]>], #[['this, $help_cmd_msg]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["CML", $help_cml]];
var $root created_on = 856117601;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_msg];
var $root manager = $help_cmd_msg;


