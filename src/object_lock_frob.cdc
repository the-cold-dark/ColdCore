
new object $object_lock_frob: $lock_frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$object_lock_frob];
var $root manager = $object_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return (value[1]).name();
};

public method .new_lock() {
    arg obj;
    
    if (type(obj) != 'objnum)
        throw(~perm, "Argument is not a dbref.");
    return (<this(), [obj]>);
};

public method .try() {
    arg lock, obj;
    
    return ((lock[1]) == obj) || ((obj == sender()) || ($sys.is_system(obj)));
};

frob method .unparse() {
    arg obj;
    
    return toliteral(obj[1]);
};


