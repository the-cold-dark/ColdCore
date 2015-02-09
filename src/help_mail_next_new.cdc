
new object $help_mail_next_new: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@nn", "@nn"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To provide an easier way to cycle through a larger quantity of unread mail, the ", <$format, ["tt", [], ["@nn"], 'do_tt]>, " command was written.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@nn <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form displays the next new message from the specified mail list. By leaving off the mail list identifier, it will cycle through each list you are subscribed to, displaying the unread mail."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 865089561;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_next_new];
var $root manager = $help_mail_next_new;


