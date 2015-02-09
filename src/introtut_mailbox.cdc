
new object $introtut_mailbox: $in_location;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Just your standard mailbox, except that somone has built a wooden dairy cow around it. ", <$format, ["np", [], [], 'do_np]>, "This mailbox is a type of container; it can hold other objects. When you look at an open container, you also get a listing of its contents, if the container is closed it will simply tell you 'It is closed.' To open the mailbox, type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["open the mailbox"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The mailbox may already be open; if so, you may want to try closing it and opening it again. Once the mailbox is open, you will see that it contains a leaflet. To read the leaflet, type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["look at leaflet in mailbox"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>], #[]]>;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['normal, "small mailbox", "a small mailbox"];
var $has_name templates = ["box"];
var $located location = $introtut_look;
var $located obvious = 1;
var $location contents = [$introtut_leaflet];
var $root created_on = 874177644;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_mailbox];
var $root manager = $introtut_mailbox;
var $root settings = #[["closable", 1], ["closed", 1]];
var $thing gender = $gender_neuter;
var $thing lock = <$object_lock_frob, [$introtut_look]>;


