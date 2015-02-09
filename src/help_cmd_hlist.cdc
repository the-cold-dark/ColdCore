
new object $help_cmd_hlist: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@help-list|@hlist|@hl", "@help-list|@hlist|@hl"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@help-list|@hl [<objref> | <help node>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@help-list allows you to view the ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, " text of the last help entry you viewed, unless you selected an objref or help node when you entered the command."], #[['links, #[["CML", "$help_cml"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["CML", $help_cml]];
var $root created_on = 869368081;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_hlist];
var $root manager = $help_cmd_hlist;


