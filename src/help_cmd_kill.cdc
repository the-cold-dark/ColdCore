
new object $help_cmd_kill: $help_cmds;

var $has_name name = ['prop, "@kill", "@kill"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@del-t?ask|@kill [task [task [...]]]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Kill the specified task. System tasks are directly specified by prefixing them with an asterisk. In general you should kill the related database task and let it kill the system task (if applicable). ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["@kill *10204", <$format, ["br", [], [], 'do_br]>, "@kill 12 *1241"], 'do_dfn]>], #[['this, $help_cmd_kill]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848119831;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_kill];
var $root manager = $help_cmd_kill;


