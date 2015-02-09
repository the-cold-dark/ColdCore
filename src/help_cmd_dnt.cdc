
new object $help_cmd_dnt: $help_cmds;

var $has_name name = ['prop, "@dnt|@del-name-template", "@dnt|@del-name-template"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@dnt|@del-name-template <template> [from] <target>"], 'do_tt]>, "` ", <$format, ["np", [], [], 'do_np]>, "Remove the given name template from the target object. The section ", <$format, ["link", [["node", "$help_app_names"]], ["Names"], 'do_link]>, " explains more about names and name templates."], #[['this, $help_cmd_dnt]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["Names", $help_app_names]];
var $root created_on = 856650064;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_dnt];
var $root manager = $help_cmd_dnt;


