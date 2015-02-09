
new object $formatter: $evaluator;

var $root created_on = 837583776;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$formatter];
var $root manager = $formatter;

public method ._eval_ctext() {
    arg data, vars;
    var out, uflags, token;
    
    out = "";
    if (type(data) != 'list)
        data = [data];
    for token in (data) {
        refresh();
        switch (type(token)) {
            case 'frob:
                switch (class(token)) {
                    case $generator:
                        [token, vars] = ((| vars['evaluator] |) || $bs_eval).eval_generator(token, vars);
                        if (type(token) == 'string) {
                            out += token;
                        } else {
                            [token, vars] = ._eval_ctext(token, vars);
                            out += token;
                        }
                    case $format:
                        [token, vars] = .eval_formatter(token, vars);
                        out += token;
                }
            case 'string:
                out += token;
            case 'list:
                [token, vars] = ._eval_ctext(token, vars);
                out += token;
            default:
                out += token;
        }
    }
    return [out, vars];
};

public method .do_invoke() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [args, vars];
};

public method .do_obj() {
    arg vars, flags, args;
    
    return [flags.getkey("name"), vars];
};

public method .do_sense() {
    arg vars, flags, args;
    
    return [(| tostr(vars[tosym(args[1])]) |) || "", vars];
};

public method .do_switch() {
    arg vars, flags, args;
    var v, i, num, n, done;
    
    v = flags.getkey("value");
    if (type(v) == 'list)
        v = v.join("");
    if (type(args) == 'list)
        args = args[1];
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

public method .eval_formatter() {
    arg form, vars;
    var flags, i, text;
    
    form = form.eval_flags(vars);
    catch ~methodnf {
        return .(form[4])(vars, form[2], form[3]);
    } with {
        [text, vars] = ._eval_ctext(form[3], vars);
        if ((vars['time]) == 'post)
            return [text, vars];
        form = (<$format, [form[1], form[2], text, form[4]]>);
        return [[form], vars];
    }
};

public method .eval_generator() {
    arg gen, vars;
    
    return (vars['evaluator]).eval_generator(gen, vars);
};


