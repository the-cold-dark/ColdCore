
new object $tag: $frob;

var $root created_on = 837584128;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$tag];
var $root manager = $tag;

public method .add_ctext_flag() {
    arg self, key, value;
    var eflags, uflags;
    
    eflags = (self[2]).addkey(key, value);
    self = self.replace(2, eflags);
    return (<this(), self>);
};

public method .append_arg() {
    arg self, new;
    var args;
    
    args = (self[3]) + [new];
    return (<this(), (self.replace(3, args))>);
};

public method .args() {
    arg self;
    
    return self[3];
};

public method .ctext_flags() {
    arg self;
    
    return self[2];
};

public method .eval_flags() {
    arg this, vars;
    var flags, i, l, val, s;
    
    flags = this[2];
    l = [];
    s = sender();
    for i in (flags) {
        if (type(i[2]) != 'string) {
            [val, vars] = s._eval_ctext(i[2], vars);
            l += [[i[1], val]];
        } else {
            l += [i];
        }
    }
    return [this[1], l, this[3], this[4]];
};

public method .method() {
    arg self;
    
    return self[4];
};

public method .name() {
    arg self;
    
    return self[1];
};

public method .new_tag() {
    arg name, flags, args, method;
    var item, eflags;
    
    eflags = [];
    for item in (flags) {
        switch (type(item)) {
            case 'string:
                eflags = eflags.addkey(item, 1);
            case 'list:
                if (type(item[1]) != 'string)
                    throw(~flagerr, "Flag name must be a string.");
                eflags = eflags.addkey(item[1], item[2]);
            default:
                throw(~flagerr, "Flag must be a string or key,value pair.");
        }
    }
    return (<this(), [name, eflags, args, method]>);
};

public method .set_args() {
    arg self, args;
    
    return (<this(), (self.replace(3, args))>);
};


