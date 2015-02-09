
new object $help_cmd_channels: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@channels", "@channels"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@channel?s [+f?ull +d?etailed]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Without either of the two options, this command displays the channels that you are currently listening too. The +full option displays all the channels available; the +detailed option displays information regarding each of the channels, such as the ", <$format, ["link", [["node", "$help_cmd_channel_desc"]], ["title"], 'do_link]>, ", number of current listeners, the channel owner, and the ", <$format, ["link", [["node", "$help_cmd_channel_acm"]], ["channel manager"], 'do_link]>, "."], #[['links, #[["title", "$help_cmd_channel_desc"], ["channel manager", "$help_cmd_channel_acm"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["title", $help_cmd_channel_desc], ["channel manager", $help_cmd_channel_acm]];
var $root created_on = 878187484;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_channels];
var $root manager = $help_cmd_channels;


