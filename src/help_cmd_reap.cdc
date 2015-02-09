
new object $help_cmd_reap: $help_cmds;

var $has_name name = ['prop, "@reap", "@reap"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@reap [options] [<user>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Used in reaping users. Can have various possible behaviours. If only a user is given (no options), @reap will enter an interactive user reaping system. At any time during the reaping process you can use @abort to cancel any further actions. ", <$format, ["np", [], [], 'do_np]>, "If no user is given, it will list all reap possibilities, where possibilities are considered after the user has not logged in for three months. This time can be changed with the ", <$format, ["tt", [], ["time"], 'do_tt]>, " option, which is given as an english explanation of the time, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @reap +time=\"1 month\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "In the listing the column ", <$format, ["tt", [], ["E"], 'do_tt]>, " will have an exclamation point if the user's email address is invalid. The column ", <$format, ["tt", [], ["MNG"], 'do_tt]>, " represents how many objects the user manages (always at least one). The column ", <$format, ["tt", [], ["Notified"], 'do_tt]>, " shows if and when the last reap notification was mailed, using the ", <$format, ["tt", [], ["mail"], 'do_tt]>, " option. The columns ", <$format, ["tt", [], ["Last On"], 'do_tt]>, " and ", <$format, ["tt", [], ["Age"], 'do_tt]>, " represent when the user was last connected, and how long it has been since they were created. ", <$format, ["np", [], [], 'do_np]>, "If the ", <$format, ["tt", [], ["mail"], 'do_tt]>, " option is given, instead of reaping it will send a message to the user's email address, notifying them of the imminent reaping. The ", <$format, ["tt", [], ["time"], 'do_tt]>, " option can also be used to change the grace period, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @reap Bob +mail +time=\"5 days\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "A user is automatically removed from reapable status when they connect. The grace period is enforcable only by the administrations. This command does not make any assumptions, and an administrator will have to followup with a full reaping at the end of the grace period."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848426641;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_reap];
var $root manager = $help_cmd_reap;


