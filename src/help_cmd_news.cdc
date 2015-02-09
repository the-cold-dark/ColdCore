
new object $help_cmd_news: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@news", "@news"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@news"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command lists recent postings to the *news mail list. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@news\nthe Cold Dark news:\n\n        23) oif\n        24) RC5 Challenge and the Cold Project Team\n        25) @help $help_node\n        26) Building the Castle\n\n"], 'do_quote]>], 'do_dfn]>, "Use ", <$format, ["link", [["node", "$help_mail_read"]], ["@read"], 'do_link]>, " #, where # is the news item number, such as \"@read 1\". All news items can be found on mail list *news."], #[['links, #[["@read", "$help_mail_read"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@read", $help_mail_read]];
var $root created_on = 870926179;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_news];
var $root manager = $help_cmd_news;


