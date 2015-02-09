
new object $help_lib: $libraries;

var $help_lib default_node = $help_coldcore;
var $help_lib indices = [$help_index_function, $help_index_objects, $help_index_subsystem, $help_index_driver, $help_index_cmds, $help_index_core];
var $root created_on = 805931416;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_lib];
var $root manager = $help_lib;

public method .default_node() {
    return default_node;
};

public method .group_nodes_in_html() {
    arg nodes, noemph, @args;
    var name, names, n;
    
    names = [];
    for n in (nodes) {
        if (n in noemph)
            name = n.name();
        else
            name = .node_name_in_html(n);
        names += [name];
    }
    return names.to_english(@args);
};

public method .history_cap() {
    return 15;
};

public method .indices() {
    return indices;
};

public method .node_name_in_html() {
    arg node;
    
    return ((("<a href=\"/bin/help?" + node) + "\">") + (node.name())) + "</a>";
};

public method .set_indices() {
    arg @new;
    var o;
    
    (> .perms(sender()) <);
    if (filter o in (new) where ((type(o) != 'objnum) || (!(o.is($help_index)))))
        throw(~type, "Arguments must be $help_index objects.");
    
    // do this all at once so you can manage the order
    indices = new;
};


