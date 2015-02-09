
new object $generator: $tag;

var $root created_on = 837584238;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$generator];
var $root manager = $generator;

public method .new_tag() {
    arg name, flags, args;
    
    return pass(name, flags, args, tosym("gen_" + (name.strip())));
};


