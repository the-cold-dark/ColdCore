
new object $introtut_help: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["One of the most important things to learn is how to use the help system. If you are familiar with the World Wide Web, you may recognize a hyperlink. Within a topic, references to help documents will be highlighted in some manner--these are known as links, or hyperlinks. How the link is highlighted will vary depending upon how you are browsing this tutorial. If you are connected through a terminal the link may be surrounded by square brackets ([]). If you are using html, it should be highlighted just like any other link. The following is a link to the main help page:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["link", [["node", "$help_coldcore"]], ["@help"], 'do_link]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Remember how it looks. When you see something which looks like it, you can type: '", <$format, ["tt", [], ["@help WORD"], 'do_tt]>, "' where WORD is the text. ", <$format, ["np", [], [], 'do_np]>, "If you want to explore how to use the help system further, type 'more'. Or, for later reference, you can get more information on all of the features of the help system, as well as a list of the abbreviations useful for easy navigation by typing:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help help"], 'do_dfn]>], #[['links, #[["@help", "$help_coldcore"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Using the Help System", "Using the Help System"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874182968;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_help];
var $root manager = $introtut_help;
var $root settings = #[["prev-topic", $introtut_lines], ["next-topic", $introtut_objs], ["more-topic", $introtut_help_short], ["map-position", 0], ["propagate", 0]];


