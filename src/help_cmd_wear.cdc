
new object $help_cmd_wear: $help_cmds;

var $has_name name = ['prop, "wear|shed|remove", "wear|shed|remove"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["wear <article>"], 'do_tt]>, " OR ", <$format, ["tt", [], ["shed|remove <article>"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "Wear or remove an article of clothing. You must be holding (or wearing, as applicable) the article of clothing. The clothing must also be a $wearable_frob. You can create clothing with the ", <$format, ["link", [["node", "$help_cmd_new"]], ["@new"], 'do_link]>, " cmd. For example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@new $wearable_frob named Trenchcoat", <$format, ["br", [], [], 'do_br]>, "wear trenchcoat", <$format, ["br", [], [], 'do_br]>, "shed trenchcoat"], 'do_dfn]>], #[['this, $help_cmd_wear]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@new", $help_cmd_new]];
var $root created_on = 856032839;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_wear];
var $root manager = $help_cmd_wear;


