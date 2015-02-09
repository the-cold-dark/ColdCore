
new object $help_cmd_chparent: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@chparents", "@chparents"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@chpar?ents <obj> to <parent> [, <parent>,...] "], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Changes the parents for <obj>."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870586634;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_chparent];
var $root manager = $help_cmd_chparent;


