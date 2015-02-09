
new object $introtut_moving_1: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["Exits can have name templates, too. This place has an exit named 'stairs', with the name template 'd?own'. You can go down the stairs by typing 'stairs', 'sta', 'down', 'd', 'dow', or anything else that would match the object name or name template (see earlier in the tutorial for more information about these concepts). ", <$format, ["np", [], [], 'do_np]>, "You can get back to the tutorial by typing 'west', but try typing 'down' now."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Top of the Stairs", "the Top of the Stairs"];
var $location contents = [];
var $place entrances = [$introtut_path1, $introtut_path2];
var $place exits = [$introtut_path1, $introtut_path2];
var $place realm = $realm_of_creation;
var $root created_on = 874376521;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_moving_1];
var $root manager = $introtut_moving_1;
var $root settings = #[["map-position", 0], ["propagate", 0]];


