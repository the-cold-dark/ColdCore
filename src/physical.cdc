
new object $physical: $described, $event_handler;

var $described prose = [];
var $has_name name = ['uniq, "Generic Physical Object", "the Generic Physical Object"];
var $physical visibility = 0;
var $root created_on = 796268969;
var $root defined_settings = #[["visibility", #[['get, ['visibility]], ['set, ['set_visibility]], ['parse, ['is_type, 'integer]]]]];
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$physical];
var $root manager = $physical;
var $root trusted = [];

public method .check_location() {
    arg sender;
    
    if ((.location()) != (sender.location()))
        throw(~location, "It's too far away!");
};

public method .is_visible_to() {
    arg whom;
    
    return (.visibility()) >= ((whom.location()).darkness());
};

public method .set_visibility() {
    arg name, definer, value, @args;
    
    (> .perms(sender()) <);
    visibility = value;
};

public method .visibility() {
    arg @args;
    
    return visibility;
};

public method .vr_examine();


