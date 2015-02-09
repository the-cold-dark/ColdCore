
new object $help_cmd_channel_purge: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@purge-channel", "@purge-channel"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@purge-channel <channel>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Removes a channel from the world, but only if you are the channel manager.", <$format, ["p", [], [], 'do_p]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 878187342;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_channel_purge];
var $root manager = $help_cmd_channel_purge;


