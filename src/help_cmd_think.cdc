
new object $help_cmd_think: $help_cmds;

var $has_name name = ['prop, "think", "think"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The interaction command ", <$format, ["tt", [], ["think"], 'do_tt]>, " is used to think something out loud. For convenience, the percent character may also be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> think oops", <$format, ["br", [], [], 'do_br]>, "Brandon . o O ( oops )"], 'do_dfn]>, " ", <$format, ["dfn", [], ["> %I think everybody can see my thoughts", <$format, ["br", [], [], 'do_br]>, "Brandon . o O ( I think everybody can see my thoughts )"], 'do_dfn]>], #[['this, $help_cmd_think]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847043935;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_think];
var $root manager = $help_cmd_think;


