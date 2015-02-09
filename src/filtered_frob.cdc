
new object $filtered_frob: $libraries;

var $filtered_frob default_value = #[['sight, 10], ['hearing, 10]];
var $root created_on = 860590309;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$filtered_frob];
var $root manager = $filtered_frob;

public method .default_value() {
    return default_value;
};

public method .effects() {
    arg what;
    
    return (what.contains('effects)) ? (what['effects]) : [];
};

public method .is_noticed() {
    arg value, f;
    var i;
    
    return find i in [1 .. listlen(value)] where ((value[i]) >= (f[i]));
};

public method .message() {
    arg what;
    
    return what['message];
};

public method .new_with() {
    arg msg, sender;
    
    if (type(msg) != 'frob)
        msg = (<$message_frob, msg>);
    return (<this(), (((.default_value()).add('message, msg)).add('propagator, sender))>);
};

public method .new_with_message() {
    arg msg, sender;
    
    return (<(.this()), (((.default_value()).add('message, msg)).add('propagator, sender))>);
};

public method .propagate() {
    arg value, prop;
    var i, out, dflt, l, eff, f, n;
    
    if ((type(value) == 'frob) && (class(value) == $message_frob))
        value = .new_with(value, sender());
    out = #[];
    eff = prop.effect();
    f = prop.senses();
    dflt = (f.contains('any)) ? (f['any]) : 1000000;
    n = 0;
    for i in (value) {
        if ((i[1]) in ['message, 'propagator, 'effects]) {
            out = out.add(@i);
        } else {
            if (f.contains(i[1]))
                l = (i[2]) - (f[i[1]]);
            else
                l = (i[2]) - dflt;
            if (l > 0) {
                out = out.add(i[1], l);
                n++;
            }
        }
    }
    if (!n)
        return 0;
    if (eff)
        out = out.add('effects, ((| out.effects() |) || []) + [eff]);
    return (<this(), out>);
};

public method .sensory() {
    arg what;
    
    (| (what = what.del('message)) |);
    (| (what = what.del('effects)) |);
    (| (what = what.del('propagator)) |);
    return what;
};


