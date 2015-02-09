
new object $help_cmd_ca: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@command-a?liases|@ca?liases", "@command-a?liases|@ca?liases"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@command-a?liases|@ca?liases"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@command-aliases lists any and all commands that you have aliased to another command. See ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, "."], #[['links, #[["@add-command-alias", "$help_cmd_aca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-command-alias", $help_cmd_aca]];
var $root created_on = 874973168;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_ca];
var $root manager = $help_cmd_ca;


