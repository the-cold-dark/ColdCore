
new object $dmi_data_ui: $user_interfaces;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = \
  #[["@verbal-index", [["@verbal-index", "", "@verbal-index", 'verbal_index_cmd, #[]]]], ["@dmethod", [["@dmethod", "*", "@dmethod <objref>", 'describe_method_english_cmd, #[[1, ['objref, []]]]]]],\
  ["@add-arg",\
    [["@add-arg", "*", "@add-arg <objref: +converter +converter-args +default +name>", 'add_arg_cmd, #[[1, ['objref_opt, ["converter", "converter-args", "default", "name"]]]]]]],\
  ["@del-arg",\
    [["@del-arg", "*", "@del-arg <objref: +name>", 'del_arg_cmd, #[[1, ['objref_opt, ["name"]]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 861514233;
var $root credit = ["Bruce Mitchener, Jr <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$dmi_data_ui];
var $root manager = $dmi_data_ui;

public method ._get_opt() {
    arg opt, type, opts, dict;
    var i, value, m;
    
    if (!(i = opt in (opts.slice(1))))
        return dict;
    value = (opts[i])[4];
    if (!value)
        throw(~stop, ("No value for option \"" + opt) + "\".");
    catch any {
        switch (type) {
            case 'string:
                value = [value];
            case 'objref:
                value = (> $parse_lib.ref(value) <);
            case 'symbol:
                value = [(> value.to_symbol() <)];
            case 'data_list:
                value = (> fromliteral(value) <);
                if (type(value) != 'list)
                    value = [value];
        }
    } with {
        rethrow(~stop);
    }
    opt = opt.strip("?");
    if ((m = match_pattern(opt, "*-args"))) {
        opt = tosym(m[1]);
        if (!dict_contains(dict, opt))
            throw(~stop, ((("Arguments defined for " + opt) + " without defining ") + opt) + " method.");
        value = [dict[opt], [@value]];
        return dict_add(dict, opt, value);
    } else {
        return dict_add(dict, tosym(opt), value);
    }
};

public method .add_arg_cmd() {
    arg cmd, cmstr, args;
    var opts, argname, argdefault, argconverter, object, method, config, objref, argconverterargs;
    
    object = (args[1])[2];
    method = tosym((args[1])[4]);
    opts = args[3];
    config = #[];
    config = (> ._get_opt("name", 'string, opts, config) <);
    config = (> ._get_opt("default", 'data_list, opts, config) <);
    config = (> ._get_opt("converter", 'objref, opts, config) <);
    config = (> ._get_opt("converter-args", 'data_list, opts, config) <);
    argname = (| config['name] |);
    if (!argname)
        return "Must specify the name of the argument to add";
    if (argname)
        [argname] = argname;
    argdefault = (| config['default] |) || [];
    objref = (| config['converter] |) || [];
    argconverterargs = [];
    if (objref && (type(objref[1]) == 'list)) {
        argconverterargs = objref[2];
        objref = objref[1];
    }
    argconverter = [objref[2], tosym(objref[4]), argconverterargs];
    (> .dmi_add_arg(object, method, argname, argdefault, argconverter) <);
    return .arg_description_to_english(argname, ((object.describe_method(method))['args])[argname]);
    return ("Argument, " + argname) + ", successfully added.  Mail Bruce to have this give the definition of the argument.";
};

public method .arg_description_to_english() {
    arg arg_name, arg_description;
    var str_list, converter, default_value, converter_arg;
    
    str_list = ["Arg:             " + arg_name];
    default_value = arg_description[1];
    converter = arg_description[2];
    if (default_value != [])
        str_list += ["    Default:     " + toliteral(default_value[1])];
    else
        str_list += ["    Default:     None."];
    if ((converter.length()) == 3)
        str_list += [((((("    Converter:   " + tostr(converter[1])) + ".") + tostr(converter[2])) + "( <arg value>, ") + (map converter_arg in (converter[3]) to (toliteral(converter_arg)).join(", "))) + ")"];
    else
        str_list += ["    Converter:   None."];
    return str_list;
};

public method .del_arg_cmd() {
    arg cmd, cmstr, args;
    var opts, argname, argdefault, argconverter, object, method, config, objref, argconverterargs;
    
    object = (args[1])[2];
    method = tosym((args[1])[4]);
    opts = args[3];
    config = #[];
    config = (> ._get_opt("name", 'string, opts, config) <);
    argname = (| config['name] |);
    if (!argname)
        return "Must specify the name of the argument to add";
    if (argname)
        [argname] = argname;
    (> .dmi_del_arg(object, method, argname) <);
    return ("Argument, " + argname) + ", successfully deleted.";
};

public method .describe_method_english_cmd() {
    arg cmdstr, cmd, args;
    var i, pattern, ref, methods, s, def, method, opts, str, m, d, out, type;
    
    (> .perms(caller(), 'command) <);
    ref = args;
    if ((ref[1]) == 'variable)
        return ((("The reference " + (ref[3])) + ",") + ((ref[4]) || "")) + " is not for a method.";
    if ((ref[1]) == 'object)
        return ("The reference " + (ref[3])) + " is not for a method.";
    def = (| (ref[2]).find_method(tosym(ref[4])) |);
    if (def) {
        pattern = ref[4];
        methods = [tosym(ref[4])];
    } else {
        if (ref[4])
            pattern = ref[4];
        else
            pattern = .get_setting("match-default", $programmer);
        def = ref[3];
        m = .get_setting("match-with", $programmer);
        methods = [];
        for method in (def.methods()) {
            if (tostr(method).(m)(pattern))
                methods += [method];
        }
        if (!methods)
            return .tell((("No method found matching " + def) + ".") + pattern);
    }
    cmd = .get_setting("@program-options", $programmer);
    out = [];
    for method in (methods)
        out += .method_description_to_english(def, method);
    return out;
};

public method .dmi_add_arg() {
    arg object, method, argument, default_value, converter;
    var defining_object;
    
    catch ~matchnf {
        defining_object = $interface_registry.where_is(object, method);
    } with {
        if (object.is($page))
            defining_object = object;
        else
            rethrow(error());
    }
    (> defining_object.add_data_to_method(method, 'args, argument, [default_value, converter]) <);
};

public method .dmi_del_arg() {
    arg object, method, argument;
    var defining_object;
    
    defining_object = (> $interface_registry.where_is(object, method) <);
    (> defining_object.del_data_from_method(method, 'args, argument) <);
};

public method .method_description_to_english() {
    arg object, method;
    var args, argument, argname, argorder, str_list, description;
    
    description = (> $interface_registry.describe(object, method) <);
    args = description['args];
    argorder = (| description['arg_order] |) || (args.keys());
    str_list = [((("Method:          " + tostr(object)) + ".") + tostr(method)) + "()"];
    str_list += ["Authentication:  " + toliteral((| description['auth] |) || "unspecified")];
    for argument in (argorder)
        str_list += .arg_description_to_english(argument, args[argument]);
    str_list += ["---"];
    return str_list;
};

public method .set_auth() {
    arg object, method, authorization_data;
    var defining_object;
    
    defining_object = (> $interface_registry.where_is(object, method) <);
    (> defining_object.add_data_to_method(method, 'auth, authorization_data) <);
};

public method .verbal_index_cmd() {
    arg cmdstr, cmd;
    
    sender().tell($interface_registry.verbal_index());
};


