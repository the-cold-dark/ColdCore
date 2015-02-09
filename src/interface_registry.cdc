
new object $interface_registry: $db;

var $db database = #[['object, [$page_bin_index]], ['help, [$page_bin_index]], ['display, [$page_bin_index]], ['describe, [$page_bin_index]], ['who, [$page_bin_index]], ['read, [$note]], ['method, [$page_bin_index]], ['submit_new, [$page_set]]];
var $dmi_data descriptions = #[];
var $root created_on = 858198912;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$interface_registry];
var $root manager = $interface_registry;

private method ._add_method_to_index() {
    arg object, method;
    var old_method_index, new_method_index;
    
    old_method_index = (| .exact_match(method) |) || [];
    new_method_index = ($graph.topological_sort(old_method_index.setadd(object), 'has_ancestor)).reverse();
    .insert(method, new_method_index);
};

private method ._del_method_from_index() {
    arg object, method;
    var old_method_index, new_method_index;
    
    old_method_index = (| .exact_match(method) |) || [];
    new_method_index = ($graph.topological_sort(old_method_index.setremove(object), 'has_ancestor)).reverse();
    if (new_method_index)
        .insert(method, new_method_index);
    else
        .remove(method);
};

private method ._find_object_in_index() {
    arg object, method, @second_time;
    var iter, objectlist;
    
    [(second_time ?= 0)] = second_time;
    if (second_time)
        ._sort_method_index(method);
    objectlist = (| .exact_match(method) |) || throw(~matchnf, "That method is not listed in the Interface Registry.");
    if (object in objectlist) {
        return valid(object) ? object : (> ._find_object_in_index(object, method, 1) <);
    } else {
        for iter in (objectlist) {
            if (object.has_ancestor(iter))
                return valid(iter) ? iter : (> ._find_object_in_index(object, method, 1) <);
        }
    }
    throw(~matchnf, "Object doesn't define that method in the Interface Registry");
};

private method ._sort_method_index() {
    arg method;
    var old_method_index, new_method_index, item;
    
    old_method_index = (| .exact_match(method) |) || [];
    new_method_index = filter item in (old_method_index) where (valid(item));
    new_method_index = ($graph.topological_sort(new_method_index, 'has_ancestor)).reverse();
    .insert(method, new_method_index);
};

public method .add_description() {
    arg object, method, description;
    
    if (!(object.is_writable_by(sender())))
        throw(~perm, (tostr(object) + " is not writable by ") + tostr(sender()));
    if (!(object.has_ancestor($dmi_data)))
        throw(~invrequest, object + " must be a child of $dmi_data.");
    (> ._add_method_to_index(object, method) <);
    (> object.add_description_to_db(method, description) <);
};

root method .core_interface_registry() {
    var method;
    
    for method in ((.database()).keys())
        ._sort_method_index(method);
};

public method .del_description() {
    arg object, method;
    
    if (~object.is_writable_by(sender()))
        throw(~perm, (tostr(object) + " is not writable by ") + tostr(sender()));
    (> ._del_method_from_index(object, method) <);
    (> object.del_description_from_db(method) <);
};

public method .describe() {
    arg object, method;
    var defining_object;
    
    defining_object = (> ._find_object_in_index(object, method) <);
    return (> defining_object.describe_method(method) <);
};

public method .index() {
    return .database();
};

public method .verbal_index() {
    var index, method, objects, object, item, lines;
    
    index = .index();
    lines = ["Interface registry is tracking:{br}{br}"];
    lines += ["{table cols=50%,50%:"];
    for item in (index) {
        [method, objects] = item;
        lines += [((("{tr:{td:" + method) + "}{td:") + (objects.to_english())) + "}}"];
    }
    lines += ["}"];
    return $compiler.compile_cml(lines);
};

public method .where_is() {
    arg object, method;
    
    return (> ._find_object_in_index(object, method) <);
};


