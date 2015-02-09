
new object $help_mail_send: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@send", "@send"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To send mail to another user or to a mail list, you use the ", <$format, ["tt", [], ["@send"], 'do_tt]>, " command.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@send <*list-name or user> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will prompt you for the text of the message and the subject and then send the mail message to the specified mail list or user.", <$format, ["p", [], [], 'do_p]>, <$format, ["np", [], [], 'do_np]>, "Note: In the near future, this command will gain a few options to allow it to drop you into an editor and to support ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, " based mail messages.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@send <note> to <*list-name or user> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will allow you to send the text of the ", <$format, ["tt", [], ["note"], 'do_tt]>, " to the specified mail list or user."], #[['links, #[["CML", "$help_cml"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["CML", $help_cml]];
var $root created_on = 865088462;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_send];
var $root manager = $help_mail_send;


