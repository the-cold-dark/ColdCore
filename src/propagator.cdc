
new object $propagator: $frob;

var $root created_on = 861726346;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$propagator];
var $root manager = $propagator;

public method .effect() {
    arg self;
    
    return ((self.length()) > 1) ? (self[2]) : 0;
};

public method .format() {
    arg prop;
    var i, str, pref, val;
    
    if (!prop)
        return "no";
    [val, (pref ?= "")] = prop;
    str = map i in (val) to ((tostr(i[1]) + "=") + (i[2])).join("; ");
    if (pref) {
        if (type(pref) == 'string)
            str += " /" + pref;
        else
            str += strfmt(" /.%l(%l)", pref[1], map i in (pref.subrange(2)) to (toliteral(i)).join(","));
    }
    return str;
};

public method .new_with() {
    arg str;
    var ctext, i, m, effect, props;
    
    if (str in ["n", "no", "none", "0"])
        return 0;
    effect = 0;
    props = #[];
    if ((m = str.match_pattern("*/*"))) {
        [str, effect] = m;
        if (((effect.length()) >= 2) && ((effect[1]) == ".")) {
            if (!(effect = effect.match_pattern("*(*)")))
                throw(~parse, "Effect is not of the form .method(arg, ...)");
            effect = [tosym((effect[1]).subrange(2)), @map i in ((effect[2]).split(",")) to (fromliteral(i))];
        }
    }
    for i in ((str.explode(";")).mmap('trim)) {
        if (!(m = i.match_pattern("*=*")))
            throw(~parse, "'=' expected");
        if (!((m[2]).is_numeric()))
            throw(~parse, "Illegal propagator value");
        props = props.add(tosym(m[1]), toint(m[2]));
    }
    props = effect ? [props, effect] : [props];
    return (<this(), props>);
};

public method .senses() {
    arg self;
    
    return self[1];
};


