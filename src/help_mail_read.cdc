
new object $help_mail_read: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@read", "@read"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The @read command allows you to read your mail messages.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@read <range> on <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will display each message in ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, " from the specified mail list.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@read <range> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will display each message in ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, " from the current mail list (the last one accessed with a mail command).", <$format, ["p", [], [], 'do_p]>, <$format, ["np", [], [], 'do_np]>, "Note: In either case, the ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, " may be given as '", <$format, ["tt", [], ["next"], 'do_tt]>, "' or '", <$format, ["tt", [], ["prev"], 'do_tt]>, "' which will correspondingly read the next or previous message on the list."], #[['links, #[["range", "$help_ranges"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["range", $help_ranges]];
var $root created_on = 865084621;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_read];
var $root manager = $help_mail_read;


