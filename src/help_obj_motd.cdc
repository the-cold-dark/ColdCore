
new object $help_obj_motd: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "motd", "motd"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "$motd is an object which controls the display which users receive upon connecting, as well as the web page which the HTTP server returns. This object allows administrators to easily change and customize this information. This can be done via the following settings:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], ["$motd:login-sequence:"], 'do_dt]>, <$format, ["dd", [], ["Sets the sequence of items to be displayed on the login screen"], 'do_dd]>, <$format, ["dt", [], ["$motd:server-name:"], 'do_dt]>, <$format, ["dd", [], ["Sets the default server name for MOTD displays"], 'do_dd]>, <$format, ["dt", [], ["$motd:server-title:"], 'do_dt]>, <$format, ["dd", [], ["Sets the default server title for MOTD displays"], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "$motd:login-sequence is a list of items which can be passed to $motd.build() to construct the login display. The list of valid arguments are as follows:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], ["'admins:"], 'do_dt]>, <$format, ["dd", [], ["Displays a list of administrators"], 'do_dd]>, <$format, ["dt", [], ["'connected:"], 'do_dt]>, <$format, ["dd", [], ["Displays the number of currently connected users"], 'do_dd]>, <$format, ["dt", [], ["'core_version:"], 'do_dt]>, <$format, ["dd", [], ["Displays the current core version"], 'do_dd]>, <$format, ["dt", [], ["'default:"], 'do_dt]>, <$format, ["dd", [], ["Constructs a default login display"], 'do_dd]>, <$format, ["dt", [], ["'driver_version:"], 'do_dt]>, <$format, ["dd", [], ["Displays the version of the driver currently in use"], 'do_dd]>, <$format, ["dt", [], ["'help:"], 'do_dt]>, <$format, ["dd", [], ["Displays a help message"], 'do_dd]>, <$format, ["dt", [], ["'long:"], 'do_dt]>, <$format, ["dd", [], ["Displays the server's title, then its name"], 'do_dd]>, <$format, ["dt", [], ["'name:"], 'do_dt]>, <$format, ["dd", [], ["Displays the server name"], 'do_dd]>, <$format, ["dt", [], ["'notes:"], 'do_dt]>, <$format, ["dd", [], ["Displays the contents of the notes variable on $motd"], 'do_dd]>, <$format, ["dt", [], ["'short:"], 'do_dt]>, <$format, ["dd", [], ["Displays only the server's title"], 'do_dd]>, <$format, ["dt", [], ["'title:"], 'do_dt]>, <$format, ["dd", [], ["Displays the server title"], 'do_dd]>, <$format, ["dt", [], ["'quote:"], 'do_dt]>, <$format, ["dd", [], ["Displays a random quote"], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $root created_on = 906679568;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_motd];
var $root manager = $help_obj_motd;


