
new object $help_cmd_delcmd: $help_cmds;

var $has_name name = ['prop, "@del-command|@dc", "@del-command|@dc"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@del-c?command|@dc \"<Command Template>\" [from] <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Reverses the effects of @add-command. The command template must be identical to the one with which the command was added. The rehashing issues discussed in ", <$format, ["link", [["node", "$help_cmd_addcmd"]], ["@add-command"], 'do_link]>, " apply here (in other words, you may have to do a few tricks to update command caches)."], #[['this, $help_cmd_delcmd]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-command", $help_cmd_addcmd]];
var $root created_on = 854543905;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_delcmd];
var $root manager = $help_cmd_delcmd;


