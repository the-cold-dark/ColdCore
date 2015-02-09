
new object $help_cmd_commands: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@commands", "@commands"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@com?mands <objref> [options]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays all the commands that <objref> has on it either directly, or from it's parents. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@commands Squeak +f\nRemote commands on Squeak the lemming:\n  \"step on <this>\"                                    .step_cmd()\n  \"beat the <this>\"                                   .beat_cmd()\n  \"beat <this>\"                                       .beat_cmd()\n  \"beat up the <this>\"                                .beat_cmd()\n  \"beat up <this>\"                                    .beat_cmd()\n  \"jump on the <this>\"                                .step_cmd()\n  \"jump on <this>\"                                    .step_cmd()\n  \"pet <this>\"                                        .pet_cmd()\n"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["np", [], [], 'do_np]>, " Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+f?ull"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows command followed by it's method."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+a?ll"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows all of <objref>'s commands, including those inherited from parents."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+l?ocal"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows any local commands that are defined on the object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+r?emote"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows any remote commands that are defined on the object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+s?hortcuts"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows any shortcuts that are defined on the object."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870925794;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_commands];
var $root manager = $help_cmd_commands;


