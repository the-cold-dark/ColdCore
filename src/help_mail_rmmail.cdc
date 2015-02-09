
new object $help_mail_rmmail: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@rmmail", "@rmmail"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Deleting your mail is easily accomplished with the ", <$format, ["tt", [], ["@rmmail"], 'do_tt]>, " command.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@rmmail <range> from <$list-name or me> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command form will delete the messages in the ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_ranges"]], ["range"], 'do_link]>], 'do_tt]>, " from the specified mail list if you have the proper permissions, or from your own mailbox if you specify ", <$format, ["tt", [], ["me"], 'do_tt]>, "."], #[['links, #[["range", "$help_ranges"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["range", $help_ranges]];
var $root created_on = 865091839;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_rmmail];
var $root manager = $help_mail_rmmail;


