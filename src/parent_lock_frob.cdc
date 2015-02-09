
new object $parent_lock_frob: $lock_frob;

var $root created_on = 856053423;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$parent_lock_frob];
var $root manager = $parent_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "parent:" + ((value[1]).name());
};

public method .new_lock() {
    arg obj;
    
    if (type(obj) != 'objnum)
        throw(~perm, "Argument is not a dbref.");
    return (<this(), [obj]>);
};

public method .try() {
    arg lock, obj;
    
    return (obj.has_ancestor(lock[1])) || ($sys.is_system(obj));
};


