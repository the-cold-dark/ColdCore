
new object $introtut_communication: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["There are several ways of getting your message out, other than saying and emoting. This includes direct speech, thinking, and quoting. ", <$format, ["np", [], [], 'do_np]>, "To direct speech to another user in the same room, use \"to USER say TEXT\", or \"'user TEXT\". Like @page, you can direct speech to the last person you directed to or paged with two apostrophes (''). Try talking to yourself with", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["'", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " hello there."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "You can also use 'think' or '%' to put something in thought bubbles, just like old Spider-Man comics. Try this:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["%Don't worry, nobody can read your mind."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Sometimes it is useful to be able to quote something someone else said, or even paste a line of code from a program, without ambiguity introduced by quotation marks or people thinking you are emoting. To do this, use 'quote' or '|'. Often this is used when trying to explain to new users how to do something on ", <$generator, ["servname", [], [], 'gen_servname]>, ". As an example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["|\"Hello world, I can say things now!"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "For further information on other communication commands (yes, there are more!), see the section ", <$format, ["link", [["node", "$help_interaction"]], ["Interaction"], 'do_link]>, " Commands."], #[['links, #[["Interaction", "$help_interaction"]]]]]>;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "More Ways to Communicate", "More Ways to Communicate"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874519394;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_communication];
var $root manager = $introtut_communication;
var $root settings = #[["prev-topic", $introtut_speaking], ["back-topic", $introtut_nonverbal], ["next-topic", $introtut_remote], ["map-position", 0], ["propagate", 0]];


