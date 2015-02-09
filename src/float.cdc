
new object $float: $libraries;

var $dmi_data descriptions = #[];
var $float powers_of_ten = [10.0, 100.0, 1000.0, 10000.0, 100000.0, 1e+06];
var $root created_on = 909982362;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_float;
var $root inited = 1;
var $root managed = [$float];
var $root manager = $float;

public method .ceiling() {
    arg float;
    
    return tofloat(toint(float) + 1);
};

public method .floor() {
    arg float;
    
    return tofloat(toint(float));
};

public method .fractional_part() {
    arg float;
    
    return abs(float - toint(float));
};

public method .log() {
    arg base, value;
    
    return log(value) / log(base);
};

public method .round() {
    arg float;
    
    return round(float);
};

public method .round_to() {
    arg float, places;
    var place_value;
    
    if ((places < 1) || (places > 6))
        throw(~range, "Second argument must between 1 and 6.");
    place_value = powers_of_ten[places];
    return round(float * place_value) / place_value;
};

public method .to_integer() {
    arg float;
    
    return toint(float);
};


