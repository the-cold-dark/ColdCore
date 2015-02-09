
new object $help_cmd_quota: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@quota", "@quota"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@quota <object> to <any:+e?xempt>"], 'do_tt]>, <$format, ["p", [], [], 'do_p]>, "This command sets an objects quota to either a numeric amount or exempt or non-exempt."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 887772510;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_quota];
var $root manager = $help_cmd_quota;


