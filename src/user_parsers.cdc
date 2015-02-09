
new object $user_parsers: $misc;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$user_parsers];
var $root manager = $user_parsers;
var $root trusted = [];
var $user_parsers priority = 0;

public method .parse() {
    arg user, str, next_parser, @other_parsers;
    
    // Minimum parser routine.
    return next_parser.parse(user, str, @other_parsers);
};

public method .priority() {
    return priority || 1000;
};

public method .set_priority() {
    arg new;
    
    (> .perms(sender(), 'manager) <);
    priority = new;
};


