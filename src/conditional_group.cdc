
new object $conditional_group: $group;

var $group group = <$false_lock_frob, #[]>;
var $root created_on = 904657262;
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core];
var $root inited = 1;
var $root managed = [$conditional_group];
var $root manager = $conditional_group;

public method .add_to_group() {
    arg target;
    
    // do something, quick... perhaps throw an error
    throw(~invlogic, "You can only set conditional groups with @set group:group=...");
};

public method .del_from_group() {
    arg target;
    
    // do something, quick... perhaps throw an error 
    throw(~invlogic, "You can only set conditional groups with @set group:group=...");
};

root method .format_group() {
    arg value;
    var unparse;
    
    unparse = value.unparse();
    if (unparse == "yes")
        return "anybody";
    else if (unparse == "no")
        return "nobody";
    return unparse;
};

public method .includes() {
    arg target;
    
    if (!((.get_group()).try(target))) {
        if (this() == definer())
            return $sys.is_system(target);
        return (parents()[1]).includes(target);
    }
    return 1;
};

root method .init_conditional_group() {
    .set_group(0, 0, ['set, $false_lock_frob.new()]);
};

public method .parse_group() {
    arg value, @args;
    
    if (value in ["none", "nobody"])
        value = "no";
    else if (value in ["anybody", "everybody"])
        value = "yes";
    return ['set, (> $lock_frob.parse(value, user() || this()) <)];
};

protected method .set_group() {
    arg name, definer, value;
    var list;
    
    // just ignore any itemlist stuff
    value = value[2];
    if ((type(value) != 'frob) || (!(frob_class(value).is($logic_frob))))
        throw(~invlogic, "Conditional groups must be set as $logic_frobs");
    pass(name, definer, ['set, value]);
};


