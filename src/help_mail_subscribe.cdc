
new object $help_mail_subscribe: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@subscribe", "@subscribe"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Once you know about the mailing lists available, you may wish to subscribe to some of them. For this you use the ", <$format, ["tt", [], ["@subscribe"], 'do_tt]>, " command.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@subscribe <*list-name> "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This checks that you may read the list, and will then subscribe you. This command has a couple of other useful forms also however:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@subscribe +new "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This is the command form used to determine on what lists you have new mail.", <$format, ["p", [], [], 'do_p]>, <$format, ["np", [], [], 'do_np]>, "And finally:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@subscribe "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This merely prints out the list of mail lists you are currently subscribed to."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 865085006;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_subscribe];
var $root manager = $help_mail_subscribe;


