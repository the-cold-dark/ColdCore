
new object $format: $tag;

var $root created_on = 837584154;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$format];
var $root manager = $format;

public method .new_tag() {
    arg name, flags, args;
    
    return pass(name, flags, args, tosym("do_" + (name.strip())));
};


