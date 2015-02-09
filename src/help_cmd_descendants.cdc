
new object $help_cmd_descendants: $help_cmds;

var $has_name name = ['prop, "@descendants", "@descendants"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: `", <$format, ["tt", [], ["@descend <object> [options]"], 'do_tt]>, "`"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Options can be: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+", <$format, ["i", [], ["N"], 'do_i]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Descend ", <$format, ["i", [], ["N"], 'do_i]>, " levels (zero or more)"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+a?ll"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Descend all levels"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+o?nly"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Only show objects with the specified flags"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+n?ot"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Only show objects that do not have the specified flags"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["+r?edundant"], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Redundantly show objects in the heirarchy"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 855119873;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_descendants];
var $root manager = $help_cmd_descendants;


