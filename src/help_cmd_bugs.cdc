
new object $help_cmd_bugs: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@bugs|@pr|@problems", "@bugs|@pr|@problems"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@bug?s"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This is a meta command which places you in a menu-based bug management system. From within this system you have the option to scan unclaimed open bugs reports, scan bugs you are currently working on, scan all open bug reports, review all repaired bugs, all non-archived/non-dismissed and report a new bug. ", <$format, ["np", [], [], 'do_np]>, "Bugs that enter this system usually enter in one of two ways, from the @bugs report new bug option, and from ", <$format, ["link", [["node", "$help_cmd_report"]], ["@report"], 'do_link]>, "."], #[['links, #[["@report", "$help_cmd_report"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@report", $help_cmd_report]];
var $root created_on = 870659838;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_bugs];
var $root manager = $help_cmd_bugs;


