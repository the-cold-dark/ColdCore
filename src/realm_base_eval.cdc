
new object $realm_base_eval: $bs_eval;

var $root created_on = 847528368;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$realm_base_eval];
var $root manager = $realm_base_eval;

public method .gen_daynight() {
    arg vars, flags, args;
    var v, i, len, n;
    
    v = vars['daytime];
    return [[tostr(v[3])], vars];
};

public method .gen_hour() {
    arg vars, flags, args;
    var v, i, len, n;
    
    v = vars['daytime];
    return [[tostr(v[1])], vars];
};

public method .gen_light() {
    arg vars, flags, args;
    var v, i, len, n;
    
    v = vars['daytime];
    return [[tostr(v[2])], vars];
};


