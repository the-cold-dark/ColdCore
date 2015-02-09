
new object $help_cmd_channel_desc: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@desc-channel", "@desc-channel"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@desc-c?hannel <channel> as <description>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command sets a <channel>'s title that can be seen with ", <$format, ["link", [["node", "$help_cmd_channels"]], ["@channel"], 'do_link]>, ". The channels description should be something informative, so that users will know what it is for, such as the principle topic of the channel."], #[['links, #[["@channel", "$help_cmd_channels"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@channel", $help_cmd_channels]];
var $root created_on = 878187228;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_channel_desc];
var $root manager = $help_cmd_channel_desc;


