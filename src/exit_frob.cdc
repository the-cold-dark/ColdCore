
new object $exit_frob: $thing_frob, $exit;

var $described prose = [];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Exit Frob", "Exit Frob"];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 849130536;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$exit_frob];
var $root manager = $exit_frob;
var $thing gender = $gender_neuter;

frob method .all_defined_settings(): nooverride  {
    arg this;
    var sets;
    
    sets = (> pass(this) <);
    sets = dict_del(sets, "home");
    sets = dict_del(sets, "gender");
    return sets;
};

frob method .attach() {
    arg this, source, dest, @ignore;
    
    (source.is($place)) || throw(~place, (source.namef('ref)) + " is not a place.");
    (dest.is($place)) || throw(~place, (dest.namef('ref)) + " is not a place.");
    (| .detach() |);
    (> source.will_attach('source, sender()) <);
    (> dest.will_attach('dest, sender()) <);
    this = this.del('location);
    this = this.add('source, source);
    this = this.add('dest, dest);
    (> source.attach_exit('source, (<this(), this>)) <);
    (> dest.attach_exit('dest, (<this(), this>)) <);
};

protected method .change_data() {
    arg this, what, new, @remove;
    
    if (this['source])
        return (this['source]).update_exit_frob(this, what, new, @remove);
    else if (remove)
        return (<this(), (this.del(what))>);
    else
        return (<this(), (this.add(what, new))>);
};

frob method .clear_closable() {
    arg this, name;
    
    if (dict_contains(this, 'closed))
        this = .change_data(this, 'closed, 0, 'remove);
    return .change_data(this, 'closable, 0, 'remove);
};

frob method .close_cmd() {
    arg frob, cmdstr, cmd, this;
    var vars, m, source, dest;
    
    catch ~locked
        .try_lock(frob, sender());
    with
        return (traceback()[1])[2];
    if (dict_contains(frob, 'closable)) {
        if (dict_contains(frob, 'closed)) {
            return ((.name(frob)).capitalize()) + " is already closed.";
        } else {
            source = frob['source];
            dest = frob['dest];
            frob = .change_data(frob, 'closed, 1);
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", frob], ["this", frob.name()]];
            m = frob.eval_message("exit-close", $exit, vars);
            source.announce(m);
            dest.announce(m);
        }
    } else {
        return ((.name(frob)).capitalize()) + " cannot be closed.";
    }
};

public method .default_exit_msg_vars() {
    arg this, actor, @more;
    var vars;
    
    vars = #[["actor", actor.name()], ["source", (this['source]).name()], ["dest", (this['dest]).name()], ["this", name]];
    if (more)
        vars = dict_union(vars, more[1]);
    return vars;
};

frob method .description() {
    arg this, flags;
    var desc;
    
    if (dict_contains(this, 'closed))
        return (> pass(this, flags) <) + [(.name(this)) + " is closed."];
    if ((!(| flags['prose] |)) || (!valid(this['dest])))
        return (> pass(this, flags) <);
    return [(<$ctext_frob, [[(<$format, ["subj", [], [("Through " + (.name(this))) + " you see.."], 'do_subj]>)], #[]]>), (this['dest]).get_description(flags)];
};

frob method .dest() {
    arg this, @args;
    
    return this['dest];
};

frob method .destination_destroyed() {
    arg this;
    
    if (!(caller().is($place)))
        throw(~perm, "Must be called by $place");
    (this['source]).detach_exit('source, (<this(), this>));
};

frob method .detach(): nooverride  {
    arg this;
    
    (this['source]) && (| (this['source]).detach_exit('source, (<this(), this>)) |);
    (this['dest]) && (| (this['dest]).detach_exit('dest, (<this(), this>)) |);
};

frob method .discard() {
    arg data;
    
    if (!(.is_writable_by(data, sender())))
        throw(~perm, "Only writers and managers can discard exits.");
    return (> .detach(data) <);
};

frob method .exit_msg_vars() {
    arg this, actor, @more;
    var vars, s, d;
    
    s = this['source];
    d = this['dest];
    vars = #[["$actor", actor], ["actor", actor.name()], ["$source", s], ["source", s.name()], ["$dest", d], ["dest", d.name()], ["$this", this()], ["this", .name(this)]];
    if (more)
        vars = dict_union(vars, more[1]);
    return vars;
};

frob method .get_closable() {
    arg this, name, definer;
    
    return (| this['closable] |) || 0;
};

frob method .invoke() {
    arg this, @flags;
    var s, here, vars, m, actor, ln, v, dest;
    
    s = (actor = sender());
    if (dict_contains(this, 'closed)) {
        m = .eval_message(this, "exit-closed", $exit, .exit_msg_vars(this, s));
        return (this['source]).announce(m);
    }
    if (flags)
        flags = flags[1];
    else
        flags = #[];
    flags = flags.add('actor, s);
    flags = flags.add_elem('exclude, s);
    dest = this['dest];
    if (!valid(dest))
        return s.tell((.name(this)) + " has an invalid destination!");
    if (!(> .try_lock(this, s) <)) {
        v = #[["lock", (this['lock]).lock_name()]];
        m = .eval_message(this, "lock-fail", $exit, .exit_msg_vars(this, s, v));
        return (this['source]).announce(m);
    }
    vars = .exit_msg_vars(this, s);
    m = .eval_message(this, "invoke", $exit, vars);
    actor.tell(m);
    s.move_to(dest);
    dest.announce(m, actor);
    (this['source]).announce(m);
};

frob method .invoke_notify() {
    arg this, actor, flags;
    var vars, m, name;
    
    name = .name(this);
    if (flags.contains('simple)) {
        actor.tell("You take " + name);
        (this['dest]).announce((actor.name()) + " arrives.");
        (this['source]).announce((((actor.name()) + " goes through ") + name) + ".");
    } else {
        // this does not let you set specific messages on each exit--
        // we need to add $has_messages_frob
        vars = #[["$actor", actor], ["actor", actor.name()], ["$source", this['source]], ["source", (this['source]).name()], ["$dest", this['dest]], ["dest", (this['dest]).name()], ["$exit", this()], ["exit", name]];
        m = .eval_message(this, "invoke", $exit, vars);
        (this['dest]).announce(m);
        (this['source]).announce(m);
    }
};

frob method .is_visible_to() {
    arg this, whom;
    
    return (.visibility(this)) >= ((whom.location()).darkness());
};

frob method .lock() {
    arg this;
    
    if ((this.contains('lock)) && (this['lock]))
        return this['lock];
    return $true_lock_frob.new();
};

frob method .lock_cmd() {
    arg this, cmdstr, cmd, ignore;
    
    if (!(| .perms(this, sender()) |))
        return ((("Only " + ((.manager(this)).name())) + " can lock ") + (.name(this))) + "!";
    .change_data(this, 'lock, $false_lock_frob.new());
    return "You lock " + (.name(this));
};

frob method .lock_with_cmd() {
    arg this, cmdstr, cmd, ignore, prep, str;
    var frob;
    
    if (!(| .perms(this, sender()) |))
        return ((("Only " + ((.manager(this)).name())) + " can lock ") + (.name(this))) + "!";
    catch ~objnf, ~parse {
        frob = .change_data(this, 'lock, $lock_frob.parse(str, sender()));
        return ((("You lock " + (.name(this))) + " to allow ") + ((frob.lock()).lock_name('exit))) + ".";
    } with {
        switch (error()) {
            case ~objnf:
                return "Object not found in lock string.";
            case ~parse:
                return "Invalid lock string.";
        }
    }
};

frob method .manager() {
    arg this;
    
    return (this['source]).manager();
};

public method .new() {
    var this;
    
    this = (> pass() <).value();
    this = this.add('source, 0);
    this = this.add('dest, 0);
    return (<this(), this>);
};

public method .open() {
    arg this;
    
    return .change_data(this, 'closed, 0);
};

frob method .open_cmd() {
    arg frob, cmdstr, cmd, this;
    var vars, m, source, dest;
    
    catch ~locked
        .try_lock(frob, sender());
    with
        return (traceback()[1])[2];
    if (dict_contains(frob, 'closable)) {
        if (dict_contains(frob, 'closed)) {
            source = frob['source];
            dest = frob['dest];
            frob = .change_data(frob, 'closed, 0, 'remove);
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", frob], ["this", frob.name()]];
            m = frob.eval_message("exit-open", $exit, vars);
            source.announce(m);
            dest.announce(m);
        } else {
            return ((.name(frob)).capitalize()) + " is already opened.";
        }
    } else {
        return ((.name(frob)).capitalize()) + " cannot be opened.";
    }
};

frob method .perms() {
    arg this, what, @args;
    
    return (> (this['location]).perms(what, @args) <);
};

frob method .place_destroyed() {
    arg this, place;
    
    (> .perms(this, caller(), $place) <);
    .detach(this);
};

frob method .set_closable() {
    arg this, name, definer, value;
    
    if (value) {
        return .change_data(this, 'closable, 1);
    } else if (dict_contains(this, 'closable)) {
        if (dict_contains(this, 'closed))
            this = .change_data(this, 'closed, 0, 'remove);
        return .change_data(this, 'closable, 0, 'remove);
    }
    return (<this(), this>);
};

frob method .source() {
    arg this;
    
    return this['source];
};

public method .try_lock() {
    arg this, @args;
    
    return (| this['lock] |) ? ((this['lock]).try(@args)) : 1;
};

frob method .unlock_cmd() {
    arg this, cmdstr, cmd, ignore;
    
    if (!(| .perms(this, sender()) |))
        return ((("Only " + ((.manager(this)).name())) + " can lock ") + (.name(this))) + "!";
    .change_data(this, 'lock, $true_lock_frob.new());
    return "You unlock " + (.name(this));
};

frob method .will_move() {
    arg this, mover, place;
    
    throw(~nomove, "You cannot do that to an exit!");
};

frob method .writers(): nooverride  {
    arg this, @literal;
    
    if (literal)
        return [];
    return (this['source]).writers();
};


