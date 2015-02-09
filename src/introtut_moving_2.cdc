
new object $introtut_moving_2: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["You can also chain movement commands together, if you already know where it is you want to go and how to get there. To do this, use the 'go' command, with the path you would walk. To get back to the tutorial, try typing", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["go up west"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "then type 'next' to move to the next tutorial topic."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Cellar", "the Cellar"];
var $location contents = [];
var $place entrances = [$introtut_path2];
var $place exits = [$introtut_path2];
var $place realm = $realm_of_creation;
var $root created_on = 874473713;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_moving_2];
var $root manager = $introtut_moving_2;
var $root settings = #[["map-position", 0], ["propagate", 0]];


