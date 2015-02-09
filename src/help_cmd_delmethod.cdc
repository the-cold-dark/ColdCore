
new object $help_cmd_delmethod: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-method|@dm", "@del-method|@dm"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@del-m?ethod|@delm?ethod|@dm <objref>.<method>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command will remove an unwanted <method> from the <objref>. Once the <method> has been removed, you can't get it back, so be sure you want the method removed, or that you have a backup of it. Also, if a command references this method, be sure that you remove the command with ", <$format, ["link", [["node", "$help_cmd_delcmd"]], ["@del-command"], 'do_link]>, ".", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_program"]], ["@program"], 'do_link]>], #[['links, #[["@del-command", "$help_cmd_delcmd"], ["@program", "$help_cmd_program"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@del-command", $help_cmd_delcmd], ["@program", $help_cmd_program]];
var $root created_on = 870646953;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_delmethod];
var $root manager = $help_cmd_delmethod;


