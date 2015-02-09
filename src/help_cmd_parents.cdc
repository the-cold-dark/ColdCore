
new object $help_cmd_parents: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@parents", "@parents"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@par?ents <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays the name, flags, size, and manager of <objref>'s parents.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_children"]], ["@children"], 'do_link]>, " ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@parents $vampire\nParents of Vampire ($vampire):\n#  Name                         Flags   Size   Manager\n12 $admin (Generic Admin)       *-mvcC  40389  $admin (Generic Admin)\n16 $antisocial                  *fmvcC  9756   $antisocial\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@children", "$help_cmd_children"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@children", $help_cmd_children]];
var $root created_on = 870660071;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_parents];
var $root manager = $help_cmd_parents;


