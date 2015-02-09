
new object $help_ranges: $help_sys;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Ranges", "Ranges"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Ranges are used to specify a set of numbers to identify which part of a set is the target of the operation. ", <$format, ["np", [], [], 'do_np]>, "They are relatively simple, with a few special identifiers with significant meaning.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["<begin>-<end>"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, <$format, ["tt", [], ["<begin>"], 'do_tt]>, " specifies where the range should begin and will be either a number or one of the special identifiers. ", <$format, ["tt", [], ["<end>"], 'do_tt]>, " specifies the end of the range and again, will be either a number of one of the special identifiers.", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], ["Special Identifiers: ", <$format, ["dt", [], [<$format, ["tt", [], ["'^'"], 'do_tt]>], 'do_dt]>, <$format, ["dd", [], ["First item"], 'do_dd]>, <$format, ["dt", [], [<$format, ["tt", [], ["'.'"], 'do_tt]>], 'do_dt]>, <$format, ["dd", [], ["Current position"], 'do_dd]>, <$format, ["dt", [], [<$format, ["tt", [], ["'$'"], 'do_tt]>], 'do_dt]>, <$format, ["dd", [], ["Last item"], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node group = 1;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $root created_on = 865132499;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_ranges];
var $root manager = $help_ranges;


