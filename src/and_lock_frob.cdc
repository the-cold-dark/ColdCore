
new object $and_lock_frob: $and;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$and_lock_frob];
var $root manager = $and_lock_frob;

public method .lock_name() {
    arg lock, @type;
    
    [(type ?= 'literal)] = type;
    switch (type) {
        case 'literal:
            return ((("(" + ((lock[1]).lock_name(type))) + " && ") + ((lock[2]).lock_name(type))) + ")";
        default:
            return (((lock[1]).lock_name(type)) + " and ") + ((lock[2]).lock_name(type));
    }
};

public method .new_lock() {
    arg lhs, rhs;
    
    if ((type(lhs) != 'frob) || (type(rhs) != 'frob))
        throw(~perm, "Arguments are not both frobs.");
    return (<this(), [lhs, rhs]>);
};

public method .try() {
    arg lock, obj;
    
    return ((lock[1]).try(obj)) && ((lock[2]).try(obj));
};


