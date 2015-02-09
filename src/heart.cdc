
new object $heart: $utilities;

var $heart heart_failures = [];
var $heart hearts = [[$lag_watcher, 935864070], [$world, 935864294]];
var $heart info = #[[$world, [600, 935863694]], [$lag_watcher, [14, 935864056]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$heart];
var $root manager = $heart;

private method ._add_heartbeat() {
    arg obj, delay;
    var when, h, values;
    
    // Only one heartbeat per object
    ._del_heartbeat(obj);
    when = delay + time();
    info = dict_add(info, obj, [delay, time()]);
    for h in [1 .. listlen(hearts)] {
        if (((hearts[h])[2]) >= when) {
            hearts = insert(hearts, h, [obj, when]);
            return;
        }
    }
    hearts += [[obj, when]];
};

private method ._del_heartbeat() {
    arg obj;
    var x, pos;
    
    if (info.contains(obj))
        info = info.del(obj);
    for x in [1 .. listlen(hearts)] {
        if (((hearts[x])[1]) == obj) {
            hearts = delete(hearts, x);
            return 1;
        }
    }
    return 0;
};

public method .add_heartbeat() {
    arg @delay;
    
    [(delay ?= 60)] = delay;
    ._add_heartbeat(sender(), delay);
};

root method .core_heart(): nooverride  {
    var h;
    
    for h in (hearts) {
        if (!valid(h[1]))
            ._del_heartbeat(h[1]);
    }
};

public method .del_heartbeat() {
    if (!(._del_heartbeat(sender())))
        throw(~objnf, ("Sender (" + sender()) + ") does not have a heartbeat.");
};

public method .hearts() {
    return hearts;
};

public method .pulse() {
    var heart, h, x, new;
    
    for heart in (hearts) {
        if ((heart[2]) > time())
            break;
        if (!valid(heart[1]))
            ._del_heartbeat(heart[1]);
        catch any
            (> (heart[1]).pulse() <);
        with
            (| ((heart[1]).manager()).tell_traceback(traceback()) |);
        ._add_heartbeat(heart[1], (info[heart[1]])[1]);
    }
};


