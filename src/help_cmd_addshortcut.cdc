
new object $help_cmd_addshortcut: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@add-shortcut|@as", "@add-shortcut|@as"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@add-s?hortcut|@as \"<shortcut>\" [to] \"<command>\" [on] <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This command adds a shortcut to a <command> on <object>. This is similar to the ", <$format, ["link", [["node", "$help_cmd_addcmd"]], ["@add-command"], 'do_link]>, " command, however, @add-shortcut allows you to add a shortcut to an existing command, with a different name or syntax. The scope of shortcuts is global, depending upon where it is added. A shortcut added to a command-ui object which others also use will be inherited by the other users (this is the primary difference between command shortcuts and command aliases). ", <$format, ["np", [], [], 'do_np]>, "The shortcut may include wildcards for where arguments are accepted (where it will match anything). These wildcards are defined using an ordered mechanism of a percent-sign and a number. An example would be the following shortcut, which defines two ordered wildcards of %1 and %2:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["\"page %1 with %2\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The command side of the definition must also include equivalent ordered wildcards, matching the same cards defined on the shortcut (but not necessarily in the same order). You can leave out wildcards on the command side. Wildcards on the shortcut side must be defined in order, starting from one. ", <$format, ["np", [], [], 'do_np]>, "A full example would be the shortcut of a dash (-) for paging:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@as \"-%1 %2\" to \"@page %1 with %2\" on $user.page_cmd"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "See also: ", <$format, ["link", [["node", "$help_cmd_delshortcut"]], ["@del-shortcut"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_aca"]], ["@add-command-alias"], 'do_link]>, ", ", <$format, ["link", [["node", "$help_cmd_dca"]], ["@del-command-alias"], 'do_link]>], #[['links, #[["@add-command", "$help_cmd_addcmd"], ["@del-shortcut", "$help_cmd_delshortcut"], ["@add-command-alias", "$help_cmd_aca"], ["@del-command-alias", "$help_cmd_dca"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["@add-command", $help_cmd_addcmd], ["@del-shortcut", $help_cmd_delshortcut], ["@add-command-alias", $help_cmd_aca], ["@del-command-alias", $help_cmd_dca]];
var $root created_on = 870589235;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_addshortcut];
var $root manager = $help_cmd_addshortcut;


