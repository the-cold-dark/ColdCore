
new object $help_cmd_grep: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@grep", "@grep"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@grep [options] <regexp> <object> <object>..."], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows you to search through the database for items matching the ", <$format, ["link", [["node", "$help_coldc_regexp"]], ["regexp"], 'do_link]>, ". Depending on the options selected, <object> may be either the root object to start searching from, or one (or more) of the individual objects to search. ", <$format, ["np", [], [], 'do_np]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+d?escend"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Start searching from the following <object> and work down it's descendants list."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+f?ull"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists the method <regexp> was found in, as well as the line that contains the <regexp>."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+l?ist"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists the methods the <regexp> was found in."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+r?eplace-with=<text>"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Text to replace item matched by <regexp> with."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The following example will search through the database, starting with the $root object, and progress down it's descendants list searching for .tell. The numbers following the method names, are the line numbers within those methods that contain the <regexp>: ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@grep +d .tell $root\nSearching for \".tell\"...\n$root.uninit_root(): 25\n$root.initialize(): 16, 22 and 23\n$root.uninitialize(): 16, 17, 18, 27, 28, 30, 31, 32, 45, 46, 47, 55, 56, 57, 58 and 59\n$root.add_method(): 15\n$root.debug(): 12\n..\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Caution: It is advised that you don't descend from $root very often, as this tends to lag the server."], #[['links, #[["regexp", "$help_coldc_regexp"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["regexp", $help_coldc_regexp]];
var $root created_on = 870647047;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_grep];
var $root manager = $help_cmd_grep;


