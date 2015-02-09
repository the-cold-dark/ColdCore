
new object $help_cmd_add_writer: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-writer|@aw", "@add-writer|@aw"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-writer|@aw <writer> [to] <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Sets who, in addition to the ", <$format, ["link", [["node", "$help_cmd_manager"]], ["manager"], 'do_link]>, ", may modify this object.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_del_writer"]], ["@del-writer"], 'do_link]>], #[['links, #[["manager", "$help_cmd_manager"], ["@del-writer", "$help_cmd_del_writer"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["manager", $help_cmd_manager], ["@del-writer", $help_cmd_del_writer]];
var $root created_on = 878186322;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_add_writer];
var $root manager = $help_cmd_add_writer;


