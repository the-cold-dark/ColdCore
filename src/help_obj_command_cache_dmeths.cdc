
new object $help_obj_command_cache_dmeths: $help_obj_command_cache;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Creation and Destruction Methods", "Creation and Destruction Methods"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [["ind", "8"]], [<$format, ["dt", [], [".", <$format, ["method", [["command_cache.uninit_command_cache", 1]], ["uninit_command_cache"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Unlinks the cache client from any command module objects."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["command_cache.core_command_cache", 1]], ["core_command_cache"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Purges the cache when a core is extracted."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node links = #[];
var $root created_on = 887946526;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_command_cache_dmeths];
var $root manager = $help_obj_command_cache_dmeths;


