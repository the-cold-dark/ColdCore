
new object $help_cmd_id: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@id", "@id"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax ", <$format, ["tt", [], ["@id <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The @id command provides summary information similar to the provided by ", <$format, ["link", [["node", "$help_cmd_display"]], ["@display"], 'do_link]>, ". However, there are no options to list variables, or methods. @id provides the following information as a one line summary: ", <$format, ["np", [], [], 'do_np]>, "$objref (objref name) [permissions] [parents] size ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, " ", <$format, ["dfn", [], [<$format, ["quote", [], [">@id $vampire\n$vampire (Vampire) [-----] [$admin, $antisocial] 5924 bytes\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["@display", "$help_cmd_display"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@display", $help_cmd_display]];
var $root created_on = 870647065;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_id];
var $root manager = $help_cmd_id;


