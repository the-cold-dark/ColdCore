
new object $help_admin: $help_coldcore;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Administration", "Administration"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Unfortunately, this document is still in development. For now, see:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["a", [["href", "http://www.cold.org/Software/ColdCore/newadmin.html"]], ["http://www.cold.org/Software/ColdCore/newadmin.html"], 'do_a]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "In addition, the following documents are also defined:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_traceback_recording"]], ["Traceback Recording"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["How tracebacks from core objects are handled"], 'do_dd]>], 'do_dl]>], #[['links, #[["Traceback Recording", "$help_traceback_recording"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Traceback Recording", #-178495]];
var $root created_on = 868128023;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_admin];
var $root manager = $help_admin;


