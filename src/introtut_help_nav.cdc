
new object $introtut_help_nav: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["The server keeps track of what help nodes you have read, and you can go backwards and forwards in this history, using the less-than and greater-than signs in place of the link name, respectively. For instance, if you wanted to go back to the previous help node, you could simply type either of the following commands:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help <", <$format, ["br", [], [], 'do_br]>, "?<"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "And to move forward again, you could type either of:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help >", <$format, ["br", [], [], 'do_br]>, "?>"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "All of the other shortcuts and features are explained in detail, in the ", <$format, ["link", [["node", "$help_help"]], ["help options"], 'do_link]>, " documentation."], #[['links, #[["help options", "$help_help"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Help History", "Help History"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874290428;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_help_nav];
var $root manager = $introtut_help_nav;
var $root settings = #[["next-topic", $introtut_objs], ["prev-topic", $introtut_lines], ["back-topic", $introtut_help_short], ["map-position", 0], ["propagate", 0]];


