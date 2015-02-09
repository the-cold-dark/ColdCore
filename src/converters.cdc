
new object $converters: $libraries;

var $dmi_data descriptions = #[];
var $root created_on = 863769001;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$converters];
var $root manager = $converters;

public method .parse_ref() {
    arg ref, object, flags;
    var lookup_result;
    
    if ((ref[1]) != "$")
        ref = "$" + ref;
    lookup_result = (> $parse_lib.ref(ref, $user) <);
    if ((lookup_result[1]) in flags)
        return lookup_result;
    else
        throw(~type, "Reference was of the improper type");
};

public method .parse_textarea() {
    arg string;
    
    string = (string.replace($http.decode("%0d"), "")).explode($http.decode("%0a"), 1);
    return string;
};

public method .parse_textarea_joined() {
    arg string;
    
    anticipate_assignment();
    string = strsub(string, $http.decode("%0d"), "");
    string = strsub(string, $http.decode("%0a"), " ");
    return string;
};

public method .to_boolean() {
    arg string, @extra;
    
    return ((string[1]) == "y") ? 1 : 0;
};

public method .to_help_node() {
    arg string;
    var obj;
    
    catch ~objnf
        obj = (> .to_object(string) <);
    with
        obj = (> .to_object("help_" + string) <);
    if (obj.is($help_node))
        return obj;
    else if (obj.help_node())
        return obj.help_node();
    else
        throw(~invobj, string + " is not a help node and doesn't have an assigned help node.");
};

public method .to_num() {
    arg number;
    
    return (> toint(number) <);
};

public method .to_object() {
    arg string, @required_parent;
    var object, parent;
    
    [(parent ?= $root)] = required_parent;
    object = (| $object_lib.to_dbref(string) |);
    if (!object)
        throw(~objnf, ("Object " + string) + " not found.");
    if (!(object.has_ancestor(parent)))
        throw(~invobj, ((("Object " + string) + ", doesn't have the ancestor, ") + parent) + ".");
    return object;
};


