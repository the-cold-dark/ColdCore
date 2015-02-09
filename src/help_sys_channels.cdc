
new object $help_sys_channels: $help_sys;

var $has_name name = ['prop, "Channels", "Channels"];
var $help_node body = <$ctext_frob, [["Channels are a global way to communicate with other users. Commands available for using channels:", <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@addcom <alias>=<channel>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Adds a channel alias to a channel <channel>. Provides a shortcut way of referring to a channel. For example, typing '@addcom pub=Public' will create a shortcut called 'pub' which refers to the [Public] channel."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@delcom <alias>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["@delcom <alias> deletes your alias for the given channel."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@channels"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Show all of the channel aliases and their channels you have defined (this list is only applicable to you)."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["<channel alias> <msg>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Used to speak on a channel. If the channel [Public] has the alias 'pub', you can send a message to it with the command 'pub Hi!'. Similarly, emotes work as well with 'pub :waves'"], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["<channel alias> on"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Used to turn on a channel. Typing '<alias> on' will turn on the channel specified by <alias>, such as 'pub'. When a channel is turned on, you listen and receive messages from anyone chantting on that channel."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["<channel alias> off"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Used to leave a channel."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["<channel alias> who"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Used to determine who is listening to a given channel. Typing '<alias> who' will provide a listing of users currently listening. For example, 'pub who' will list the users chatting or idling on the public channel, from the example above."], 'do_dd]>], 'do_dl]>], #[['this, $help_sys_channels]]]>;
var $help_node group = 1;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 840768823;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_channels];
var $root manager = $help_sys_channels;


