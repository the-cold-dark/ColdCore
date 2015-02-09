
new object $help_mail_reply: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@reply", "@reply"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To reply to a message, you use the ", <$format, ["tt", [], ["@reply"], 'do_tt]>, " command.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@reply to <number> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will reply to the mail message ", <$format, ["tt", [], ["number"], 'do_tt]>, " on the current mail list.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@reply <number> on <list> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will reply to the mail message ", <$format, ["tt", [], ["number"], 'do_tt]>, " on the specified mail list.", <$format, ["p", [], [], 'do_p]>, <$format, ["np", [], [], 'do_np]>, "Either form of the ", <$format, ["tt", [], ["@reply"], 'do_tt]>, " command will drop you into the ", <$format, ["link", [["node", "$help_sys_editor"]], ["editor"], 'do_link]>, " to compose your reply. When you have finished your reply, just type '", <$format, ["link", [["node", "$help_node_editor_commands"]], ["send"], 'do_link]>, "' and the message will be sent, and the ", <$format, ["link", [["node", "$help_sys_editor"]], ["editor"], 'do_link]>, " will exit."], #[['links, #[["editor", "$help_sys_editor"], ["send", "$help_node_editor_commands"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["editor", $help_sys_editor], ["send", $help_node_editor_commands]];
var $root created_on = 865092817;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_reply];
var $root manager = $help_mail_reply;


