
new object $true_lock_frob: $true;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$true_lock_frob];
var $root manager = $true_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "yes";
};

public method .new_lock() {
    return (<this(), []>);
};

public method .try() {
    arg lock, obj;
    
    return 1;
};


