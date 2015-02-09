
new object $help_cmd_list: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@list", "@list"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@list <objref> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Lists the source code for a particular method. ", <$format, ["np", [], [], 'do_np]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+n?umbers"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Displays line numbers next to each line of source."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+t?extdump"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists the code in ", <$format, ["link", [["node", "$help_coldc_textdump"]], ["textdump"], 'do_link]>, " format rather than ", <$format, ["link", [["node", "$help_cmd_program"]], ["@program"], 'do_link]>, " format."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["textdump", "$help_coldc_textdump"], ["@program", "$help_cmd_program"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["textdump", $help_coldc_textdump], ["@program", $help_cmd_program]];
var $root created_on = 865217221;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_list];
var $root manager = $help_cmd_list;


