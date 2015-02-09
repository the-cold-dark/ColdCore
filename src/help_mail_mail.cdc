
new object $help_mail_mail: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@mail", "@mail"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To determine what mail is on a mail list, the ", <$format, ["tt", [], ["@mail"], 'do_tt]>, " command has been provided.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@mail <range> on <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will return the list of mail messages on the mail list from the beginning to the end of the specified ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, ". If the ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, " is not specified, it defaults to a value based on the number of rows you have told Cold (via ", <$format, ["link", [["node", "$help_interface_settings"]], ["@set"], 'do_link]>, " cols) exist on your screen.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@mail <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will return the same list of messages as the form above, but assumes the default ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, "."], #[['links, #[["range", "$help_ranges"], ["@set", "$help_interface_settings"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["range", $help_ranges], ["@set", $help_settings]];
var $root created_on = 865084822;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_mail];
var $root manager = $help_mail_mail;


