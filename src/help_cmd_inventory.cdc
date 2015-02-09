
new object $help_cmd_inventory: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "inventory", "inventory"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["i?nventory"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays your name, your ", <$format, ["link", [["node", "$help_cmd_describe"]], ["description"], 'do_link]>, ", your state, and the contents of what your user is carrying. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">inventory\nVampire\nAn insane, poorly spelling creature.\nHe is wearing Cloak.\nHe is awake.\nHe is holding:\n        UI_stuff\n        parser\n        big birthday cake\n        list_of_places\nVampire's eyes do not glow from mojo.\n"], 'do_quote]>], 'do_dfn]>], #[['links, #[["description", "$help_cmd_describe"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["description", $help_cmd_describe]];
var $root created_on = 870926540;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_inventory];
var $root manager = $help_cmd_inventory;


