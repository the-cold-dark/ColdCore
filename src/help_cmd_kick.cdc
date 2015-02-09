
new object $help_cmd_kick: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@kick", "@kick"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@kick <user>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command destroys all of a user's current login connections, effectively disconnecting them from the server."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 878512086;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_kick];
var $root manager = $help_cmd_kick;


