
new object $syslog_group: $core_group;

var $group group = #[[$daemon, 1], [$connection, 1], [$dns, 1], [$guest, 1], [$user, 1], [$body, 1], [$sys, 1], [$root, 1], [$login_interface, 1], [$http_interface, 1], [$connection_interface, 1]];
var $root created_on = 904656992;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$syslog_group];
var $root manager = $syslog_group;


