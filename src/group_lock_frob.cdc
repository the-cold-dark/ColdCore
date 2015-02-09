
new object $group_lock_frob: $lock_frob;

var $dmi_data descriptions = #[];
var $root created_on = 1000919162;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$group_lock_frob];
var $root manager = $group_lock_frob;

public method .lock_name() {
    arg value, @type;
    
    return "group:" + ((value[1]).name());
};

public method .new_lock() {
    arg obj;
    
    if ((type(obj) != 'objnum) && (!(obj.is(group))))
        throw(~perm, "Argument is not a dbref or $group");
    return (<this(), [obj]>);
};

public method .parse_value() {
    arg value, who;
    var groups, g;
    
    if (((value.length()) > 1) && ((value[1]) == "$")) {
        if ((g = (| $object_lib.to_dbref(value) |)))
            return g;
    }
    if ((g = $group.match_descendants(value)))
        return g;
    throw(~match, ("Unable to find group named '" + value) + "'");
};

public method .try() {
    arg group, obj;
    
    return (group[1]).includes(obj);
};

public method .unparse() {
    arg rep;
    
    return "group:" + (rep[1]);
};


