
new object $help_index_objects: $help_index;

var $db database = #[["List Library", $help_obj_list], ["Trie", $help_obj_trie], ["has_text", $help_obj_has_text], ["Colors", $help_cml_colors], ["Math Library", $help_obj_math], ["Integer", $help_obj_integer], ["Data Lib", $help_obj_data_lib], ["Object Lib", $help_obj_object_lib], ["Help Node", $help_obj_help_node], ["Code Lib", $help_obj_code_lib], ["Generic Map", $help_obj_generic_map], ["Command Cache", $help_obj_command_cache], ["World Time", $help_obj_world_time], ["Time", $help_obj_time], ["Robot", $help_obj_robot], ["@reactions", $help_obj_robot], ["@activate-reaction", $help_obj_robot], ["@deactivate-reaction", $help_obj_robot], ["@add-reaction", $help_obj_robot], ["Robot Methods", $help_obj_robot_methods], ["motd", $help_obj_motd], ["Mail List", $help_obj_mail_list], ["Float", $help_obj_float]];
var $has_name name = ['prop, "Objects", "Objects"];
var $help_index dirty = 2;
var $help_node body = <$ctext_frob, [[], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $registry stripped_characters = "!#%^&*()";
var $root created_on = 847917435;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_index_objects];
var $root manager = $help_index_objects;
var $root trusted = [$help_node];


