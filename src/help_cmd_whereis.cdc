
new object $help_cmd_whereis: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@whereis|@where-is", "@whereis|@where-is"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: `", <$format, ["tt", [], ["@where-is <user>[,<user>...]"], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "The command prints out the location of each user in the list. It only prints the realm, not the exact room."], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870926362;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_whereis];
var $root manager = $help_cmd_whereis;


