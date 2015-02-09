
new object $help_cmd_dump: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@dump", "@dump"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@dump <objref> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Dumps the source code for a particular object, such that you can upload it to another server. When you @dump an object, all of the information about the object required to reproduce it is dumped to the screen. ", <$format, ["np", [], [], 'do_np]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+t?extdump"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists the code in ", <$format, ["link", [["node", "$help_coldc_textdump"]], ["textdump"], 'do_link]>, " format rather than ", <$format, ["link", [["node", "$help_cmd_program"]], ["@program"], 'do_link]>, " format."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+m?ethods"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists methods."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+v?ariables"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists variables."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+h?eader"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists headers."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["textdump", "$help_coldc_textdump"], ["@program", "$help_cmd_program"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["textdump", $help_coldc_textdump], ["@program", $help_cmd_program]];
var $root created_on = 870580692;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_dump];
var $root manager = $help_cmd_dump;


