
new object $help_commands_enhanced: $help_general;

var $has_name name = ['prop, "Enhanced Command Templates", "Enhanced Command Templates"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The Cold Dark further expands upon the above matching systems, specifying certain types of arguments which can be accepted for a command, where the wildcard ('*') is located. These are specified within less-than and greater-than signs (", <$format, ["tt", [], ["<"], 'do_tt]>, " and ", <$format, ["tt", [], [">"], 'do_tt]>, "). These tags simply tell the parser what type of arguments to accept in that location on the command line. An example would be:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["push <user>"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Where <user> must be a valid user of the system, some more examples follow.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["\"l?ook at <thing>\"\n\"get|take <any> from <thing>\"\n\"@who <user>\"\n\"@show <object>\""], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "More information on Enhanced Command Templates can be found in the section ", <$format, ["link", [["node", "$help_prog_commands"]], ["Programming Commands"], 'do_link]>, "."], #[['this, $help_commands_enhanced]]]>;
var $help_node links = #[["Programming Commands", $help_prog_commands]];
var $help_node nolist = 0;
var $root created_on = 810075680;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_commands_enhanced];
var $root manager = $help_commands_enhanced;


