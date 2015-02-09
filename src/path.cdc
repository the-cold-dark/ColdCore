
new object $path: $physical;

var $described prose = [];
var $dmi_data descriptions = #[];
var $foundation defined_msgs = #[["invoke", #[['branches, ["actor.*", "source.*", "dest.*"]], ['parser, 'parse_exit_msg], ['varkeys, #[["actor", "$source"], ["source", "$source"], ["dest", "$dest"]]]]], ["exit-open", #[['branches, ["actor", "general"]]]], ["exit-close", #[['branches, ["actor", "general"]]]], ["lock-fail", #[['branches, ["general", "actor"]]]], ["lock-try", #[['branches, ["general", "actor"]]]], ["lock-unlock", #[['branches, ["general", "actor"]]]], ["lock-lock", #[['branches, ["general", "actor"]]]], ["exit-closed", #[['branches, ["actor", "general"]]]]];
var $foundation msgs = #[["invoke", #[["actor", <$ctext_frob, [["You take ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>], ["source", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " goes through ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>], ["dest", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " arrives."], #[['this, $path]]]>]]], ["exit-close", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " closes ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>], ["actor", <$ctext_frob, [["You close ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>]]], ["exit-open", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " opens ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>], ["actor", <$ctext_frob, [["You open ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>]]], ["lock-fail", #[["actor", <$ctext_frob, [[<$generator, ["this", [], [], 'gen_this]>, " is locked."], #[['this, $path]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " tries to go through ", <$generator, ["this", [], [], 'gen_this]>, ", but it is locked."], #[]]>]]], ["lock-try", #[["actor", <$ctext_frob, [["You use ", <$generator, ["lock", [], [], 'gen_lock]>, " on ", <$generator, ["this", [], [], 'gen_this]>, "."], #[['this, $path]]]>], ["general", <$ctext_frob, [[], #[['this, $path]]]>]]], ["lock-unlock", #[["actor", <$ctext_frob, [["You unlock ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $path]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " unlocks ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $path]]]>]]], ["lock-lock", #[["actor", <$ctext_frob, [["You lock ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $path]]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " locks ", <$generator, ["this", [], [], 'gen_this]>, <$generator, ["withlock", [], [], 'gen_withlock]>, "."], #[['this, $path]]]>]]], ["exit-closed", #[["actor", <$ctext_frob, [["You try to go through ", <$generator, ["this", [], [], 'gen_this]>, ", but it is closed."], #[]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " tries to go through ", <$generator, ["this", [], [], 'gen_this]>, ", but it is closed."], #[]]>]]]];
var $has_commands local = #[];
var $has_commands remote = #[["@lock", [["@lock", "*", "@lock <this>", 'lock_cmd, #[[1, ['this, []]]]], ["@lock", "* with|to *", "@lock <this> with|to <any>", 'lock_with_cmd, #[[1, ['this, []]], [3, ['any, []]]]]]], ["@unlock", [["@unlock", "*", "@unlock <this>", 'unlock_cmd, #[[1, ['this, []]]]]]], ["open", [["open", "*", "open <this>", 'open_cmd, #[[1, ['this, []]]]]]], ["close", [["close", "*", "close <this>", 'close_cmd, #[[1, ['this, []]]]]]]];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Generic Path", "the Generic Path"];
var $path closable = 0;
var $path close_style = 0;
var $path closed = 0;
var $path lock = 0;
var $path msg_vars = #[["$actor", 0], ["actor", 0], ["$source", 0], ["source", 0], ["$dest", 0], ["dest", 0], ["$this", 0], ["this", 0], ["$lock", 0]];
var $path names = #[];
var $path transparent = 0;
var $path ways = #[];
var $root created_on = 881987340;
var $root defined_settings = #[["closable", #[['get, ['get_closable]], ['set, ['set_closable]], ['parse, ['is_boolean]], ['clear, ['clear_closable]], ['format, ['format_boolean]]]], ["transparent", #[['get, ['get_transparent]], ['set, ['set_transparent]], ['parse, ['parse_transparent]], ['clear, ['clear_transparent]], ['format, ['format_transparent]]]], ["close-style", #[['get, ['get_close_style]], ['set, ['set_close_style]], ['parse, ['parse_close_style]], ['clear, ['clear_close_style]], ['format, ['format_close_style]]]]];
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$path];
var $root manager = $path;

