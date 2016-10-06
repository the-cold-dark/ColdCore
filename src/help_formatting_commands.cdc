
new object $help_formatting_commands: $help_node_formatting;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Commands", "Commands"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Each command node has the following general look:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], [<$format, ["quote", [], ["TYPE COMMAND\n\n    Syntax: cmd args\n\nExplanation\n\nExamples"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["subj", [["level", "2"]], ["Command Type"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "TYPE is one of: ADMIN, PROGRAMMER, BUILDER, or the appropriate name for the object the command is defined on. In the case of $user no command is type is defined. ", <$format, ["tt", [], ["$player"], 'do_tt]>, " and similar objects may (in the future) also define their own type. Feature objects will as well (although they will list as SOCIAL FEATURE COMMAND for the $social feature). ", <$format, ["np", [], [], 'do_np]>, "Type has a CML format of:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], ["{p}{b:ADMIN COMMAND}"], 'do_dfn]>, " ", <$format, ["subj", [["level", "2"]], ["Command Syntax"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Syntax is a standard command syntax definition, using <token> to represent an argument, brackets to enclose optional arguments, and an ellipsis to represent any number of arguments beyond that point. ", <$format, ["np", [], [], 'do_np]>, "Command syntax has a CML format of:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], ["{dfn:Syntax: {tt:@cmd \[-option\] <arg> \[<arg2> ...\]}}"], 'do_dfn]>, " ", <$format, ["subj", [["level", "2"]], ["Explanation"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "The explanation is one or more paragraphs explaining the command. Always correctly use {p} vs {np} to guarantee one blank line between paragraphs. ", <$format, ["subj", [["level", "2"]], ["Examples"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Examples should use the general example format. Make sure to correctly use {p} or {np} as appropriate in order to guarantee one blank line between the example and any paragraphs."], #[]]>;
var $help_node links = #[];
var $root created_on = 870561246;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_formatting_commands];
var $root manager = $help_formatting_commands;


