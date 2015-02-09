
new object $smtp_daemon: $daemon;

var $daemon connection = $smtp_connection;
var $daemon current_port = 1125;
var $daemon listen = [[1125]];
var $root created_on = 849170427;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$smtp_daemon];
var $root manager = $smtp_daemon;
var $smtp_daemon msg_id = 352;

public method .get_msg_id() {
    msg_id++;
    return msg_id;
};


