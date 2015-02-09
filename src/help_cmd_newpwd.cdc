
new object $help_cmd_newpwd: $help_cmds;

var $has_name name = ['prop, "@new-password|@newpwd", "@new-password|@newpwd"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@new-password|@newpw?d <user>"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Used to generate a new random password for the specified user. The password is printed to the admin running the command, and is emailed to the user. Example: ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["@newpw Billy Bob"], 'do_dfn]>], #[['this, $help_cmd_newpwd]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848119794;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_newpwd];
var $root manager = $help_cmd_newpwd;