public method .add_name_template() {
    arg template, @args;
    var p, name, loc;
    
    (> .perms(sender()) <);
    if (args) {
        loc = args[1];
    } else {
        if (!user())
            throw(~error, "Unable to determine source for name -- no task user");
        loc = user().location();
    }
    name = (| names[loc] |) || ['normal, "path", "a ", []];
    template = template.trim();
    for p in (explode(template, "|")) {
        if (match_begin(name[2], p.strip()))
            throw(~redundant, ("Redundant name template part \"" + p) + "\" already matches name.");
    }
    name = replace(name, 4, setadd(name[4], template));
    names = dict_add(names, loc, name);
};

public method .attach() {
    arg src, dst, @ignore;
    
    (> .perms(sender()) <);
    (src.is($place)) || throw(~place, (src.namef('ref)) + " is not a place.");
    (dst.is($place)) || throw(~place, (dst.namef('ref)) + " is not a place.");
    (> src.will_attach('source, sender()) <);
    (> dst.will_attach('dest, sender()) <);
    if (!ways)
        ways = #[];
    ways = ways.add(src, dst);
    (> src.attach_exit('source, this()) <);
    (> dst.attach_exit('dest, this()) <);
};

protected method .clear_closable() {
    arg name;
    
    (| clear_var('closable) |);
};

protected method .clear_close_style() {
    arg name;
    
    (| clear_var('close_style) |);
};

protected method .clear_transparent() {
    arg name;
    
    (| clear_var('transparent) |);
};

public method .close_cmd() {
    arg cmdstr, cmd, this;
    var vars, m, source, dest;
    
    catch ~locked
        .try_lock(sender());
    with
        return (traceback()[1])[2];
    source = sender().location();
    dest = .get_way(source);
    if (closable) {
        if (closed)
            return ((.name()).capitalize()) + " is already closed.";
        else
            .close_path(sender(), source, dest);
    } else {
        return ((.name()).capitalize()) + " cannot be closed.";
    }
};

protected method .close_path() {
    arg actor, source, dest;
    var vars, m;
    
    if (!closable)
        throw(~perm, "That is not closable, what are you thinking?");
    closed = 1;
    vars = .path_msg_vars(actor, @.get_ways(actor));
    m = .eval_message("exit-close", $path, vars);
    source.announce(m);
    dest.announce(m);
};

public method .del_name_template() {
    arg template;
    var loc, name;
    
    (> .perms(sender()) <);
    if (!user())
        throw(~error, "Unable to determine source for name -- no task user");
    loc = user().location();
    name = (| names[loc] |) || ['normal, "path", "a ", []];
    names = dict_add(names, loc, replace(name, 4, setremove(name[4], template)));
};

protected method .description() {
    arg flags;
    var out, src;
    
    out = (> pass(flags) <);
    
    // transparent: -1=when-open, 0=yes, 1=no
    src = (flags['actor]).location();
    switch (transparent) {
        case 1:
            return out;
        case 0:
            if (closed)
                out += [(.name()) + " is closed."];
            return out + [(<$ctext_frob, [[(<$format, ["subj", [], [("Through " + (.name())) + " you see.."], 'do_subj]>)], #[]]>), (.dest(src)).get_description(flags)];
        case -1:
            if (closed)
                return out + [(.name()) + " is closed."];
            return out + [(<$ctext_frob, [[(<$format, ["subj", [], [("Through " + (.name())) + " you see.."], 'do_subj]>)], #[]]>), (.dest(src)).get_description(flags)];
    }
};

public method .dest() {
    arg @src;
    
    if (!ways)
        return $nowhere;
    if (!src)
        src = sender();
    else
        src = src[1];
    return (| ways[src] |) || throw(~noway, "No path exists from " + src);
};

protected method .detach() {
    arg source;
    var dest;
    
    if (ways && dict_contains(ways, source)) {
        source.detach_exit('source, this());
        dest = ways[source];
        dest.detach_exit('dest, this());
        if (dict_contains(names, source))
            names = dict_del(names, source);
        if (dict_contains(names, dest))
            names = dict_del(names, dest);
        ways = dict_del(ways, source);
    }
};

public method .exit_msg_vars() {
    arg actor, source, dest, @more;
    var vars;
    
    vars = dict_add(default_var('msg_vars), "$actor", actor);
    vars = dict_add(vars, "actor", actor.name());
    vars = dict_add(vars, "$source", source);
    vars = dict_add(vars, "source", source.name());
    vars = dict_add(vars, "$dest", dest);
    vars = dict_add(vars, "dest", dest.name());
    vars = dict_add(vars, "$this", this());
    vars = dict_add(vars, "this", .name());
    vars = dict_add(vars, "$lock", lock);
    if (more)
        vars = dict_union(vars, more[1]);
    return vars;
};

protected method .format_close_style() {
    arg value;
    
    if (value)
        return "manual";
    return "auto";
};

protected method .format_transparent() {
    arg value;
    
    switch (value) {
        case 1:
            return "no";
        case 0:
            return "yes";
        case -1:
            return "when-open";
        default:
            return "<<ERROR>>";
    }
};

public method .get_closable() {
    arg name, definer;
    
    return closable;
};

public method .get_close_style() {
    arg name, definer;
    
    return close_style;
};

public method .get_transparent() {
    arg name, definer;
    
    return transparent;
};

public method .get_way() {
    arg source;
    var dest;
    
    if (!(dest = (| ways[source] |)))
        throw(~invsrc, "You are not located in any source for this exit");
    if (!valid(dest))
        return actor.tell((.name()) + " has an invalid destination!");
    return dest;
};

protected method .get_ways() {
    arg actor;
    var s;
    
    s = actor.location();
    if (!dict_contains(ways, s))
        throw(~notexit, "That exit is not where you are.");
    return [s, ways[s]];
};

public method .hname() {
    arg @args;
    
    // WARNING: THIS IS WRONG AND WILL NOT WORK
    return ((("<a href=\"/bin/describe?target=" + (.objname())) + "\">") + (.name())) + "</a>";
};

root method .init_path() {
    names = #[];
};

public method .invoke() {
    arg @flags;
    var here, vars, m, actor, ln, v, dest, source, doclose;
    
    actor = sender();
    source = actor.location();
    dest = (> .get_way(source) <);
    if (closed) {
        if (close_style || (!(actor.is($user)))) {
            m = .eval_message("exit-closed", $path, .path_msg_vars(actor, source, dest));
            return source.announce(m);
        } else {
            .open_path(actor, source, dest);
            doclose = 1;
        }
    }
    if (flags)
        flags = flags[1];
    else
        flags = #[];
    flags = dict_add(flags, 'actor, actor);
    flags = flags.add_elem('exclude, actor);
    if (lock && (!(lock.try(actor)))) {
        v = #[["lock", lock.lock_name()]];
        m = .eval_message("lock-fail", $path, .path_msg_vars(actor, source, dest, v));
        return source.announce(m);
    }
    m = .eval_message("invoke", $path, .path_msg_vars(actor, source, dest));
    actor.tell(m);
    actor.move_to(dest);
    dest.announce(m, actor);
    source.announce(m);
    if (doclose)
        .close_path(actor, dest, source);
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

public method .match_name() {
    arg str;
    var m, t, name;
    
    name = .name('literal);
    if ((m = match_begin(name[2], str)))
        return m;
    for t in (name[4]) {
        if ((m = match_template(str, t)))
            return m;
    }
    return 0;
};

public method .match_name_exact() {
    arg str;
    
    return str == (.name('noarticle));
};

public method .name() {
    arg @args;
    var name, loc;
    
    if (user())
        loc = user().location();
    else
        loc = (| sender().location() |) || sender();
    if (!(name = (| names[loc] |)))
        name = (| dict_values(names)[1] |) || ['normal, "path", "a ", []];
    if (!args)
        return (name[3]) + (name[2]);
    switch (args[1]) {
        case 'type:
            return name[1];
        case 'noarticle:
            return (name[3]) + (name[2]);
        default:
            return name;
    }
};

public method .name_templates() {
    return (.name('literal))[4];
};

public method .open_cmd() {
    arg cmdstr, cmd, this;
    var vars, m, source, dest;
    
    catch ~locked
        .try_lock(sender());
    with
        return (traceback()[1])[2];
    source = sender().location();
    dest = .get_way(source);
    if (closable) {
        if (closed)
            .open_path(sender(), source, dest);
        else
            return ((.name()).capitalize()) + " is already open.";
    } else {
        return ((.name()).capitalize()) + " cannot be opened.";
    }
};

protected method .open_path() {
    arg actor, source, dest;
    var vars, m;
    
    if (!closable)
        throw(~perm, "That is not closable, what are you thinking?");
    (| clear_var('closed) |);
    vars = .path_msg_vars(actor, @.get_ways(actor));
    m = .eval_message("exit-open", $path, vars);
    source.announce(m);
    dest.announce(m);
};

protected method .parse_close_style() {
    arg value, @args;
    var bool;
    
    // 0=auto 1=manual
    if (match_begin(value, "manual"))
        return 1;
    else if (match_begin(value, "auto"))
        return 0;
    else
        throw(~invtype, "Invalid close-style setting, try: auto, manual");
};

public method .parse_exit_msg() {
    arg def, name, @branch;
    var target, obj;
    
    if (listlen(branch) == 1)
        return [def, name, branch[1]];
    target = branch[2];
    if (target == "here")
        obj = user().location();
    else if ((target == "source") || (target == "src"))
        obj = (| user().location() |);
    else if (match_begin(target, "destination") || (target == "there"))
        obj = (| ways[user().location()] |);
    else if (!(obj = (| $object_lib.to_dbref(target) |)))
        obj = (> user().match_environment(target) <);
    if ((!ways) || ((!dict_contains(ways, obj)) || (!(obj in (ways.values())))))
        throw(~invobj, ((("The branch '" + target) + "' matches ") + (obj.name())) + " which is not a valid way for the path.");
    return [def, name, ((branch[1]) + ".") + (obj.objname())];
};

protected method .parse_transparent() {
    arg value, @args;
    var bool;
    
    // -1=when-open, 0=yes, 1=no
    if ((bool = value.is_boolean()) != (-1)) {
        return !bool;
    } else if (value == "when-open") {
        if (!closable)
            throw(~inv, "Transparent setting of 'when-open' only works with closable paths.");
        return -1;
    } else {
        throw(~invtype, "Invalid transparency setting, try: yes, no, when-open");
    }
};

public method .path_msg_vars() {
    arg actor, source, dest, @more;
    var vars;
    
    vars = dict_add(default_var('msg_vars), "$actor", actor);
    vars = dict_add(vars, "actor", actor.name());
    vars = dict_add(vars, "$source", source);
    vars = dict_add(vars, "source", source.name());
    vars = dict_add(vars, "$dest", dest);
    vars = dict_add(vars, "dest", dest.name());
    vars = dict_add(vars, "$this", this());
    vars = dict_add(vars, "this", .path_name(source));
    vars = dict_add(vars, "$lock", lock);
    if (more)
        vars = dict_union(vars, more[1]);
    return vars;
};

public method .path_name() {
    arg loc, @args;
    var name, loc;
    
    if (!(name = (| names[loc] |)))
        name = (| dict_values(names)[1] |) || ['normal, "path", "a ", []];
    if (!args)
        return (name[3]) + (name[2]);
    switch (args[1]) {
        case 'type:
            return name[1];
        case 'noarticle:
            return (name[3]) + (name[2]);
        default:
            return name;
    }
};

public method .place_destroyed() {
    arg place;
    var s;
    
    (> .perms(caller(), $place) <);
    if (dict_contains(ways, place))
        .detach(place);
    for s in (ways || #[]) {
        if ((s[2]) == place)
            .detach(s[1]);
    }
    if (!ways)
        $sys.destroy_sender();
};

protected method .set_closable() {
    arg name, definer, value;
    
    if (value) {
        closable = 1;
    } else if (closable) {
        if (closed)
            (| clear_var('closed) |);
        (| clear_var('closable) |);
    }
};

protected method .set_close_style() {
    arg name, definer, value;
    
    if (!value)
        (| clear_var('close_style) |);
    else
        close_style = value;
};

public method .set_name() {
    arg name, @args;
    var type, loc, set;
    
    (> .perms(sender()) <);
    [(type ?= 'normal), (loc ?= 0)] = args;
    if (!loc) {
        if (!user())
            throw(~error, "Unable to determine source for name -- no task user");
        loc = user().location();
    }
    if ((!dict_contains(ways, loc)) && (!(loc in dict_values(ways))))
        throw(~invloc, ((loc.namef('ref)) + " is not a valid way for ") + this());
    (> $code_lib.valid_name(name, type) <);
    set = (| names[loc] |) || [0, 0, 0, []];
    set = replace(set, 1, type);
    set = replace(set, 2, name);
    switch (type) {
        case 'prop:
            set = replace(set, 3, "");
        case 'uniq:
            set = replace(set, 3, "the ");
        case 'normal:
            set = replace(set, 3, (name.a_or_an()) + " ");
    }
    names = dict_add(names, loc, set);
};

protected method .set_transparent() {
    arg name, definer, value;
    
    if (!value)
        (| clear_var('transparent) |);
    else
        transparent = value;
};

public method .source() {
    arg @dst;
    var i;
    
    if (!ways)
        return $nowhere;
    if (!dst)
        dst = sender();
    else
        dst = dst[1];
    if ((i = dst in dict_values(ways)))
        return dict_keys(ways)[i];
    throw(~noway, "No path exists from " + dst);
};

public method .try_lock() {
    arg @args;
    
    (.lock()).try(@args);
};

root method .uninit_nexit() {
    var s;
    
    for s in (ways)
        (| .detach(s) |);
    (| clear_var('ways) |);
    (| clear_var('lock) |);
    (| clear_var('closable) |);
    (| clear_var('closed) |);
    (| clear_var('msg_vars) |);
};

root method .uninit_path() {
    var s;
    
    for s in (ways || #[])
        (| .detach(s[1]) |);
    (| clear_var('ways) |);
    (| clear_var('lock) |);
    (| clear_var('closable) |);
    (| clear_var('closed) |);
    (| clear_var('msg_vars) |);
};

public method .unlock_cmd() {
    arg cmdstr, cmd, this;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    lock = $true_lock_frob.new();
    sender().tell("You unlock " + (.name()));
};

public method .ways() {
    return ways || #[];
};


