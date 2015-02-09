
new object $help_cmd_rehashall: $help_cmds;

var $has_name name = ['prop, "@rehash-all", "@rehash-all"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["Syntax: @rehash-all [-purge]"], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Commands are cached for fast lookup. Because of this if a command is added to an object other than your object (such as $user), the global cache needs to be updated. This command will clear all caches and update them as needed. ", <$format, ["p", [], [], 'do_p]>, "If the +purge option is specified it will purge ALL caches in the database before rehashing. This does not happen by default."], #[['this, $help_cmd_rehashall]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848119800;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_rehashall];
var $root manager = $help_cmd_rehashall;


