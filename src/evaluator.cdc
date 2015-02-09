
new object $evaluator: $utilities;

var $root created_on = 837583637;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$evaluator];
var $root manager = $evaluator;

public method ._eval_ctext() {
    arg data, vars;
    var out, uflags, token;
    
    out = [];
    if (type(data) != 'list)
        data = [data];
    for token in (data) {
        if (type(token) == 'frob) {
            switch (class(token)) {
                case $generator:
                    [token, vars] = .eval_generator(token, vars);
                    out += token;
                case $format:
                    [token, vars] = .eval_formatter(token, vars);
                    out += token;
                default:
                    out += [token];
            }
        } else {
            out += [token];
        }
    }
    return [out, vars];
};

public method .eval_formatter() {
    arg form, vars;
    var flags, text, key;
    
    form = form.eval_flags(vars);
    catch ~methodnf {
        return .(form[4])(vars, form[2], form[3]);
    } with {
        [text, vars] = ._eval_ctext(form[3], vars);
        form = (<$format, [form[1], form[2], text, form[4]]>);
        return [[form], vars];
    }
};

public method .eval_generator() {
    arg gen, vars;
    var flags, key, value, name;
    
    gen = gen.eval_flags(vars);
    catch ~methodnf {
        return .(gen[4])(vars, gen[2], gen[3]);
    } with {
        catch ~keynf
            return [[vars[gen[1]]], vars];
        with
            return [[(">>ERROR: Unknown generator [" + (gen[1])) + "].<<"], vars];
    }
};

public method .init() {
    return #[];
};


