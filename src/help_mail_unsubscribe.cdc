
new object $help_mail_unsubscribe: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@unsubscribe", "@unsubscribe"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To remove yourself from a mail list, you use the ", <$format, ["tt", [], ["@unsubscribe"], 'do_tt]>, " command.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@unsubscribe <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "That command form will unsubscribe you from the mail list assuming that you were already subscribed. Only typing:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@unsubscribe "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "will return the same output as ", <$format, ["link", [["node", "$help_mail_mail_lists"]], ["@mail-lists"], 'do_link]>, "."], #[['links, #[["@mail-lists", "$help_mail_mail_lists"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@mail-lists", $help_mail_mail_lists]];
var $root created_on = 865085169;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_unsubscribe];
var $root manager = $help_mail_unsubscribe;


