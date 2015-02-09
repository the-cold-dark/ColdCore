
new object $mutex: $root;

var $mutex locks = 0;
var $mutex queues = 0;
var $mutex suspended = 0;
var $mutex tasks = 0;
var $root created_on = 858071384;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root help_node = $help_mutex;
var $root inited = 1;
var $root managed = [$mutex];
var $root manager = $mutex;

private method ._add_to_lock() {
    arg tid, val;
    
    if ((| ((locks[val])[1]) == tid |))
        locks = locks.add(val, [tid, ((locks[val])[2]) + 1]);
    else
        locks = locks.add(val, [tid, 1]);
};

private method ._del_from_lock() {
    arg tid, val;
    var i, l;
    
    if (((| (l = locks[val]) |)[1]) != tid)
        return;
    if ((l[2]) == 1) {
        (| (locks = locks.del(val)) |);
        ._del_from_queue(val);
    } else {
        locks = locks.add(val, [tid, (l[2]) - 1]);
    }
};

private method ._del_from_queue() {
    arg val;
    var tid, s, q;
    
    q = (| queues[val] |) || [];
    (| (queues = queues.del(val)) |);
    for tid in (q) {
        if ((s = suspended[tid]) == 1) {
            suspended = suspended.del(tid);
            (| $scheduler.resume(tid) |);
        } else {
            suspended = suspended.add(tid, s - 1);
        }
    }
};

private method ._test_lock() {
    arg tid, val;
    var i;
    
    if ((| ((locks[val])[1]) != tid |)) {
        queues = queues.add(val, (| (queues[val]) + [tid] |) || [tid]);
        return 0;
    }
    return 1;
};

private method ._test_locks() {
    arg tid, values;
    var i;
    
    return filter i in (values) where (!(._test_lock(tid, i)));
};

public method .cleanup_dead_tasks() {
    var t, i, j;
    
    t = tasks();
    for i in (tasks.keys()) {
        if (!(i in t)) {
            for j in (tasks[i])
                ._del_from_lock(i, j);
            tasks = tasks.del(i);
        }
    }
};

public method .grab() {
    arg @values;
    var i, tid, l, obj;
    
    values ?= [0];
    tid = task_id();
    for obj in (.descendants())
        obj.grab(@values);
    tasks = tasks.add(tid, (| (tasks[tid]) + [values] |) || values);
    while (1) {
        if (!(l = ._test_locks(tid, values))) {
            for i in (values)
                ._add_to_lock(tid, i);
            return;
        } else {
            suspended = suspended.add(tid, l.length());
            $scheduler.suspend(this());
        }
    }
};

root method .init_mutex() {
    tasks = (suspended = (queues = (locks = #[])));
};

public method .release() {
    arg @values;
    var tid, t, vlist, i, obj;
    
    values ?= [0];
    tid = task_id();
    vlist = tasks[tid];
    for obj in (.descendants())
        obj.release(@values);
    for i in (values) {
        vlist = vlist.setremove(i);
        ._del_from_lock(tid, i);
    }
    if (vlist)
        tasks = tasks.add(tid, vlist);
    else
        tasks = tasks.del(tid);
};

public method .release_all() {
    .release(@tasks[task_id()]);
};


