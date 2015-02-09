
new object $message_frob: $frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$message_frob];
var $root manager = $message_frob;

public method .add_entry() {
    arg this, key, what;
    var data;
    
    this = this.add(key, what);
    return (<this(), this>);
};

public method .change_entry() {
    arg this, old, new;
    var value;
    
    value = (> this[old] <);
    this = dict_del(this, old);
    this = dict_add(this, new, value);
    return (<this(), this>);
};

public method .del_entry() {
    arg this, key;
    
    this = this.del(key);
    return (<this(), this>);
};

public method .eval_ctext() {
    arg this, vars;
    var key, new, temp, t, list, vars, okey, keys;
    
    new = .new();
    vars = vars.add('this, sender());
    if (dict_contains(this, "general"))
        vars = vars.add("$general", "general");
    if (vars['varkeys]) {
        for temp in (vars['varkeys]) {
            okey = temp[2];
            key = ((temp[1]) + ".") + (| (vars[temp[2]]).objname() |);
            if (dict_contains(this, key)) {
                this = dict_add(this, temp[1], this[key]);
                this = dict_del(this, key);
            }
        }
        for key in (dict_keys(this)) {
            okey = "$" + key;
            if (dict_contains(vars, okey) || dict_contains(vars, key)) {
                temp = ((this[key]).set_var('this, vars['this])).eval_ctext();
                new = new.add_entry((| vars[okey] |) || (vars[key]), temp);
            }
        }
    } else {
        for key in (dict_keys(this)) {
            temp = ((this[key]).set_var('this, vars['this])).eval_ctext();
            new = new.add_entry((| vars["$" + key] |) || (vars[key]), temp);
        }
    }
    return new;
};

public method .format() {
    arg this, vars;
    
    return ((.to_ctext(this, vars)).append([], "br")).format();
};

public method .get_part() {
    arg this, part;
    
    return this[part];
};

public method .has_entry() {
    arg this, name;
    
    return name in (this.keys());
};

public method .message() {
    arg name, @definer;
    var a, message, mes, m;
    
    //retrieve the specified message as ctext
    if (definer)
        definer = definer[1];
    else
        definer = (._find_message_definer(name))[2];
    message = $message_frob.new();
    for a in (.ancestors()) {
        catch ~methodnf, ~messagenf
            return a.local_message(name, definer);
    }
    throw(~messagenf, "No matching message.");
};

public method .parts() {
    arg this;
    
    return this.keys();
};

public method .propagate() {
    arg self, f;
    
    return ($filtered_frob.new_with(self, sender())).propagate(f);
};

public method .set_vars() {
    arg this, new;
    var d;
    
    return (<this(), (hash d in (this) to ([d[1], (d[2]).set_vars(new)]))>);
};

public method .to_ctext() {
    arg this, vars;
    var new;
    
    new = (| this[vars['receiver]] |) || ((| this["general"] |) || ($ctext_frob.new_with([""])));
    new = new.set_vars(vars);
    return new;
};

public method .uncompile() {
    arg this;
    var key;
    
    return hash key in (this) to ([key[1], (key[2]).uncompile()]);
};


