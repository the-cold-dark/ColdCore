
new object $callback: $frob;

var $root created_on = 799275808;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$callback];
var $root manager = $callback;

public method .exec() {
    arg self, @args;
    
    return (self[1]).(self[2])(self[3], args);
};

public method .new() {
    arg method, static_args;
    
    return (<this(), [sender(), method, static_args]>);
};


