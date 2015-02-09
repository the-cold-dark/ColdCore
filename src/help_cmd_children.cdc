
new object $help_cmd_children: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@children|@kids", "@children|@kids"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["BUILDER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@child?ren|@kids <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays the name, flags, size, and manager of <objref>'s children.", <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_parents"]], ["@parents"], 'do_link]>, " ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@children $admin\nChildren of $admin (Generic Admin):\n#  Name                         Flags   Size   Manager\n2  $brian (Brian)               --m-c   3749   $brian (Brian)\n3  $user_ken (Ken)              -----   2671   $user_ken (Ken)\n2  $miro (Miro)                 -----   7799   $miro (Miro)\n3  $user_bruce (Bruce)          -----   4346   $user_bruce (Bruce)\n2  $vampire (Vampire)           -----   6581   $vampire (Vampire)\n1  $brandon (Brandon)           --m--   5550   $brandon (Brandon)\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@parents", "$help_cmd_parents"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@parents", $help_cmd_parents]];
var $root created_on = 870660012;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_children];
var $root manager = $help_cmd_children;


