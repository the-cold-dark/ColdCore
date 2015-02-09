
new object $bs_eval: $evaluator;

var $root created_on = 837583704;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$bs_eval];
var $root manager = $bs_eval;

public method ._separate_list() {
    arg sep, l;
    
    if (sep == "none")
        return l;
    if (sep == "english")
        return [l.to_english()];
    return [l.join(sep)];
};

public method .eval_formatter() {
    arg form, vars;
    var text;
    
    if ((vars['time]) == 'post) {
        [text, vars] = (vars['formatter]).eval_formatter(form, vars);
        return [[text], vars];
    }
    return pass(form, vars);
};

public method .gen_data() {
    arg vars, flags, args;
    var method, data;
    
    [args, vars] = ._eval_ctext(args, vars);
    method = (| flags.getkey("source") |);
    catch ~methodnf
        data = (vars['this]).(tosym("gen_" + method))();
    with
        return [[">>>invalid data source<<<"], vars];
    return [[data], vars];
};

public method .gen_def() {
    arg vars, flags, args;
    var name, val;
    
    name = flags.getkey("var");
    val = args[1];
    return [[""], vars.add(name, val)];
};

public method .gen_english() {
    arg vars, flags, args;
    var sep, empty, and, text, item;
    
    sep = (| flags.getkey("separator") |) || ", ";
    empty = (| flags.getkey("empty") |) || "nothing";
    and = (| flags.getkey("and") |) || " and ";
    [text, vars] = ._eval_ctext(args, vars);
    if (((vars['time]) == 'pre) || find item in (text) where (type(item) == 'frob)) {
        return [[(<$generator, ["english", flags, text, 'gen_english]>)], vars];
    } else {
        if (type(sep) == 'list)
            sep = sep[1];
        if (type(and) == 'list)
            and = and[1];
        return [[text.to_english(empty, and, sep)], vars];
    }
};

public method .gen_foreach() {
    arg vars, flags, args;
    var v, list, body, out, item, sep, text;
    
    v = (| flags.getkey("var") |) || "iterator";
    list = flags.getkey("list");
    sep = (| flags.getkey("separator") |) || " ";
    out = [];
    for item in (list) {
        vars = vars.add(v, item);
        [text, vars] = ._eval_ctext(args, vars);
        if ((vars['time]) == 'post)
            out = out.affix(text);
        else
            out += [text];
    }
    if ((vars['time]) == 'pre)
        out = ._separate_list(sep, out);
    return [out, vars];
};

public method .gen_fromliteral() {
    arg vars, flags, args;
    
    return [[(| fromliteral(((._eval_ctext(args[1], vars))[1])[1]) |)], vars];
};

public method .gen_join() {
    arg vars, flags, args;
    var v, sep, item;
    
    sep = (| flags.getkey("separator") |) || " ";
    [args, vars] = ._eval_ctext(args, vars);
    if (((vars['time]) == 'pre) || find item in (args) where (type(item) == 'frob)) {
        return [[(<$generator, ["join", flags, args, 'gen_join]>)], vars];
    } else {
        if (type(sep) == 'list)
            sep = sep[1];
        return [._separate_list(sep, args), vars];
    }
};

public method .gen_name() {
    arg vars, flags, args;
    var out, name, sep, type;
    
    [args, vars] = ._eval_ctext(args, vars);
    out = [];
    type = (| tosym(flags.getkey("type")) |) || 'name;
    if (!args)
        return [[(vars['this]).namef(type)], vars];
    sep = (| flags.getkey("separator") |) || " ";
    for name in (args) {
        switch (type(name)) {
            case 'objnum:
                name = name.namef(type);
            case 'string:
                catch ~objnf
                    name = ((vars['this]).match_environment(name)).namef(type);
                with
                    name = name;
        }
        out += [name];
    }
    return [._separate_list(sep, out), vars];
};

public method .gen_pro() {
    arg vars, flags, args;
    var out, type, obj, key, objstr;
    
    if ((| (objstr = flags.getkey("obj")) |)) {
        while (type(objstr) == 'list)
            objstr = objstr[1];
        if (type(objstr) == 'string) {
            catch ~objnf, ~namenf
                obj = (vars['this]).match_environment(objstr);
            with
                return [[(">>ERROR: Invalid object '" + objstr) + "'.<<"], vars];
        } else {
            obj = objstr;
        }
    } else {
        obj = vars['this];
    }
    out = [];
    if ((args.length()) == 0)
        return [[">>ERROR: Must specify pronoun type.<<"], vars];
    type = (args[1]).to_symbol();
    catch ~keynf
        out = (> [(obj.gender()).pronoun(type)] <);
    with
        return [[(">>ERROR: Invalid pronoun type '" + (args[1])) + "'.<<"], vars];
    return [out, vars];
};

public method .gen_random() {
    arg vars, flags, args;
    var range, low, high;
    
    // No need to ._eval_ctext() since there are no args.
    low = toint((| flags.getkey("low") |) || 1);
    high = toint(flags.getkey("high"));
    return [[random(high - low) + low], vars];
};

public method .gen_serverhost() {
    arg vars, flags, args;
    
    return [[$sys.server_info('server_hostname)], vars];
};

public method .gen_servername() {
    arg vars, flags, args;
    
    return [[$motd.server_name()], vars];
};

public method .gen_servname() {
    arg vars, flags, args;
    
    return [[$motd.server_name()], vars];
};

public method .gen_set() {
    arg vars, flags, args;
    
    return [[""], vars.add(((._eval_ctext(flags.getkey("var"), vars))[1])[1], ((._eval_ctext(args[1], vars))[1])[1])];
};

public method .gen_switch() {
    arg vars, flags, args;
    var v, i, num, n, done;
    
    v = flags.getkey("value");
    if (type(v) == 'list)
        v = v.join("");
    if (args.contains(v))
        return ._eval_ctext(args[v], vars);
    if (args.contains('ranges)) {
        if ((num = v.is_numeric()))
            n = toint(v);
        done = 0;
        for i in (args['ranges]) {
            if ((| num && (((i[1]).is_numeric()) && ((i[2]).is_numeric())) |)) {
                if ((n >= toint(i[1])) && (n <= toint(i[2])))
                    done = 1;
            } else if ((| (v >= (i[1])) && (v <= (i[2])) |)) {
                done = 1;
            }
            if (done)
                return ._eval_ctext(i[3], vars);
        }
    }
    if (args.contains('default))
        return ._eval_ctext(args['default], vars);
    return [((vars['time]) == 'pre) ? [""] : "", vars];
};

public method .gen_time() {
    arg vars, flags, args;
    var a, word;
    
    [args, vars] = ._eval_ctext(args, vars);
    if (!args)
        return [[tostr(time())], vars];
    return [[$time.format(args[1])], vars];
};

public method .gen_vars() {
    arg vars, flags, args;
    var out, v, sep;
    
    out = [];
    sep = (| flags.getkey("separator") |) || " ";
    for v in (vars.keys()) {
        if (type(v) == 'string)
            out += [v];
    }
    return [._separate_list(sep, out), vars];
};

public method .old_gen_set() {
    arg vars, flags, args;
    var text, name;
    
    name = flags.getkey("var");
    [text, vars] = ._eval_ctext(args[1], vars);
    return [[""], vars.add(name, text[1])];
};


