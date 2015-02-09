
new object $help_cmd_undefsetting: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@undef-setting|@undefine-setting", "@undef-setting|@undefine-setting"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@undef-setting|@undefine-setting <definer>:<setting>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Removes the <setting> from the object represented by <definer>. ", <$format, ["np", [], [], 'do_np]>, "See also: ", <$format, ["link", [["node", "$help_cmd_defsetting"]], ["@define-setting"], 'do_link]>], #[['links, #[["@define-setting", "$help_cmd_defsetting"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@define-setting", $help_cmd_defsetting]];
var $root created_on = 870647179;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_undefsetting];
var $root manager = $help_cmd_undefsetting;


