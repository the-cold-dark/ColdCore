
new object $help_formatting_general: $help_node_formatting;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "General", "General"];
var $help_node body = <$ctext_frob, [[<$format, ["np", [], [], 'do_np]>, "Some general formatting conventions: ", <$format, ["subj", [["level", "2"]], ["White Space"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "White Space in CML is generally managed ok. However, in some cases it is not--when formatting plaintext. This is due primarily to the problems which arise with multiple output formats. Therefore, you should pay close attention when writing help information that your Whitespace formatting is correct. Are your paragraphs spaced with one blank line them? Do your paragraphs begin at the start of the line, or is there a space first? ", <$format, ["subj", [["level", "2"]], ["Action Examples"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "When giving an example of an action the user may take, always format it as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["{dfn:example}"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "In the case of one or more lines, use {br}, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["{dfn:example line 1{br}example line 2}"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When showing an action and result, use '=>' to represent the result. Do not prefix the action with a prompt, unless it is a command."], #[]]>;
var $help_node links = #[];
var $root created_on = 870560749;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_formatting_general];
var $root manager = $help_formatting_general;


