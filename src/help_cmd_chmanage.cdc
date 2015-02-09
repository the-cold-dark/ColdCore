
new object $help_cmd_chmanage: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@chmanage", "@chmanage"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@chman?age <objref> to <user>"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "Changes the object's manager."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870925778;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_chmanage];
var $root manager = $help_cmd_chmanage;


