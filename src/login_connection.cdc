
new object $login_connection: $inbound_connection;

var $connection active = 0;
var $connection buffer = `[];
var $connection daemon = 0;
var $connection host = "";
var $connection interface = $login_interface;
var $connection line_buffer = [];
var $connection read_block = 0;
var $connection started_at = 0;
var $connection timeout = 0;
var $root created_on = 809051865;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$login_connection];
var $root manager = $login_connection;
var $root quota_exempt = 1;

public method .local_echo_off() {
    (sender() == (.interface())) || (> .perms(sender()) <);
    cwrite(`[255, 251, 1]);
};

public method .local_echo_on() {
    (sender() == (.interface())) || (> .perms(sender()) <);
    cwrite(`[255, 252, 1]);
};


