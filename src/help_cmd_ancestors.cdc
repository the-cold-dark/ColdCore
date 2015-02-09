
new object $help_cmd_ancestors: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@ancestors", "@ancestors"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@ancestors <objref> [<levels>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command shows an object's ancestors. If <level> is present, it will additionally recursively show the ancestors of each parent an object has, to the depth specified by <levels>.", <$format, ["p", [], [], 'do_p]>, "See also ", <$format, ["link", [["node", "$help_cmd_descendants"]], ["@descendants"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@ancestors $vampire 2\nAncestors of $vampire:2 levels:\n$vampire [-----] (MI)\n  $admin [*-mvcC]\n    $programmer [*-mvcC] (MI)\n  $antisocial [*fmvcC]\n    $user_interfaces [*fmvc]\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@descendants", "$help_cmd_descendants"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@descendants", $help_cmd_descendants]];
var $root created_on = 870646587;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_ancestors];
var $root manager = $help_cmd_ancestors;


