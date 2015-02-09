
new object $help_cmd_cs: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@cleanup-sessions|@c-s", "@cleanup-sessions|@c-s"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@cleanup-sessions|@c-s <editor session number>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command destroys old editor sessions which are running in the background, any changes which have been made to these edit sessions will not be saved. To find out which (if any) sessions you have running, use the ", <$format, ["link", [["node", "$help_cmd_edit"]], ["@edit"], 'do_link]>, " command."], #[['links, #[["@edit", "$help_cmd_edit"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@edit", $help_cmd_edit]];
var $root created_on = 877035960;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_cs];
var $root manager = $help_cmd_cs;


