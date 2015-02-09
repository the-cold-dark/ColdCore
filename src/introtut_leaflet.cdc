
new object $introtut_leaflet: $thing;

var $described prose = <$ctext_frob, [["You see writing on the leaflet, which appears to be: ", <$format, ["np", [], [], 'do_np]>, "You have now looked at a room and at objects. If you look at a person you will find the description contains a lot more information. For an example, look at yourself using the command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["look me"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "As you can see, more information is given. The name and description exist--like with other objects--but you also see the person's activity status. A person is asleep if they are not online, and if they are inactive (they have not typed anything for a while) the status will be something corresponding with how inactive they are, such as 'He is daydreaming' or 'She is long gone'. ", <$format, ["np", [], [], 'do_np]>, "You will also see a list of objects the user is carrying. You can look at these just as you looked at this leaflet in the mailbox, using one of the following commands:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["look at <object> on <player>", <$format, ["br", [], [], 'do_br]>, "look at <player>'s <object>"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If the person is an administrator, you will also see something about their system priviledges. By default, this is referred to as Mojo. Mojo is simply a representation of the administrator's system priviledges. If an administrator's Mojo is active, they have full system priviledges--if not, their priviledges are like any other programmers. ", <$format, ["np", [], [], 'do_np]>, "For more information, read the help documentation on the ", <$format, ["link", [["node", "$help_cmd_look"]], ["look"], 'do_link]>, " command."], #[['links, #[["look", "$help_cmd_look"]]]]]>;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['normal, "leaflet", "a leaflet"];
var $located location = $introtut_mailbox;
var $located obvious = 1;
var $root created_on = 874177644;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_leaflet];
var $root manager = $introtut_leaflet;
var $thing gender = $gender_neuter;
var $thing lock = <$object_lock_frob, [$introtut_mailbox]>;


