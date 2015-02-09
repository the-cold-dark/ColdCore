
new object $help_cmd_del_writer: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@del-writer|@dw", "@del-writer|@dw"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@del-writer|@dw <writer> [to] <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Deletes a person or object from the list of things able to modify the object.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_add_writer"]], ["@add-writer"], 'do_link]>], #[['links, #[["@add-writer", "$help_cmd_add_writer"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-writer", $help_cmd_add_writer]];
var $root created_on = 878186385;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_del_writer];
var $root manager = $help_cmd_del_writer;


