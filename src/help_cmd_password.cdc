
new object $help_cmd_password: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@password|@passwd", "@password|@passwd"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@password|@passwd"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@password|@passwd <old password> <new password>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows a user to change it's password. In the first form, it will prompt you for your current password, and then you will be asked to enter your new password. In the second form, you can enter both your <old password> and <new password>, as a one line command. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@password foobar barfoo\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@password\nCurrent Password (@abort to abort):\n   <non-echoed current password>\nNew Password (@abort to abort):\n   <non-echoed new password>\nRetype New Password (@abort to abort):\n   <non-echoed new password>\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926204;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_password];
var $root manager = $help_cmd_password;


