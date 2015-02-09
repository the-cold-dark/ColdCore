
new object $logic_frob: $frob;

var $logic_frob token = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$logic_frob];
var $root manager = $logic_frob;
var $root trusted = [];

public method .set_token() {
    arg new;
    
    (> .perms(sender(), 'manager) <);
    token = new;
};

public method .token() {
    return token;
};

public method .try() {
    arg @args;
    
    return 0;
};


