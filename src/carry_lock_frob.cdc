
new object $carry_lock_frob: $lock_frob;

var $root created_on = 855862163;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$carry_lock_frob];
var $root manager = $carry_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "carry:" + ((value[1]).name());
};

public method .new_lock() {
    arg obj;
    
    if (type(obj) != 'objnum)
        throw(~perm, "Argument is not a dbref.");
    return (<this(), [obj]>);
};

public method .try() {
    arg lock, obj;
    
    lock = lock[1];
    return (lock == obj) || ((lock in (obj.contents())) || ((obj == sender()) || ($sys.is_system(obj))));
};

public method .unparse() {
    arg rep;
    
    return "carry:" + (rep[1]);
};


