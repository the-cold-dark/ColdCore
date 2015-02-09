
new object $help_cmd_hwrite: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@help-write|@hwrite|@hw", "@help-write|@hwrite|@hw"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@help-write|@hw?rite [<help node>]"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@help-write sets the ", <$format, ["link", [["node", "$help_cml"]], ["CML"], 'do_link]>, " text of a help node. Without any arguments, @hwrite will attempt to set the text on the last help node you viewed. With an argument of <help node>, the command will set the text for that help entry if possible."], #[['links, #[["CML", "$help_cml"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["CML", $help_cml]];
var $root created_on = 869368839;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_hwrite];
var $root manager = $help_cmd_hwrite;


