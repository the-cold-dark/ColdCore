
new object $help_cmd_move: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@move|@mv|@copy|@cp", "@move|@mv|@copy|@cp"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@move|@mv <objref> to <location>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@move|@mv <objref>.<method1> to <objref>.<method2> [options]"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@copy|@cp <objref>.<method1> to <objref>.<method2> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If you are a builder, @move will transport <objref> to <location>, assuming you pass all the permission checks. You can not, however, move a user into an object, although you can move an object into a user. ", <$format, ["np", [], [], 'do_np]>, "For programmers, @move moves <method1> to <method2> removing <method1> from it's original location. @copy copies <method1> to <method2> without removing <method1> from it's original location. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n>@move Help TODO to $courtyard\nHelp TODO suddenly disappears.\nYou move Help TODO from The Pit to the Courtyard.\n\n>@move $vampire.pulse to $vampire.old_pulse\nYou move $vampire.pulse() to $vampire.old_pulse().\n\n>@copy $vampire.smurf_cmd to $vampire.tmp_smurf_cmd\nYou copy $vampire.smurf_cmd() to $vampire.tmp_smurf_cmd().\n\n"], 'do_quote]>], 'do_dfn]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+c?omment"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Sets the comment for the copy or move."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870580758;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_move];
var $root manager = $help_cmd_move;


