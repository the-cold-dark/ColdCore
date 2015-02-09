
new object $introtut_desc: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["As was just explained, all objects in your virtual environment have descriptions, including you. Most likely, you have the default description, which is 'You see nothing special'. It would be a good idea to change that description now, even if you're not sure what you want it to be. You can always change it again later. ", <$format, ["np", [], [], 'do_np]>, "Since you may not have looked at many other players, there are a few examples of users' descriptions here. Look at the graffiti to see them. ", <$format, ["np", [], [], 'do_np]>, "When you have decided on a description for yourself, you can set it with", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@describe me as \"Your Description Here\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Describing Yourself", "Describing Yourself"];
var $location contents = [$introtut_user_graffiti];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177645;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_desc];
var $root manager = $introtut_desc;
var $root settings = #[["prev-topic", $introtut_moving], ["next-topic", $introtut_gender], ["map-position", 0], ["propagate", 0]];


