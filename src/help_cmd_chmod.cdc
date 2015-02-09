
new object $help_cmd_chmod: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@chmod|@mmod|@omod|@chflags", "@chmod|@mmod|@omod|@chflags"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@mmod <flags> <method> [<method ..]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@omod <flags> <object> [<object ..]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@chmod <flags> <object> [<object .]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@chflag <flags> <object> [<object ..]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "These commands modify access flags on the object or method speficied. All of these are effectively aliases of each other, and are named for easy rememberance as to their function. For the purposes of this help, @chflag will be used, but all the other commands operate the same way. ", <$format, ["np", [], [], 'do_np]>, "The following table lists which flags may be used with each type of object or method. ", <$format, ["np", [], [], 'do_np]>, " Flags can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["method ", <$format, ["link", [["node", "$help_coldc_methods_access"]], ["access"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["d?river, pri?vate, pro?tected, pu?blic, r?oot, fr?ob"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["method ", <$format, ["link", [["node", "$help_coldc_methods_flags"]], ["behavior"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["no?override, l?ocked, na?tive, fo?rked"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["objects"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["cod?e, cor?e, fe?rtile, m?ethods, v?ariables"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["access", "$help_coldc_methods_access"], ["behavior", "$help_coldc_methods_flags"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["access", $help_coldc_methods_access], ["behavior", $help_coldc_methods_flags]];
var $root created_on = 870646867;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_chmod];
var $root manager = $help_cmd_chmod;


