
new object $help_cmd_shutdown: $help_cmds;

var $has_name name = ['prop, "@shutdown", "@shutdown"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@shutdown [-t?ime=xx] [reason]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Shutdown the server, the time defaults to five minutes, if left unspecified. The time specified is in minutes, so -time=10 would be ten minutes, not ten seconds. Example: ", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@shutdown -t=0 Upgrading Driver, Should be back online soon"], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Would shutdown immediately (zero minutes)."], #[['this, $help_cmd_shutdown]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848119822;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_shutdown];
var $root manager = $help_cmd_shutdown;


