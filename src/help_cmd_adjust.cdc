
new object $help_cmd_adjust: $help_cmds;

var $has_name name = ['prop, "@adjust", "@adjust"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["ADMIN COMMAND"], 'do_b]>, " ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@adjust|@promote <user> to <any>"], 'do_tt]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Used to change a user's class from/to any of the following: ", <$format, ["ul", [], [<$format, ["li", [], ["user"], 'do_li]>, <$format, ["li", [], ["builder"], 'do_li]>, <$format, ["li", [], ["programmer"], 'do_li]>, <$format, ["li", [], ["admin"], 'do_li]>], 'do_ul]>, " ", <$format, ["p", [], [], 'do_p]>, "Example: ", <$format, ["p", [], [], 'do_p]>, " ", <$format, ["dfn", [], ["@promote Bob to a programmer"], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "If the user was originally a guest it will create a password and email it to the user. It uses the email address they specified upon guest connect."], #[['this, $help_cmd_adjust]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 848119776;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_adjust];
var $root manager = $help_cmd_adjust;


