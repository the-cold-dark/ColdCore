
new object $exit: $physical;

var $described prose = [];
var $exit closable = 0;
var $exit closed = 0;
var $exit dest = $void;
var $exit lock = <$true_lock_frob, []>;
var $exit msg_vars = #[["$actor", 0], ["actor", 0], ["$source", 0], ["source", 0], ["$dest", 0], ["dest", 0], ["$this", 0], ["this", 0], ["$lock", 0]];
var $exit source = $void;
var $foundation defined_msgs = #[["invoke", #[['branches, ["actor", "source.*", "dest.*"]], ['parser, 'parse_exit_msg]]], ["exit-open", #[['branches, ["actor", "general"]]]], ["exit-close", #[['branches, ["actor", "general"]]]], ["lock-fail", #[['branches, ["general", "actor"]]]], ["lock-try", #[['branches, ["general", "actor"]]]], ["lock-unlock", #[['branches, ["general", "actor"]]]], ["lock-lock", #[['branches, ["general", "actor"]]]], ["exit-closed", #[['branches, ["actor", "general"]]]]];
var $foundation msgs = #[["invoke", #[["actor", <$ctext_frob, [["You take ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>], ["source", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " goes through ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>], ["dest", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " arrives."], #[['this, $exit]]]>]]], ["exit-close", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " closes ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>], ["actor", <$ctext_frob, [["You close ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>]]], ["exit-open", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " opens ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>], ["actor", <$ctext_frob, [["You open ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>]]], ["lock-fail", #[["actor", <$ctext_frob, [[<$generator, ["this", [], [], 'gen_this]>, " is locked."], #[['this, $exit]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " tries to take ", <$generator, ["this", [], [], 'gen_this]>, " but its locked!"], #[['this, $exit]]]>]]], ["lock-try", #[["actor", <$ctext_frob, [["You use ", <$generator, ["lock", [], [], 'gen_lock]>, " on ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $exit]]]>], ["general", <$ctext_frob, [[], #[['this, $exit]]]>]]], ["lock-unlock", #[["actor", <$ctext_frob, [["You unlock ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $exit]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " unlocks ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $exit]]]>]]], ["lock-lock", #[["actor", <$ctext_frob, [["You lock ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $exit]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " locks ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $exit]]]>]]], ["exit-closed", #[["actor", <$ctext_frob, [["You try to go through ", <$generator, ["this", [], [], 'gen_this]>, " but it is closed!"], #[['this, $exit]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " tries to take ", <$generator, ["this", [], [], 'gen_this]>, " but it is closed!"], #[['this, $exit]]]>]]]];
var $has_commands remote = #[["@lock", [["@lock", "*", "@lock <this>", 'lock_cmd, #[[1, ['this, []]]]], ["@lock", "* with|to *", "@lock <this> with|to <any>", 'lock_with_cmd, #[[1, ['this, []]], [3, ['any, []]]]]]], ["@unlock", [["@unlock", "*", "@unlock <this>", 'unlock_cmd, #[[1, ['this, []]]]]]], ["open", [["open", "*", "open <this>", 'open_cmd, #[[1, ['this, []]]]]]], ["close", [["close", "*", "close <this>", 'close_cmd, #[[1, ['this, []]]]]]]];
var $has_name name = ['uniq, "Generic Exit", "the Generic Exit"];
var $root created_on = 796268969;
var $root defined_settings = #[["closable", #[['get, ['get_closable]], ['set, ['set_closable]], ['clear, ['clear_closable]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$exit];
var $root manager = $exit;
var $root settings = #[["closable", "no"]];

public method .attach() {
    arg src, dst, @ignore;
    
    (> .perms(sender()) <);
    (src.is($place)) || throw(~place, (source.namef('ref)) + " is not a place.");
    (dst.is($place)) || throw(~place, (dest.namef('ref)) + " is not a place.");
    (| .detach() |);
    (> src.will_attach('source, sender()) <);
    (> dst.will_attach('dest, sender()) <);
    source = src;
    dest = dst;
    (> source.attach_exit('source, this()) <);
    (> dest.attach_exit('dest, this()) <);
};

protected method .clear_closable() {
    arg name;
    
    if (closed)
        (| clear_var('closed) |);
    (| clear_var('closable) |);
};

public method .close_cmd() {
    arg cmdstr, cmd, this;
    var vars, m;
    
    catch ~locked
        .try_lock(sender());
    with
        return (traceback()[1])[2];
    if (closable) {
        if (closed) {
            return ((.name()).capitalize()) + " is already closed.";
        } else {
            closed = 1;
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", this()], ["this", .name()]];
            m = .eval_message("exit-close", $exit, vars);
            source.announce(m);
            dest.announce(m);
        }
    } else {
        return ((.name()).capitalize()) + " cannot be closed.";
    }
};

protected method .description() {
    arg flags;
    var desc;
    
    if (closed)
        return (> pass(flags) <) + [(.name()) + " is closed."];
    if ((!(| flags['prose] |)) || (!valid(.dest())))
        return (> pass(flags) <);
    return [(<$ctext_frob, [[(<$format, ["subj", [], [("Through " + (.name())) + " you see.."], 'do_subj]>)], #[]]>), (.dest()).get_description(flags)];
};

public method .dest() {
    return dest;
};

public method .destination_destroyed() {
    var msg, line, name;
    
    (> .perms(caller(), $place) <);
    $sys.destroy_sender();
};

public method .detach() {
    source && (source.detach_exit('source, this()));
    dest && (dest.detach_exit('dest, this()));
    source = 0;
    dest = 0;
};

public method .exit_msg_vars() {
    arg actor, @more;
    var vars, esource, edest;
    
    esource = .source();
    edest = .dest();
    vars = #[["$actor", actor], ["actor", actor.name()], ["$source", esource], ["source", esource.name()], ["$dest", edest], ["dest", edest.name()], ["$this", this()], ["this", .name()], ["$lock", lock]];
    if (more)
        vars = dict_union(vars, more[1]);
    return vars;
};

public method .get_closable() {
    arg @args;
    
    return closable;
};

public method .invoke() {
    arg @flags;
    var s, here, vars, m, actor, ln, v, edest, esource;
    
    s = (actor = sender());
    esource = .source();
    edest = .dest();
    if (closed) {
        m = .eval_message("exit-closed", $exit, .exit_msg_vars(s));
        return esource.announce(m);
    }
    if (flags)
        flags = flags[1];
    else
        flags = #[];
    flags = flags.add('actor, s);
    flags = flags.add_elem('exclude, s);
    if (!valid(edest))
        return s.tell((.name()) + " has an invalid destination!");
    if (lock && (!(lock.try(s)))) {
        v = #[["lock", lock.lock_name()]];
        m = .eval_message("lock-fail", $exit, .exit_msg_vars(s, v));
        return esource.announce(m);
    }
    m = .eval_message("invoke", $exit, .exit_msg_vars(s));
    actor.tell(m);
    s.move_to(edest);
    edest.announce(m, actor);
    esource.announce(m);
};

private method .invoke_notify() {
    arg actor, flags;
    var vars, m;
    
    if (flags.contains('simple)) {
        actor.tell("You take " + (.name()));
        (.dest()).announce((actor.name()) + " arrives.");
        (.source()).announce((((actor.name()) + " goes through ") + (.name())) + ".");
    } else {
        vars = #[["$actor", actor], ["actor", actor.name()], ["$source", .source()], ["source", (.source()).name()], ["$dest", .dest()], ["dest", (.dest()).name()], ["$exit", this()], ["exit", .name()]];
        m = .eval_message("invoke", $exit, vars);
        (.dest()).announce(m);
        (.source()).announce(m);
    }
};

public method .is_visible_to() {
    arg whom;
    
    return (.visibility()) >= ((whom.location()).darkness());
};

public method .lock() {
    return lock || ($true_lock_frob.new());
};

public method .lock_cmd() {
    arg cmdstr, cmd, this;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    lock = $false_lock_frob.new();
    return "You lock " + (.name());
};

public method .lock_with_cmd() {
    arg cmdstr, cmd, this, prep, str;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    catch ~objnf, ~parse {
        lock = $lock_frob.parse(str, sender());
        return ((("You lock " + (.name())) + " to allow ") + (lock.lock_name('exit))) + ".";
    } with {
        switch (error()) {
            case ~objnf:
                return "Object not found in lock string.";
            case ~parse:
                return "Invalid lock string.";
        }
    }
};

public method .open_cmd() {
    arg cmdstr, cmd, this;
    var vars, m;
    
    catch ~locked
        .try_lock(sender());
    with
        return (traceback()[1])[2];
    if (closable) {
        if (closed) {
            clear_var('closed);
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", this()], ["this", .name()]];
            m = .eval_message("exit-open", $exit, vars);
            source.announce(m);
            dest.announce(m);
        } else {
            return ((.name()).capitalize()) + " is already open.";
        }
    } else {
        return ((.name()).capitalize()) + " cannot be opened.";
    }
};

public method .place_destroyed() {
    arg place;
    
    (> .perms(caller(), $place) <);
    .detach();
    if (sender() in [dest, source])
        $sys.destroy_sender();
};

public method .set_closable() {
    arg name, definer, value;
    
    if (value) {
        closable = 1;
    } else if (dict_contains(this, 'closable)) {
        if (closed)
            (| clear_var('closed) |);
        (| clear_var('closable) |);
    }
};

public method .source() {
    return source;
};

public method .try_lock() {
    arg @args;
    
    lock.try(@args);
};

root method .uninit_exit() {
    (| .detach() |);
    (| clear_var('source) |);
    (| clear_var('dest) |);
    (| clear_var('lock) |);
};

public method .unlock_cmd() {
    arg cmdstr, cmd, this;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    lock = $true_lock_frob.new();
    sender().tell("You unlock " + (.name()));
};


