
new object $help_sys_editor: $help_sys;

var $has_name name = ['prop, "Editor", "Editor"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ColdCore Editor is an integrated system, giving the ability to to edit methods or other data through a builtin line editor or by using your own local editor through MCP. Local editing is controlled through the local-editor setting (it can be set to either ", <$format, ["tt", [], ["none"], 'do_tt]>, " or ", <$format, ["tt", [], ["mcp"], 'do_tt]>, ", such as: ", <$format, ["tt", [], ["@set local-editor=mcp"], 'do_tt]>, "). Each user may have multiple editor sessions. Any coldcore system can create editor session for a user.", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["link", [["node", "$help_node_editor_invoking"]], ["Invoking"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Comamnds used to invoke the editor"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_editor_commands"]], ["Commands"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Editor commands"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_node_editor_programming"]], ["Programming"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Editor: The Programmer's view"], 'do_dd]>], 'do_dl]>], #[['this, $help_sys_editor]]]>;
var $help_node group = 1;
var $help_node index = $help_index_subsystem;
var $help_node links = #[["Invoking", $help_node_editor_invoking], ["Commands", $help_node_editor_commands], ["Programming", $help_node_editor_programming]];
var $help_node nolist = 0;
var $root created_on = 840585945;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_editor];
var $root manager = $help_sys_editor;


