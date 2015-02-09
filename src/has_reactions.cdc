
new object $has_reactions: $foundation;

var $has_reactions active = 0;
var $has_reactions last_id = 0;
var $has_reactions reactions = 0;
var $root created_on = 809243338;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$has_reactions];
var $root manager = $has_reactions;

public method .active() {
    return active;
};

public method .add_reaction() {
    arg @args;
    var r, id;
    
    // make sure it doesn't already exist..
    for r in (reactions || #[]) {
        if (((r[2])[2]) == (args[2])) {
            if ((r[2]) == args)
                return r[1];
        }
    }
    (> .check_reaction_args(@args) <);
    reactions = dict_add(reactions || #[], ++last_id, args);
};

private method .check_reaction_args() {
    arg method, template, type, chance, times, hook, min, max;
    
    if (type(method) != 'symbol)
        throw(~type, "Match type (arg 1) is not a symbol.");
    if (type(template) != 'string)
        throw(~type, "Match template (arg 2) is not a string.");
    if (type(type) != 'symbol)
        throw(~type, "Reaction type (arg 3) is not a symbol.");
    if (type(chance) != 'integer)
        throw(~type, "Reaction chance (arg 4) is not a integer.");
    if (type(times) != 'integer)
        throw(~type, "Reaction times (arg 5) is not a integer.");
    if (type(hook) != 'list)
        throw(~type, "Reaction hook (arg 6) is not a list.");
    if ((!hook) || (type(hook[1]) != 'symbol))
        throw(~type, "Reaction hook method (arg 6[1]) is not a symbol.");
    if ((listlen(hook) == 1) || (type(hook[2]) != 'list))
        throw(~type, "Reaction hook arguments (arg 6[2]) is not a list.");
    if (type(min) != 'integer)
        throw(~type, "Reaction minimum delay (arg 7) is not a integer.");
    if (type(max) != 'integer)
        throw(~type, "Reaction maximum delay (arg 8) is not a integer.");
};

protected method .check_reactions() {
    arg type, str, sender;
    var rnum, t, id, chance, times, method, template, m;
    
    rnum = random(100);
    for t in ([type, 'any]) {
        if (!dict_contains(active, t))
            continue;
        for id in (dict_keys(active[t])) {
            [chance, times] = (active[t])[id];
            if (rnum > chance)
                break;
            [method, template] = reactions[id];
            if ((m = str.(method)(template))) {
                if (times == 1)
                    .remove_active(t, id);
                else if (times > 1)
                    .update_active(t, id, [chance, --times]);
                if ((.do_reaction(str, m, id, sender)) != 'continue)
                    return;
            }
        }
    }
};

public method .del_reaction() {
    arg id;
    
    // cruft up later
    reactions = reactions.del(id);
};

protected method .do_reaction(): forked  {
    arg str, match, id, sender;
    var method, args, min, max, time;
    
    [[method, args], min, max] = sublist(reactions[id], 6);
    time = random(max - min) + min;
    $scheduler.sleep(time);
    catch any
        return (> .(method)(str, match, sender, @args) <);
    with
        .tell_traceback(traceback());
    return 'stop;
};

protected method .remove_active() {
    arg key, id;
    
    active = dict_add(active, key, dict_del(active[key], id));
};

public method .set_active() {
    arg id;
    var ra, key, e, inserted, chance, times;
    
    if ((!reactions) || (!dict_contains(reactions, id)))
        throw(~noreaction, ("No reaction with id '" + id) + "'.");
    if (!active)
        active = #[];
    [key, chance, times] = sublist(reactions[id], 3, 3);
    if (dict_contains(active, key)) {
        ra = active[key];
        if (ra.contains(id))
            return .update_active(key, id, [chance, times]);
        active = dict_del(active, key);
        ra = map e in (ra) to (e);
    } else {
        ra = [];
    }
    for e in [1 .. listlen(ra)] {
        if ((((ra[e])[2])[1]) < chance) {
            ra = insert(ra, e, [id, [chance, times]]);
            inserted++;
        }
    }
    if (!inserted)
        ra += [[id, [chance, times]]];
    active = dict_add(active, key, hash e in (ra) to (e));
};

public method .tell_traceback() {
    arg @args;
    
};

protected method .update_active() {
    arg key, id, value;
    
    active = dict_add(active, key, dict_add(active[key], id, value));
};


