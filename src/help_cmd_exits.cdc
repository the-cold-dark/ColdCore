
new object $help_cmd_exits: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@ways|@exits", "@ways|@exits"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: '", <$format, ["tt", [], ["@ways"], 'do_tt]>, "' ", <$format, ["np", [], [], 'do_np]>, "@ways command prints the exits from the current room. Its exact formatting depends on the ", <$format, ["tt", [], ["exit-style"], 'do_tt]>, " setting on the player (can be one of none, brief, template?s, long or verbose)."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926312;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_exits];
var $root manager = $help_cmd_exits;


