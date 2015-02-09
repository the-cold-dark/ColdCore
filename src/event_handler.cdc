
new object $event_handler: $foundation;

var $event_handler events = 0;
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $root created_on = 850790316;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_sys_events;
var $root inited = 1;
var $root managed = [$event_handler];
var $root manager = $event_handler;

public method .clear_event_hook() {
    arg event;
    var o;
    
    (> .perms(sender(), 'writer) <);
    if ((!hooks) || (!(hooks.contains(event))))
        return;
    for o in (hooks[event])
        (| o.event_hook_removed(event) |);
    hooks = dict_del(hooks, event);
    if (!hooks) {
        (| clear_var('hooks) |);
        (| clear_var('hooked) |);
    }
};

public method .deregister_event() {
    arg event, update_on;
    var value, event, src, status;
    
    (> .perms(sender()) <);
    if ((events.contains(update_on)) && ((events[update_on]).contains(event))) {
        // clean it up first.. (ignore status)
        [status, src] = (events[update_on])[event];
        switch (src) {
            case 'location:
                (| loc.unhook_from_event(event) |);
            case 'this:
                (| .unhook_from_event(event) |);
            default:
                (| src.hook_into_event(event) |);
        }
    
        // now cleanup 'events'
        value = (events[update_on]).del(event);
        if (value)
            events = events.add(update_on, value);
        else
            events = events.del(update_on);
        if (!events)
            clear_var('events);
    }
};

protected method .did_hook() {
    arg event, obj;
    
};

public method .event_hook_removed() {
    arg event;
    
    (> .perms(caller(), $event_handler) <);
};

public method .event_hooks() {
    if (hooks)
        return dict_keys(hooks);
    return [];
};

public method .event_notify() {
    arg event, origin, @args;
    
    if (caller() != $event_handler)
        throw(~perm, caller() + " is not $event_handler.");
};

public method .hook_events() {
    arg type;
    var status, source, event, l, all;
    
    if (events && (events.contains(type))) {
        all = events[type];
        events = events.del(type);
        l = .location();
        for event in (all) {
            [event, [status, source]] = event;
            switch (source) {
                case 'location:
                    l.hook_into_event(event);
                case 'this:
                    .hook_into_event(event);
                default:
                    source.hook_into_event(event);
            }
            all = all.add(event, [1, source]);
        }
        events = events.add(type, all);
    }
};

public method .hook_into_event() {
    arg event;
    
    if (!hooks)
        hooks = #[];
    (> .will_hook(event, sender()) <);
    hooks = dict_add(hooks, event, setadd((| hooks[event] |) || [], sender()));
    hooked = (hooked || #[]).setadd_elem(sender(), event);
    (| .did_hook(event, sender()) |);
};

public method .register_event() {
    arg event, update_on, src;
    var value, all;
    
    (> .perms(sender()) <);
    if (!events)
        events = #[];
    
    // If/when more are added.. also update $help_sys_event_register
    if ((update_on != 'move) && (update_on != 'startup))
        throw(~type, "Update on must be either 'move or 'startup");
    if (type(src) == 'symbol) {
        if ((src != 'location) && (src != 'this))
            throw(~type, "Source types must be either 'location or 'this.");
    } else if (type(src) != 'objnum) {
        throw(~type, "Source type must be either a symbol or object.");
    } else if (!(src.is($event_handler))) {
        throw(~type, ("Source " + (src.namef('ref))) + " is not an event handler.");
    }
    if (events.contains(update_on)) {
        all = events[update_on];
        if ((events[update_on]).contains(event)) {
            value = replace(all[event], 2, src);
            events = events.add(update_on, all.add(event, value));
        } else {
            events = events.add(update_on, all.add(event, [0, src]));
        }
    } else {
        events = events.add(update_on, #[[event, [0, src]]]);
    }
};

public method .send_event() {
    arg event, @args;
    var o;
    
    // some sort of perms checking..
    if ((!hooks) || (!(hooks.contains(event))))
        return;
    for o in (hooks[event]) {
        if (!valid(o)) {
            hooks = dict_add(hooks, event, setremove(hooks[event], o));
            hooked = (hooked || #[]).del_elem(o, event);
        }
        (| o.event_notify(event, sender(), @args) |);
    }
    if (!hooked)
        (| clear_var('hooked) |);
};

public method .unhook_events() {
    arg type, @loc;
    var all, event, status, source;
    
    if (events && (events.contains(type))) {
        all = events[type];
        events = events.del(type);
        loc = loc ? (loc[1]) : (.location());
        for event in (all) {
            [event, [status, source]] = event;
            switch (source) {
                case 'location:
                    (| loc.unhook_from_event(event) |);
                case 'this:
                    (| .unhook_from_event(event) |);
                default:
                    (| source.hook_into_event(event) |);
            }
            all = all.add(event, [0, source]);
        }
        events = events.add(type, all);
    }
};

public method .unhook_from_all() {
    var e;
    
    if ((!hooked) || (!(hooked.contains(sender()))))
        return;
    for e in (hooked[sender()])
        hooks = dict_add(hooks, e, setremove(hooks[e], sender()));
    hooked = dict_del(hooked, sender());
};

public method .unhook_from_event() {
    arg event;
    var events;
    
    if (hooks) {
        events = (| hooks[event] |) || [];
        events = setremove((| hooks[event] |) || [], sender());
        if (events)
            hooks = dict_add(hooks, event, setremove(hooks[event], sender()));
        else
            hooks = (| dict_del(hooks, event) |);
    }
    if (hooked)
        hooked = hooked.del_elem(sender(), event);
};

root method .uninit_event_handler() {
    var event, obj, update_on;
    
    for update_on in ((events || #[]).keys()) {
        for event in ((events[update_on]).keys())
            (| .deregister_event(event, update_on) |);
    }
    for obj in ((hooks || #[]).keys()) {
        for event in (hooks[obj])
            (| obj.event_hook_removed(event) |);
    }
};

protected method .will_hook() {
    arg event, obj;
    
};


