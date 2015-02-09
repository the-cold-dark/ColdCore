
new object $help_cmd_core: $help_cmds;

var $has_name name = ['prop, "@core", "@core"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@core <object>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Setup the specified object as a core object. This is used primarily for core development. It adds the ", <$format, ["tt", [], ["'core"], 'do_tt]>, " flag to the object, sets the object as its own manager and writer and removes any additional ownership."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848468664;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_core];
var $root manager = $help_cmd_core;


