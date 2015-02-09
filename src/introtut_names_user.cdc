
new object $introtut_names_user: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["In general, object names do not have to be unique. That is, multiple objects can have the exact same name. However, users must have unique names in respect to other users. To determine the unique aspect of a name, all characters which are not alphabetic or numeric are removed from the name, and then it is compared to other names which have been stripped in the same manner. Thus, if somebody were to have the name \"Joe\", somebody else could not have the name \"Joe!\", because after it is stripped it is equivalent. ", <$format, ["np", [], [], 'do_np]>, "If you want to have more than one name refer to yourself, you can register them, using the command '", <$format, ["tt", [], ["@register"], 'do_tt]>, "'."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "User Names", "User Names"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874470130;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_names_user];
var $root manager = $introtut_names_user;
var $root settings = #[["back-topic", $introtut_names_tmpl], ["next-topic", $introtut_env], ["prev-topic", $introtut_objs], ["map-position", 0], ["propagate", 0]];


