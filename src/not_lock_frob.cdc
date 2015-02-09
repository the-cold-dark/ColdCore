
new object $not_lock_frob: $not;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$not_lock_frob];
var $root manager = $not_lock_frob;

public method .lock_name() {
    arg lock, @type;
    
    [(type ?= 'literal)] = type;
    switch (type) {
        case 'literal:
            return ("(!" + ((lock[1]).lock_name(type))) + ")";
        default:
            return "not " + ((lock[1]).lock_name(type));
    }
};

public method .new_lock() {
    arg lock;
    
    if (type(lock) != 'frob)
        throw(~perm, "Argument is not a lock.");
    return (<this(), [lock]>);
};

public method .try() {
    arg lock, obj;
    
    return !((lock[1]).try(obj));
};


