
new object $login_daemon: $daemon;

var $daemon connection = $login_connection;
var $daemon current_port = 1138;
var $daemon listen = [[1138]];
var $root created_on = 809051992;
var $root defined_settings = #[["creation-disabled-msg", #[]], ["creation-allowed", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["guests-allowed", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["guests-disabled-msg", #[]]];
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$login_daemon];
var $root manager = $login_daemon;
var $root settings = #[["creation-disabled-msg", "Sorry, character creation is disabled."], ["creation-allowed", 1], ["guests-allowed", 1], ["guests-disabled-msg", "Sorry, guests are disabled."]];

root method .core_login_daemon() {
    .set_setting("creation-allowed", $login_daemon, "yes");
};


