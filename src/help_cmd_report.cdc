
new object $help_cmd_report: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@report", "@report"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@report"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command is used to report bugs within the system, @report will prompt the user for a description of the bug found.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_bugs"]], ["@bug"], 'do_link]>], #[['links, #[["@bug", "$help_cmd_bugs"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@bug", $help_cmd_bugs]];
var $root created_on = 870663118;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_report];
var $root manager = $help_cmd_report;


