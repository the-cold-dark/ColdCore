
new object $slate: $thing;

var $described prose = [];
var $has_name name = ['uniq, "Generic Slate", "the Generic Slate"];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$slate];
var $root manager = $slate;
var $slate connection = 0;
var $slate received_text = [];
var $slate remote_host = "";
var $slate remote_port = 0;
var $slate request_method = "";
var $thing gender = $gender_neuter;

protected method .connection() {
    return connection;
};

public method .connection_ending();

root method .init_slate() {
    connection = 0;
    remote_host = "";
    remote_port = 0;
    request_method = "";
    received_text = [];
};

protected method .received_text() {
    return received_text;
};

protected method .remote_host() {
    return remote_host;
};

protected method .remote_port() {
    return remote_port;
};

protected method .request_method() {
    return request_method;
};

protected method .send() {
    arg line;
    
    connection.send(line);
};

root method .uninit_slate() {
    connection = 0;
    remote_host = "";
    remote_port = 0;
    request_method = "";
    received_text = [];
};


