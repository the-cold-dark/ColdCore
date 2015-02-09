
new object $help_cmd_rehash: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@rehash", "@rehash"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: @rehash"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Commands are cached for fast lookup. Because of this, if a command is added to an object other than your object (such as $user), your user's cache needs to be updated. This command will clear your user's cache and update it as needed. See also ", <$format, ["link", [["node", "$help_cmd_rehashall"]], ["@rehash-all"], 'do_link]>, "."], #[['links, #[["@rehash-all", "$help_cmd_rehashall"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@rehash-all", $help_cmd_rehashall]];
var $root created_on = 870565149;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_rehash];
var $root manager = $help_cmd_rehash;


