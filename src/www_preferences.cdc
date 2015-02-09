
new object $www_preferences: $user_interfaces;

var $command_cache modules = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 867669920;
var $root defined_settings = #[["www-show-line-num", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["www-show-descriptions", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["www-show-methods", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["www-show-variables", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core];
var $root inited = 1;
var $root managed = [$www_preferences];
var $root manager = $www_preferences;
var $root settings = #[["www-show-line-num", 0], ["www-show-descriptions", 0], ["www-show-methods", 0], ["www-show-variables", 0]];

public method .set_www_preferences() {
    arg name, value;
    
    (> .perms(caller(), $page_web_prefs, this()) <);
    .set_setting(name, $www_preferences, value);
};


