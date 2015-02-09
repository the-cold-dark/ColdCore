
new object $help_cmd_tasks: $help_cmds;

var $has_name name = ['prop, "@tasks", "@tasks"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@task?s [task [task [...]]]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Briefly list all Database and Driver tasks, or list full details on the specified tasks (as with ", <$format, ["link", [["node", "$help_cmd_kill"]], ["@kill"], 'do_link]>, ") system tasks are directly specified by prefixing them with an asterisk). Examples: ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["@tasks"], 'do_dfn]>, " ", <$format, ["dfn", [], ["@tasks *10204"], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Note: does not show currently executing task."], #[['this, $help_cmd_tasks]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@kill", $help_cmd_kill]];
var $root created_on = 848119825;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_tasks];
var $root manager = $help_cmd_tasks;


