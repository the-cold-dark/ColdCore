
new object $ctext_frob: $frob;

var $root created_on = 837584074;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$ctext_frob];
var $root manager = $ctext_frob;

public method ._ctext() {
    arg this;
    
    return this[1];
};

public method .append() {
    arg this, new, @br;
    var data, tmp, vars;
    
    data = this[1];
    vars = this[2];
    if (br) {
        switch (br[1]) {
            case "p":
                data += [(<$format, ["p", [], [], 'do_p]>)];
            case "br":
                data += [(<$format, ["br", [], [], 'do_br]>)];
            default:
                data += [$format.new_tag(br[1], [], [])];
        }
    }
    if (type(new) == 'list) {
        data += new;
    } else if ((type(new) == 'frob) && (class(new) == $ctext_frob)) {
        data += new._ctext();
        vars = dict_union(vars, new.vars());
    } else {
        data += [new];
    }
    return (<this(), [data, vars]>);
};

public method .eval_ctext() {
    arg this;
    var data, vars;
    
    vars = this[2];
    vars = dict_add(vars, 'time, 'pre);
    if (!(| vars['sender] |))
        vars = dict_add(vars, 'sender, sender());
    if (!(| vars['evaluator] |))
        vars = dict_add(vars, 'evaluator, $bs_eval);
    vars = dict_union(vars, (vars['evaluator]).init());
    return .new_with(@(vars['evaluator])._eval_ctext(this[1], vars));
};

public method .format() {
    arg this;
    var vars;
    
    vars = this[2];
    vars = dict_add(vars, 'time, 'post);
    if (!(| vars['receiver] |))
        vars = dict_add(vars, 'receiver, sender());
    if (!(| vars['evaluator] |))
        vars = dict_add(vars, 'evaluator, $bs_eval);
    if (!(| vars['formatter] |))
        vars = dict_add(vars, 'formatter, $plain_format);
    vars = dict_union(vars, (vars['formatter]).init());
    return (vars['formatter]).format(this[1], vars);
};

public method .get_var() {
    arg this, name;
    
    return (this[2])[name];
};

public method .new_with() {
    arg data, @vars;
    
    [(vars ?= #[])] = vars;
    return (<this(), [data, vars]>);
};

public method .set_var() {
    arg this, name, value;
    var vars;
    
    vars = this[2];
    vars = vars.add(name, value);
    return (<this(), [this[1], vars]>);
};

public method .set_vars() {
    arg this, new;
    var vars, key;
    
    return (<this(), [this[1], dict_union(this[2], new)]>);
    vars = this[2];
    for key in (new.keys())
        vars = dict_add(vars, key, new[key]);
    return (<this(), [this[1], vars]>);
};

public method .uncompile() {
    arg this;
    var vars;
    
    vars = this[2];
    if (!(| vars['uncompiler] |))
        vars = dict_add(vars, 'uncompiler, $uncompiler);
    vars = dict_union(vars, (vars['uncompiler]).init());
    return ((vars['uncompiler])._eval_ctext(this[1], vars))[1];
};

public method .vars() {
    arg this;
    
    return this[2];
};


