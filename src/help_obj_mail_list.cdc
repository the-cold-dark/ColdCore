
new object $help_obj_mail_list: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Mail List", "Mail List"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The Mail List is a generic recipient for mail. To create a mailing list simply spawn a new object from $mail_list, and name it as appropriate for your list. You can configure the following settings on a mailing list: mail-notify, mail-senders, mail-readers and inet-list. The first three settings can be set as logically true or false (i.e. anybody, everybody, nobody, etc), or they can be set to the token \"writers\", or they can be a list of objects. If they are the token \"writers\" it includes whoever is included as a writer. If it is a list of objects, only those objects are included. ", <$format, ["subj", [["level", "2"]], ["mail-notify"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "A list of people who will receive notification, if false or true no notification is made to anybody. ", <$format, ["subj", [["level", "2"]], ["mail-senders"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Who can send to the list, or if true anybody can send to the list. ", <$format, ["subj", [["level", "2"]], ["mail-readers"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Who who can read the list. If true anybody can read the list. ", <$format, ["subj", [["level", "2"]], ["inet-list"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Can be set to an email address. If so, it will treat this Mail List as an Internet Mailing List. This behaviour is special in that it will forward to the specified email address if mail is received from within the Virtual Environment--but if mail is received from the SMTP gateway it will be stored on the list as normal.", <$format, ["p", [], [], 'do_p]>, "To setup an internet list in this way, simply set this setting to be the internet list address, and also subscribe the SMTP name for the ColdCore list (list-<name>@domain) to the internet list. For this to work as an internet list hook, you must also setup SMTP forwarding from your operating system, or bind the SMTP port directly to port 25. More information on this can be found at: ", <$format, ["web", [["src", "http://www.cold.org/sitenames.html"], ["name", "http://www.cold.org/sitenames.html"]], [], 'do_web]>, <$format, ["p", [], [], 'do_p]>, "This setting can only be set by administrators, look for a mail-forward setting in the future, which will have configurable access restrictions."], #[]]>;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $root created_on = 909406280;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_mail_list];
var $root manager = $help_obj_mail_list;


