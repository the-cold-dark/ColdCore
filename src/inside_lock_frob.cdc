
new object $inside_lock_frob: $lock_frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$inside_lock_frob];
var $root manager = $inside_lock_frob;
var $root trusted = [];

public method .lock_name() {
    arg value, @type;
    
    return "inside:" + ((value[1]).name());
};

public method .new_lock() {
    arg obj;
    
    if (type(obj) != 'objnum)
        throw(~perm, "Argument is not a dbref.");
    return (<this(), [obj]>);
};

public method .try() {
    arg lock, obj;
    
    return ((lock[1]).contains(obj)) || ($sys.is_system(obj));
};


