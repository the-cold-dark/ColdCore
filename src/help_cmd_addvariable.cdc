
new object $help_cmd_addvariable: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-v?ariable|@av", "@add-v?ariable|@av"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@add-v?ariable|@av <objref>,<variable> [=<default>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The purpose of @add-variable is to add variables to an <objref>, and optionally, set the variable's default value or type.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_delvariable"]], ["@del-v?ariable"], 'do_link]>, " ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@av $vampire,silly_names = [\"Brad\", \"Bruce\", \"Miro\", \"Brandon\"];\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@del-v?ariable", "$help_cmd_delvariable"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@del-v?ariable", $help_cmd_delvariable]];
var $root created_on = 870589271;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_addvariable];
var $root manager = $help_cmd_addvariable;


