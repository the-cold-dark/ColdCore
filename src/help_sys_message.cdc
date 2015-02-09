
new object $help_sys_message: $help_sys;

var $has_name name = ['prop, "Messages", "Messages"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The message system is used to group several different Ctext messages under a specific message type for single evaluation. A message is composed of a base and any number of branches. The branches define each specific variation on the message, such as with teleport messages--there is the actor's message, the source message and the destination message. This message's base is \"teleport\" with the branches of \"actor\", \"source\" and \"dest\". By default if no branch is specified, the \"general\" branch is used instead (so referencing a message with no branch, and with the \"general\" branch are equivalent).", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_cmd_msg"]], ["Setting Messages"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_cmd_defmsg"]], ["Defining Messages"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_msg_coldc"]], ["ColdC Message Interface"], 'do_link]>], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_msg_prop"]], ["Message Propagation"], 'do_link]>], 'do_li]>], 'do_ul]>], #[['links, #[["Setting Messages", "$help_cmd_msg"], ["Defining Messages", "$help_cmd_defmsg"], ["ColdC Message Interface", "$help_msg_coldc"], ["Message Propagation", "$help_msg_prop"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_subsystem;
var $help_node links = #[["Setting Messages", $help_cmd_msg], ["Defining Messages", $help_cmd_defmsg], ["ColdC Message Interface", $help_msg_coldc], ["Message Propagation", $help_msg_prop]];
var $root created_on = 856117169;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_message];
var $root manager = $help_sys_message;


