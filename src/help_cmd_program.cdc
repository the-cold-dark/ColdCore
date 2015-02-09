
new object $help_cmd_program: $help_cmds;

var $has_name name = ['prop, "@program", "@program"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@program <objref>.<method> [options] [with <any>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Sets the code for <method> on <object>. ", <$format, ["np", [], [], 'do_np]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+warnings"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Do not warn about recursion."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+edited[=message]"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Set or override the edited comment. (admin only)."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+access=permission"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Set the method access to one of public, protected, private, root or driver."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+flags=flags"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Set the flags to some of nooverride, locked, fork or native."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Optionally, 'with' preposition causes it to read the code from the command line instead of prompting the user for it."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 838059477;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_program];
var $root manager = $help_cmd_program;


