
new object $help_cmd_writes: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@writes", "@writes"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@writes <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@writes displays what may write to the object. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@writes $vampire\nVampire ($vampire) is a writer for:\n#  Name                         Flags   Size   Manager\n3  $user_robota (Robot-A)       -----   1286   $user_robota (Robot-A)\n6  $login_connection_32167      -----   393    $login_connection\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_writers"]], ["@writers"], 'do_link]>], #[['links, #[["@writers", "$help_cmd_writers"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@writers", $help_cmd_writers]];
var $root created_on = 878187051;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_writes];
var $root manager = $help_cmd_writes;


