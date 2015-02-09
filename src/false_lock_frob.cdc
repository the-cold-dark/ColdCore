
new object $false_lock_frob: $false;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$false_lock_frob];
var $root manager = $false_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "no";
};

public method .new_lock() {
    return (<this(), []>);
};

public method .try() {
    arg lock, obj;
    
    return 0;
};


