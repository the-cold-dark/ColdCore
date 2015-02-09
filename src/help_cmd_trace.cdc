
new object $help_cmd_trace: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@trace-method|@trace", "@trace-method|@trace"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@trace-method|@trace <method>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command allows a programmer to find out where a method ", <$format, ["link", [["node", "$help_func_pass"]], ["pass()"], 'do_link]>, "'s to. ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@trace .name\nMethod trace of $vampire.name():\n ----    6 $root.name([args])\n ----   55 $has_name.name([args])\n"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The first method listed is the top level method to which @trace was able to go back too. Following it, is each method farther away, until it can find no other matches."], #[['links, #[["pass()", "$help_func_pass"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["pass()", $help_func_pass]];
var $root created_on = 870647128;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_trace];
var $root manager = $help_cmd_trace;


