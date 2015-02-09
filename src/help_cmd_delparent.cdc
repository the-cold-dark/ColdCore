
new object $help_cmd_delparent: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-parent|@dp", "@del-parent|@dp"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@del-p?arent|@dp <parent> from <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Deletes a <parent> from <objref>. This command does not remove any other existing parents from the <objref>. See also ", <$format, ["link", [["node", "$help_cmd_addparent"]], ["@add-p?arent"], 'do_link]>, "."], #[['links, #[["@add-p?arent", "$help_cmd_addparent"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-p?arent", $help_cmd_addparent]];
var $root created_on = 870639383;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_delparent];
var $root manager = $help_cmd_delparent;


