
new object $help_cmd_writers: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@writers", "@writers"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@writers <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@writers displays who or what can write on the object. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@writers $login_connection_32167\n$login_connection_32167 is writable by:\n#  Name                         Flags   Size   Manager\n18 $login_daemon                *-mvc   815    $login_daemon\n18 $login_interface             *-mvcC  6211   $login_interface\n18 $login_connection            *-mvc   902    $login_connection\n49 $vampire (Vampire)           -----   10374  $vampire (Vampire)\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_writes"]], ["@writes"], 'do_link]>, "."], #[['links, #[["@writes", "$help_cmd_writes"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@writes", $help_cmd_writes]];
var $root created_on = 878187025;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_writers];
var $root manager = $help_cmd_writers;


