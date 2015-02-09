
new object $help_app_wearing: $help_appearance;

var $has_name name = ['prop, "Wearing", "Wearing"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Any virtually alive item (something which is descended from the ", <$format, ["tt", [], ["$body"], 'do_tt]>, " object) can wear things--generally clothing. Anything worn is a ", <$format, ["i", [], ["Wearable Frob"], 'do_i]>, ", and must be from the object ", <$format, ["tt", [], ["$wearable_frob"], 'do_tt]>, " or one of its descendants. A new article of clothing can be created by typing:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@new $wearable_frob named Trenchcoat"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "After it is created you will be holding it. At this point it is worn with the command ", <$format, ["link", [["node", "$help_cmd_wear"]], ["wear"], 'do_link]>, " and removed with the command ", <$format, ["link", [["node", "$help_cmd_wear"]], ["shed"], 'do_link]>, ". Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["wear trenchoat"], 'do_dfn]>], #[['this, $help_app_wearing]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["wear", $help_cmd_wear], ["shed", $help_cmd_wear]];
var $help_node nolist = 0;
var $root created_on = 856649225;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_app_wearing];
var $root manager = $help_app_wearing;


