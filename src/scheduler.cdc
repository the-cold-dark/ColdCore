
new object $scheduler: $utilities;

var $root created_on = 810294797;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$scheduler];
var $root manager = $scheduler;
var $scheduler blocked_tasks = #[];
var $scheduler expected_lag = 0;
var $scheduler server_lag = 0;
var $scheduler sub_schedulers = [$heart];
var $scheduler suspended_tasks = #[];
var $scheduler task_index = 2;
var $scheduler task_queue = [];

public method .add_sub_scheduler() {
    arg object;
    
    if (!($sys.is_admin(sender())))
        throw(~perm, "Only admins may add sub schedulers.");
    if (type(object) != 'objnum)
        throw(~type, "Object must be a dbref.");
    sub_schedulers += [object];
};

public method .add_task() {
    arg time, method, @args;
    var task, i, j, tid, flags, x, y, task_time;
    
    if ((type(time) != 'integer) || ((type(method) != 'symbol) || (type(args) != 'list)))
        throw(~type, "Arguments are not an integer, symbol, and list.");
    if (time < 0)
        throw(~time, "Time is negative.");
    if (time > 31536000)
        throw(~time, "Try to schedule a task LESS than a year from now?");
    
    // get a new db task id
    ++task_index;
    tid = task_index;
    
    // flags can be set in a system only add_task, for now set them as 'system
    flags = ['system];
    task_time = time();
    task = [tid, time + task_time, task_time, sender(), caller(), method, flags, args];
    .add_to_task_queue(task);
    return tid;
};

private method .add_to_task_queue() {
    arg task;
    
    refresh();
    
    // We don't want to run out of tics
    task_queue = $heap.push(task_queue, task, 2);
};

public method .block_task() {
    arg ident;
    var tasks;
    
    // I want to be atomic!
    // Add the task_id to the queue of blocked tasks for this identifier.
    if (blocked_tasks.contains(ident))
        tasks = (blocked_tasks[ident]) + [task_id()];
    else
        tasks = [task_id()];
    blocked_tasks = blocked_tasks.add(ident, tasks);
    
    // And go to sleep until we are woken.
    return (> suspend() <);
};

public method .cancel() {
    arg task_id;
    var objs;
    
    // suspended tasks
    if ((objs = (| suspended_tasks[task_id] |))) {
        if ((!(sender() in objs)) && (!($sys.is_system(sender()))))
            throw(~perm, (sender() + " may not cancel task ") + task_id);
        suspended_tasks = dict_del(suspended_tasks, task_id);
    
        // preempted tasks 
    } else if (!($sys.is_system(sender()))) {
        throw(~perm, (sender() + " may not kill task ") + task_id);
    }
    return (> cancel(task_id) <);
};

root method .core_scheduler() {
    suspended_tasks = #[];
    blocked_tasks = #[];
    task_queue = [];
};

private method .del_from_task_queue() {
    arg i;
    
    refresh();
    
    // this must *not* throw
    task_queue = $heap.del(task_queue, i, 2);
};

public method .del_sub_scheduler() {
    arg object;
    var pos, s;
    
    if (!($sys.is_admin(sender())))
        throw(~perm, "Only admins may delete sub schedulers.");
    if (type(object) != 'objnum)
        throw(~type, "Object must be a dbref.");
    pos = object in sub_schedulers;
    if (!pos)
        throw(~objnf, "Object not a sub scheduler.");
    s = [];
    if (pos > 1)
        s += [sub_schedulers.subrange(1, pos - 1)];
    if (s < (sub_schedulers.length()))
        s += [sub_schedulers.subrange(pos + 1)];
    sub_schedulers = s;
};

public method .del_task() {
    arg tid;
    var task, n;
    
    // sender must be system, for now.
    if (type(tid) != 'integer)
        throw(~type, "Task Identification must be an integer");
    for task in (task_queue) {
        n++;
        if ((task[1]) == tid) {
            ((sender() == (task[4])) && (caller() == (task[5]))) || (> .perms(sender(), 'system) <);
            .del_from_task_queue(n);
            return 1;
        }
    }
    throw(~tasknf, "No task found by that TID");
};

public method .has_blocked_tasks() {
    arg ident;
    
    return blocked_tasks.contains(ident);
};

public method .pulse() {
    var task, sub, t;
    
    // called by $sys.heartbeat
    if (caller() != $sys)
        throw(~perm, "Sender is not system");
    t = time();
    while (task_queue && (t > ((task_queue[1])[2]))) {
        task = task_queue[1];
        .remove_first_task();
        catch any
            (> (task[4]).as_this_run(task[4], task[6], task[8]) <);
        with
            (| ((task[4]).manager()).tell_traceback(traceback()) |);
    }
    
    // call sub schedulers 
    for sub in (sub_schedulers)
        (| sub.pulse() |);
};

private method .remove_first_task() {
    // sender must be an agent, or admin.
    catch any {
        .del_from_task_queue(1);
    } with {
        // $sys.log(traceback());
    }
    if (!task_queue)
        task_index = 1;
};

public method .resume() {
    arg task_id, @return_value;
    var objs;
    
    if ((objs = (| suspended_tasks[task_id] |))) {
        if ((!(sender() in objs)) && (!($sys.is_system(sender()))))
            throw(~perm, (sender() + " may not resume task ") + task_id);
        suspended_tasks = dict_del(suspended_tasks, task_id);
    }
    return (> resume(task_id, @return_value) <);
};

protected method .resume_job() {
    arg tid;
    
    (> .resume(tid) <);
};

public method .sleep() {
    arg howlong;
    
    .add_task(howlong, 'resume_job, task_id());
    .suspend(this());
};

public method .suspend() {
    arg @objs;
    
    objs += [user()];
    suspended_tasks = dict_add(suspended_tasks, task_id(), objs);
    return (> suspend() <);
};

public method .suspended_task() {
    arg task;
    
    return (> suspended_tasks[task] <);
};

public method .sys_add_task() {
    arg time, method, sender, caller, flags, @args;
    var task, i, j, tid, x, y, tmpq, task_time;
    
    // use `@info $scheduler' for more information. 
    // [tid, time, time(), sender(), caller(), method, flags, args]
    //
    if (!($sys.is_agent(sender())))
        throw(~perm, "Sender is not an agent or admin, use .add_task()");
    if ((type(time) != 'integer) || ((type(method) != 'symbol) || (type(args) != 'list)))
        throw(~type, "Arguments are not an integer, symbol, and list.");
    if (time < 1)
        throw(~time, "Time is negative.");
    if (time > 31536000)
        throw(~time, "Try to schedule a task LESS than a year from now?");
    if (!valid(sender))
        throw(~type, "The argument for sender is not a valid object");
    if (!valid(caller))
        throw(~type, "The argument for caller is not a valid object");
    if (type(flags) != 'list)
        throw(~type, "Send flags as a list of symbols");
    
    //
    ++task_index;
    tid = task_index;
    task_time = time();
    
    // flags can be set in a system only add_task, for now set them as 'system
    task = [tid, task_time + time, task_time, sender, caller, method, flags, args];
    .add_to_task_queue(task);
    return tid;
};

public method .task_info() {
    arg @args;
    
    (> .perms(sender(), 'system) <);
    return (> task_info(@args) <);
};

public method .task_queue() {
    // sender must be system, for now
    (> .perms(sender(), 'system) <);
    return task_queue;
};

public method .unblock_task() {
    arg ident;
    var tasks;
    
    // I want to be atomic!
    // The caller should have checked first, but we will fail silently.
    if (!(.has_blocked_tasks(ident)))
        return;
    
    // Get the blocked tasks queue for this identifier.
    tasks = blocked_tasks[ident];
    
    // If this is the last blocked task, then clear the queue, otherwise
    // just delete the task_id that we are resuming.
    if ((tasks.length()) == 1)
        blocked_tasks = blocked_tasks.del(ident);
    else
        blocked_tasks = blocked_tasks.add(ident, tasks.delete(1));
    
    // Wake it up and go.
    resume(tasks[1]);
};


