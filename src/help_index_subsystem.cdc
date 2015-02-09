
new object $help_index_subsystem: $help_index;

var $db database = #[["Updates", $help_updates], ["Events", $help_sys_events], ["Editor", $help_sys_editor], ["Channels", $help_sys_channels], ["Messages", $help_sys_message], ["Word Generator", $help_sys_word], ["Message Propagation", $help_msg_prop], ["Ranges", $help_ranges], ["Bad Commands", $help_sys_bad_commands], ["Mail System", $help_mail], ["Administrators", $help_administrators], ["Admins", $help_administrators], ["Command Parsing System", $help_sys_parser], ["Command Parser", $help_sys_parser], ["Command Modules", $help_parser_command_modules]];
var $has_name name = ['prop, "Subsystems", "Subsystems"];
var $help_index dirty = 1;
var $help_node body = <$ctext_frob, [[], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $registry stripped_characters = "!#$%^&*()";
var $root created_on = 847916269;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_index_subsystem];
var $root manager = $help_index_subsystem;
var $root trusted = [$help_node];


