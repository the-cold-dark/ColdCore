
new object $settings: $utilities;

var $root created_on = 857619568;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$settings];
var $root manager = $settings;

public method .format_boolean() {
    arg value;
    
    if (value)
        return "yes";
    else
        return "no";
};

public method .format_itemlist() {
    arg data;
    
    return data.join(", ");
};

public method .format_object() {
    arg value;
    
    return value.namef('xref);
};

public method .format_onoff() {
    arg value;
    
    if (value)
        return "on";
    else
        return "off";
};

public method .format_propagator() {
    arg value;
    
    return (type(value) == 'frob) ? (value.format()) : "no";
};

public method .is_boolean() {
    arg value;
    var bool;
    
    if ((bool = value.is_boolean()) == (-1))
        throw(~invtype, ("Value \"" + value) + "\" is not boolean.");
    return bool;
};

public method .is_propagator() {
    arg value;
    
    return (> $propagator.new_with(value) <);
};

public method .is_type() {
    arg value, type, @subtypes;
    var i;
    
    if (type(value) == type)
        return value;
    switch (type) {
        case 'list:
            value = fromliteral(value);
            if (type(value) != 'list)
                throw(~type, "Value is unparsable as list.");
            if (subtypes)
                value = map i in (value) to ((> .is_type(i, subtypes[1]) <));
            return value;
        case 'dictionary:
            value = fromliteral(value);
            if (type(value) != 'dictionary)
                throw(~type, "Value is unparsable as dictionary.");
            if (subtypes)
                value = hash i in (value) to ((> [.is_type(i, subtypes[1]), .is_type(i, subtypes[2])] <));
            return value;
        case 'integer:
            if (value.is_numeric())
                return toint(value);
            else
                throw(~type, "Value is unparsable as integer.");
        case 'symbol:
            if ((type(value) == 'string) && (((value.length()) > 1) && ((value[1]) == "'")))
                value = value.subrange(2);
            if (type((| tosym(value) |)) == 'symbol)
                return tosym(value);
            else
                throw(~type, "Value is unparsable as a symbol.");
        case 'objnum:
            return (> $object_lib.to_dbref(value) <);
        default:
            return value;
    }
};

public method .is_valid_type() {
    arg type;
    
    return ($data_lib.is_valid_type(type)) || (type in (.valid_types()));
};

public method .parse_itemlist() {
    arg value, method, @args;
    var action, list, item, out;
    
    if (value && ((value[1]) in ["+", "-"])) {
        if ((value[1]) == "-")
            action = 'del;
        else
            action = 'add;
        list = [substr(value, 2)];
    } else {
        action = 'set;
        list = value.explode_english_list();
    }
    out = [];
    for item in (list) {
        if (method) {
            catch ~methodnf
                item = (> sender().(method)(item, action, @args) <);
            with
                item = (> .(method)(item, action, @args) <);
        }
        out += [item];
    }
    if (action == 'set)
        return [action, out];
    else
        return [action, out[1]];
};

public method .parse_object() {
    arg value, @args;
    var obj;
    
    catch any {
        return $object_lib.to_dbref(value);
    } with {
        if (!user())
            rethrow(error());
    }
    return (> user().match_environment(value) <);
};

public method .valid_types() {
    return ['boolean, 'itemlist];
};


