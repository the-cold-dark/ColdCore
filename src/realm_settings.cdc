
new object $realm_settings: $foundation;

var $root created_on = 854028767;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root defined_settings = #[["map-position", #[['get, ['get_realm_setting]], ['parse, ['parse_map_position]], ['format, ['format_map_position]]]], ["propagate", #[['get, ['get_realm_setting]], ['parse, ['is_propagator]], ['format, ['format_propagator]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$realm_settings];
var $root manager = $realm_settings;
var $root settings = #[["propagate", 0], ["map-position", 0]];

root method .core_realm_settings() {
    .set_setting("map-position", definer(), "none");
    .set_setting("propagate", definer(), "none");
};

public method .format_map_position() {
    arg value;
    
    if (!value)
        return "none";
    return "window %l, %l tag %l on %l".format(@value);
};

public method .get_realm_setting() {
    arg name, definer, @args;
    var v, t;
    
    t = this();
    if (.has_ancestor($place)) {
        if ((.settings()).contains(name))
            return .get_local_setting(name, definer);
        return (.realm()).get_realm_setting(name, definer, @args);
    } else if ((.settings()).contains(name)) {
        return .get_local_setting(name, definer);
    } else {
        return ((.parents())[1]).get_realm_setting(name, definer, @args);
    }
};

public method .parse_map_position() {
    arg value;
    
    if (value in ["n", "no", "none", "0"])
        return 0;
    if (type(value) == 'list)
        value = value.join();
    value = (| (value.match_pattern("window *,* tag * on *")).mmap('trim) |);
    if (!value)
        throw(~parse, "Syntax: window <x>,<y> tag <tag> on <mapobject>");
    return (> [toint(value[1]), toint(value[2]), value[3], $object_lib.to_dbref(value[4])] <);
};

public method .will_propagate() {
    return .get_setting("propagate", definer());
};


