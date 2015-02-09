
new object $dmi_data: $root;

var $dmi_data descriptions = #[];
var $root created_on = 860904004;
var $root credit = ["Bruce Mitchener, Jr <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$dmi_data];
var $root manager = $dmi_data;

public method .add_data_to_method() {
    arg method, identifier, @data;
    var method_data, identifier_data;
    
    (> .perms(sender()) <);
    method_data = (| descriptions[method] |) || #[];
    if ((data.length()) == 1) {
        method_data = method_data.add(identifier, @data);
    } else if ((data.length()) == 2) {
        identifier_data = (| method_data[identifier] |) || #[];
        identifier_data = identifier_data.add(data[1], data[2]);
        method_data = method_data.add(identifier, identifier_data);
    }
    descriptions = descriptions.add(method, method_data);
};

public method .add_description_to_db() {
    arg method, description;
    
    if (caller() != $interface_registry)
        (> .perms(sender()) <);
    descriptions ?= #[];
    descriptions = (> descriptions.add(method, description) <);
};

public method .del_data_from_method() {
    arg method, identifier, @data;
    var method_data, identifier_data;
    
    (> .perms(sender()) <);
    method_data = (| descriptions[method] |) || #[];
    if ((data.length()) == 0) {
        (| (method_data = method_data.del(identifier)) |);
    } else if ((data.length()) == 1) {
        identifier_data = (| method_data[identifier] |) || #[];
        (| (identifier_data = identifier_data.del(data[1])) |);
        method_data = method_data.add(identifier, identifier_data);
    }
    descriptions = descriptions.add(method, method_data);
};

public method .del_description_from_db() {
    arg method;
    
    if (caller() != $interface_registry)
        (> .perms(sender()) <);
    descriptions = (| descriptions.del(method) |);
};

public method .describe_method() {
    arg method;
    
    return (> descriptions[method] <);
};

root method .init_dmi_data() {
    descriptions = #[];
};

root method .uninit_dmi_data() {
    var i;
    
    descriptions ?= #[];
    for i in (descriptions.keys())
        $interface_registry.del_description(this(), i);
    descriptions = 0;
};


