
new object $help_cmd_help: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@help", "@help"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@help [topic] [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command is explained in greater detail, in the section ", <$format, ["link", [["node", "$help_help"]], ["Using the Help System"], 'do_link]>, "."], #[['links, #[["Using the Help System", "$help_help"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Using the Help System", $help_help]];
var $root created_on = 870763088;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_help];
var $root manager = $help_cmd_help;


