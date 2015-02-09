
new object $help_mail_mail_lists: $help_mail;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@mail-lists", "@mail-lists"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A mail list's name will always begin with the character '*' to differentiate it from other names. To get a list of mail lists on the system you are using, use:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@mail-lists "], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This will print out each mail list and inform you of whether or not you may send to the list or read the mail on the list. It lists mail lists which you can not send to, as you may still read them and they are often used for dispersal of important information. An example of a list like this would be *news. It also lists the mail-lists that you can send to, but may not read from. An example of a list like this would be *admins, which exists for discussion between the admins, but a normal user might want to send mail to there to attract their attention to a particular issue."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 865085218;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mail_mail_lists];
var $root manager = $help_mail_mail_lists;


