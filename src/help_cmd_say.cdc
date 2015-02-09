
new object $help_cmd_say: $help_cmds;

var $has_name name = ['prop, "say", "say"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The interaction command ", <$format, ["tt", [], ["say"], 'do_tt]>, " is used to speak and talk to others. For convenience, the double-quote character may also be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> say Hi", <$format, ["br", [], [], 'do_br]>, "Brandon says, \"Hi\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["> \"whats up?", <$format, ["br", [], [], 'do_br]>, "Brandon says, \"whats up?\""], 'do_dfn]>], #[['this, $help_cmd_say]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847043470;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_say];
var $root manager = $help_cmd_say;


