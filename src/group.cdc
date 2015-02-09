
new object $group: $root;

var $group group = #[];
var $root created_on = 904653573;
var $root defined_settings = #[["group", #[['get, ['get_group]], ['set, ['set_group]], ['parse, ['parse_group]], ['format, ['format_group]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$group];
var $root manager = $group;

public method .add_to_group() {
    arg target;
    
    (> .perms(sender()) <);
    group = dict_add(group, target, 1);
};

public method .del_from_group() {
    arg target;
    
    (> .perms(sender()) <);
    group = dict_del(group, target);
};

public method .format_group() {
    arg data;
    
    return join(dict_keys(data), ", ");
};

public method .get_group() {
    arg @args;
    
    return group;
};

public method .includes() {
    arg target;
    
    if (!dict_contains(group, target)) {
        if (this() == definer())
            return 0;
    
        //   if (this() == definer())
        //       return $sys.is_system(target);
        return (parents()[1]).includes(target);
    }
    return 1;
};

root method .init_group() {
    group = #[];
};

public method .is_group() {
    return 1;
};

public method .name() {
    arg @args;
    var n, x;
    
    n = tostr(.objname());
    if ((x = stridx(n, "_group", -1)) > 1)
        return substr(n, 1, x - 1);
    return n;
};

public method .parse_group() {
    arg value, @args;
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
    out = hash item in (list) to ([(> $object_lib.to_dbref(item) <), 1]);
    if (action == 'set)
        return [action, out];
    else
        return [action, dict_keys(out)[1]];
};

public method .parse_grouplist() {
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
    out = #[];
    for item in (list) {
        if (method) {
            catch ~methodnf
                item = (> sender().(method)(item, action, @args) <);
            with
                item = (> .(method)(item, action, @args) <);
        }
        out = dict_add(out, item, 1);
    }
    if (action == 'set)
        return [action, out];
    else
        return [action, out[1]];
};

protected method .set_group() {
    arg name, definer, value;
    
    if (this() == definer())
        throw(~invgroup, "You cannot change the base group " + definer());
    switch (value[1]) {
        case 'set:
            group = value[2];
        case 'add:
            group = dict_add(group, value[2], 1);
        case 'del:
            group = dict_del(group, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

root method .uninit_group() {
    if (sender() != definer())
        clear_var('group);
    else
        group = #[];
};


