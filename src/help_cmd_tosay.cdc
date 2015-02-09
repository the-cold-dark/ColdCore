
new object $help_cmd_tosay: $help_cmds;

var $has_name name = ['prop, "to say", "to say"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["to <target> say <anything>"], 'do_tt]>, <$format, ["np", [], [], 'do_np]>, "The interaction command ", <$format, ["tt", [], ["to"], 'do_tt]>, " is used to speak and talk to a specific person (<target>). For convenience, the single-quote character may be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> to Miro say Hi", <$format, ["br", [], [], 'do_br]>, "Brandon (to Miro) says, \"Hi\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["> 'Miro whats up?", <$format, ["br", [], [], 'do_br]>, "Brandon (to Miro) says, \"whats up?\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "As with any directed interaction command, you can double up the shortcut character to send to the last person you directed to. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> 'Miro say Hi", <$format, ["br", [], [], 'do_br]>, "Brandon (to Miro) says, \"Hi\"", <$format, ["br", [], [], 'do_br]>, "> ''how is the weather?", <$format, ["br", [], [], 'do_br]>, "Brandon (to Miro) asks, \"How is the weather?\""], 'do_dfn]>], #[['this, $help_cmd_tosay]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847043714;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_tosay];
var $root manager = $help_cmd_tosay;


