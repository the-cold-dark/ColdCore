
new object $owner_lock_frob: $lock_frob;

var $root created_on = 847067045;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$owner_lock_frob];
var $root manager = $owner_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "owner:" + ((value[1]).name());
};

public method .new_lock() {
    arg obj;
    
    if (type(obj) != 'objnum)
        throw(~perm, "Argument is not a dbref.");
    return (<this(), [obj]>);
};

public method .try() {
    arg lock, obj;
    
    return ((lock[1]) in (obj.owners())) || ($sys.is_system(obj));
};


