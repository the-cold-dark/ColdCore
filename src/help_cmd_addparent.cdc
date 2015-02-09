
new object $help_cmd_addparent: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-parent|@ap", "@add-parent|@ap"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-p?arent|@ap <parent> to <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Adds an additional <parent> to <objref>. This command does not remove any existing parents from the <objref>. See also ", <$format, ["link", [["node", "$help_cmd_delparent"]], ["@del-p?arent"], 'do_link]>, "."], #[['links, #[["@del-p?arent", "$help_cmd_delparent"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@del-p?arent", $help_cmd_delparent]];
var $root created_on = 870589057;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_addparent];
var $root manager = $help_cmd_addparent;


