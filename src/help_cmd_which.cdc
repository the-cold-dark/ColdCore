
new object $help_cmd_which: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@which", "@which"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["b", [], ["PROGRAMMER COMMAND"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@which <text>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "@which searches for any command in your caches which has <text> in the command name. The full template and method is printed for each match found. ", <$format, ["np", [], [], 'do_np]>, "Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["> @which help\nCommands matching the template \"help\":\n  @hl?ist|@help-list <any>           $programmer.help_list_cmd()\n  @hw?rite|@help-write <any>         $programmer.help_write_cmd()\n  @nh?n|@new-help-node <any:+n?      $programmer.new_help_node_cmd()\n  help <any>                         $bad_commands.old_command_cmd()\n  @help <any>                        $help_ui.help_cmd()\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870565854;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_which];
var $root manager = $help_cmd_which;


