
new object $help_cmd_nh: $help_cmds;

var $has_name name = ['prop, "@nh|@new-help-node", "@nh|@new-help-node"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@nh [<node>] [options]"], 'do_tt]>, "` ", <$format, ["np", [], [], 'do_np]>, "The argument ", <$format, ["i", [], ["node"], 'do_i]>, " is the parent node to descend from, or if unspecified it will default to the current node. Options can be:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["+i?ndex=index", <$format, ["br", [], [], 'do_br]>, "+o?bjname=objname", <$format, ["br", [], [], 'do_br]>, "+n?ame=\"name of node\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "A seperate entry is made in the index for each branch in the name (seperated by the | character)."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 856455556;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_nh];
var $root manager = $help_cmd_nh;


