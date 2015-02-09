
new object $frob: $core;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$frob];
var $root manager = $frob;

frob method .destroy() {
    arg this;
    
    throw(~perm, "You cannot destroy a frob, try 'discard'");
};

frob method .has_ancestor() {
    arg this, ancestor;
    
    return (> pass(ancestor) <);
};

frob method .is() {
    arg this, ancestor;
    
    return (> pass(ancestor) <);
};

public method .new() {
    return (<this(), #[]>);
};

public method .new_with() {
    arg value;
    
    return (<this(), value>);
};

public method .to_frob() {
    arg value;
    
    // this differs from .new in it's application
    return (<this(), value>);
};

public method .unparse() {
    arg rep;
    
    return ((("<" + this()) + ", ") + rep) + ">";
};

frob method .value(): nooverride  {
    arg value;
    
    return value;
};


