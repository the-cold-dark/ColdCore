
new object $introtut_remote: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["When you would like to talk with someone who is logged into ", <$generator, ["servname", [], [], 'gen_servname]>, ", but isn't in your location, you can page them. The '@page' command will send your message only to the person (or people) you specify. You use this command by paging one or more people, with a message, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@page me ", <$format, ["i", [], ["with"], 'do_i]>, " This is my first page."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["with"], 'do_i]>, " preposition is important, and is not a part of the message you are actually paging. This exists to help the server distinguish where the list of recipients ends, and your message begins. Since this page was directed only at you, it should have looked something like:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["[from Remote Communication] ", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " says, \"This is my first page.\"", <$format, ["br", [], [], 'do_br]>, "[to ", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, "] ", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " says, \"This is my first page.\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "As you see, a page announces to its recipient who sent the message and where the sender is, and you also see a line showing what you sent. ", <$format, ["np", [], [], 'do_np]>, "For more information on the various features and shortcuts of paging, See ", <$format, ["link", [["node", "$help_cmd_page"]], ["@page"], 'do_link]>, "."], #[['links, #[["@page", "$help_cmd_page"]]]]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Remote Communication", "Remote Communication"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177643;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_remote];
var $root manager = $introtut_remote;
var $root settings = #[["next-topic", $introtut_who], ["prev-topic", $introtut_nonverbal], ["map-position", 0], ["propagate", 0]];


