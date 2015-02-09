
new object $help_commands_vr: $help_commands;

var $has_name name = ['prop, "VR vs Non-VR", "VR vs Non-VR"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "To help classify commands, a distinction has been made. This distinction is based upon how the command is used, and what it effects. If the command is a Non-VR command (it does not follow the Virtual Environment guidelines) it begins with an at-sign ('@'). Otherwise, it does not. ", <$format, ["np", [], [], 'do_np]>, "The best way to decide if a command is VR or Non-VR is to ask yourself the question: ", <$format, ["i", [], ["Is it something I could do in real-life?"], 'do_i]>, " For instance, you do not simply declare, \"", <$format, ["i", [], ["I am wearing pink polka dotted clothes"], 'do_i]>, "\", and suddenly you are. However, in the Cold Dark you have the ability to directly change how you look from moment to moment. Therefore this command (@describe) is a Non-VR command, and begins with an at-sign."], #[['this, $help_commands_vr]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 810075673;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_commands_vr];
var $root manager = $help_commands_vr;


