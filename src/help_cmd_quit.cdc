
new object $help_cmd_quit: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@quit", "@quit"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@quit"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command logs your current connection off the server. Any other connections you have to the server remain unaffected."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926235;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_quit];
var $root manager = $help_cmd_quit;


