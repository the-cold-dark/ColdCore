
new object $help_cmd_shortcuts: $help_cmds;

var $has_name name = ['prop, "Unnamed Interaction Shortcuts", "Unnamed Interaction Shortcuts"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "In addition to the standard interaction commands there are also a few which do not have names: ", <$format, ["dfn", [["ind", "4"], ["nobound", 1]], [<$format, ["table", [["cols", "10%,90%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], [<$format, ["tt", [], ["|"], 'do_tt]>], 'do_b]>], 'do_td]>, <$format, ["td", [], ["This is used to display one line of information, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> |test", <$format, ["br", [], [], 'do_br]>, "Brandon | test"], 'do_dfn]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["b", [], [<$format, ["tt", [], [",,"], 'do_tt]>], 'do_b]>], 'do_td]>, <$format, ["td", [], ["This is like ", <$format, ["link", [["node", "$help_cmd_say"]], ["say"], 'do_link]>, ", but it lets you put your own text before what you say, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> ,nods, That is correct", <$format, ["br", [], [], 'do_br]>, "Brandon nods, \"That is correct\""], 'do_dfn]>], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['this, $help_cmd_shortcuts]]]>;
var $help_node links = #[["say", $help_cmd_say]];
var $root created_on = 847044102;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_shortcuts];
var $root manager = $help_cmd_shortcuts;


