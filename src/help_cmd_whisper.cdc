
new object $help_cmd_whisper: $help_cmds;

var $has_name name = ['prop, "whisper", "whisper"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["whisper <anything> to <target>"], 'do_tt]>, <$format, ["np", [], [], 'do_np]>, "The interaction command ", <$format, ["tt", [], ["whisper"], 'do_tt]>, " is used to speak and talk privately to a specific person (<target>). Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> whisper the Red Man is in Tibet to Brian", <$format, ["br", [], [], 'do_br]>, "You whisper, \"the Red Man is in Tibet\" to Brian"], 'do_dfn]>], #[['this, $help_cmd_whisper]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847043723;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_whisper];
var $root manager = $help_cmd_whisper;


