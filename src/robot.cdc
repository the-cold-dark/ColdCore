
new object $robot: $body, $has_reactions;

var $body body_parts = #[];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["A generic automated robot object."], #[['this, $robot]]]>;
var $has_commands remote = #[["@reactions", [["@reactions", "*", "@reactions <this>", 'reactions_cmd, #[[1, ['this, []]]]]]], ["@del-r?eaction", [["@del-r?eaction", "* from|on *", "@del-r?eaction <number> from|on <this>", 'del_reaction_cmd, #[[1, ['number, []]], [3, ['this, []]]]]]], ["@add-r?eaction", [["@add-r?eaction", "* to * on *", "@add-r?eaction <any> to <any> on <this>", 'add_reaction_cmd, #[[1, ['any, []]], [3, ['any, []]], [5, ['this, []]]]]]], ["@deactivate-r?eaction|@dr", [["@deactivate-r?eaction|@dr", "* on *", "@deactivate-r?eaction|@dr <number> on <this>", 'deactivate_reaction_cmd, #[[1, ['number, []]], [3, ['this, []]]]]]], ["@activate-r?eaction|@ar", [["@activate-r?eaction|@ar", "* on *", "@activate-r?eaction|@ar <number> on <this>", 'activate_reaction_cmd, #[[1, ['number, []]], [3, ['this, []]]]]]]];
var $has_name name = ['uniq, "Robot", "the Robot"];
var $located location = $the_pit;
var $located obvious = 1;
var $location contents = [];
var $robot active = 0;
var $robot active_ids = 0;
var $robot last_id = 1;
var $robot match_types = #[["regexp", ['regexp, "rex"]], ["pattern", ['match_pattern, "pat"]], ["template", ['match_template, "tmp"]]];
var $robot reactions = #[];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core, 'fertile, 'general_cache];
var $root help_node = $help_obj_robot;
var $root inited = 1;
var $root managed = [$robot];
var $root manager = $robot;
var $thing gender = $gender_neuter;

public method .activate_reaction() {
    arg id;
    var ra, key, e, inserted, chance, times;
    
    // Make sure the sender is a writer, added by Sean 20 Feb 1998
    (> .perms(sender()) <);
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
    active_ids = dict_add(active_ids || #[], id, key);
    
    // Hook into 'social; .hook_into_events() will not add twice, so we're safe
    // Added by Sean 20 Feb 1998
    // Only hook if the type is not 'tell
    if (key != 'tell)
        .hook_into_event('social);
};

public method .activate_reaction_cmd() {
    arg cmdstr, cmd, int, prep, this;
    
    (> .perms(sender()) <);
    catch ~noreaction
        .activate_reaction(int);
    with
        return (traceback()[1])[2];
    sender().tell(((("Reaction " + int) + " activated on ") + (.name())) + ".");
};

public method .active() {
    return active;
};

public method .add_reaction() {
    arg @args;
    var r, id;
    
    // Make sure the sender is a writer, added by Sean
    (> .perms(sender()) <);
    
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

public method .add_reaction_cmd() {
    arg cmdstr, cmd, args, prep1, hook, prep2, me;
    var t, type, method, times, chance, min, max, hook_args, i, opts, o, def_opts;
    
    (> .perms(caller(), 'command) <);
    hook = (| hook.to_symbol() |);
    if (!hook)
        throw(~args, "Invalid hook");
    def_opts = [["t?ype", 1], ["m?ethod", 1], ["ti?mes", 1], ["c?hance", 1], ["min", 1], ["max", 1], ["a?rgs", 1]];
    [t, opts] = $parse_lib.getopt(args, def_opts);
    t = t.join();
    
    // Set the defaults
    method = 'regexp;
    type = 'tosay;
    chance = 100;
    times = -1;
    hook_args = [];
    min = 0;
    max = 0;
    catch any {
        // check the options!
        o = opts.slice(1);
        if ((i = "m?ethod" in o)) {
            method = (| ((opts[i])[4]).to_symbol() |);
            if (!method)
                throw(~args, "Invalid method specified with +m?ethod=??");
        }
        if ((i = "t?ype" in o)) {
            type = (| ((opts[i])[4]).to_symbol() |);
            if (!type)
                throw(~args, "No type specified with +t?ype=??");
        }
        if ((i = "c?hance" in o)) {
            chance = (| ((opts[i])[4]).to_number() |);
            if ((chance < 1) || (chance > 100))
                throw(~args, "+c?hance=?? requires an integer between 1 and 100");
        }
        if ((i = "ti?mes" in o)) {
            times = (| ((opts[i])[4]).to_number() |);
            if ((!times) || (times < (-1)))
                throw(~args, "+ti?mes=?? requires an integer >= -1");
        }
        if ((i = "min" in o)) {
            min = (| ((opts[i])[4]).to_number() |);
            if ((!min) || (min < 0))
                throw(~args, "+min=?? requires an integer >= 0");
        }
        if ((i = "max" in o)) {
            max = (| ((opts[i])[4]).to_number() |);
            if ((!max) || (max < 0))
                throw(~args, "+max=?? requires an integer >= 0");
        }
        if ((i = "a?rgs" in o)) {
            hook_args = (> fromliteral((opt[i])[4]) <);
            if (type(hook_args) != 'list)
                hook_args = [hook_args];
        }
        if (max < min)
            max = min;
        (> .add_reaction(method, t, type, chance, times, [hook, hook_args], min, max) <);
    } with {
        return (traceback()[1])[2];
    }
    return strfmt("Reaction %d added to %s.%s() with match method %s, type %s, chance %d, times %d, args %s, min_delay %s, and max_delay %s.", t, toliteral(this()), hook, toliteral(method), toliteral(type), chance, times, toliteral(hook_args), min, max);
};

private method .check_reaction_args() {
    arg method, template, type, chance, times, hook, min, max;
    
    (> .check_reaction_matchwith(method) <);
    (> .check_reaction_template(template) <);
    (> .check_reaction_type(type) <);
    (> .check_reaction_chance(chance) <);
    (> .check_reaction_times(times) <);
    (> .check_reaction_hook(hook) <);
    (> .check_reaction_hook_method(hook[1]) <);
    (> .check_reaction_hook_args(hook[2]) <);
    (> .check_reaction_min(min) <);
    (> .check_reaction_max(max) <);
};

private method .check_reaction_chance() {
    arg chance;
    
    if (type(chance) != 'integer)
        throw(~type, "Reaction chance is not a integer.");
};

private method .check_reaction_hook() {
    arg hook;
    
    if (type(hook) != 'list)
        throw(~type, "Reaction hook is not a list.");
    if (listlen(hook) != 2)
        throw(~type, "Reaction hook is not a two element list.");
};

private method .check_reaction_hook_args() {
    arg args;
    
    if (type(args) != 'list)
        throw(~type, "Reaction hook arguments is not a list.");
};

private method .check_reaction_hook_method() {
    arg method;
    
    if (type(method) != 'symbol)
        throw(~type, "Reaction hook method is not a symbol.");
};

private method .check_reaction_matchwith() {
    arg method;
    
    if (type(method) != 'symbol)
        throw(~type, "Match type is not a symbol.");
};

private method .check_reaction_max() {
    arg max;
    
    if (type(max) != 'integer)
        throw(~type, "Reaction maximum delay is not a integer.");
};

private method .check_reaction_min() {
    arg min;
    
    if (type(min) != 'integer)
        throw(~type, "Reaction minimum delay is not a integer.");
};

private method .check_reaction_template() {
    arg template;
    
    if (type(template) != 'string)
        throw(~type, "Match template is not a string.");
};

private method .check_reaction_times() {
    arg times;
    
    if (type(times) != 'integer)
        throw(~type, "Reaction times is not a integer.");
};

private method .check_reaction_type() {
    arg type;
    
    if (type(type) != 'symbol)
        throw(~type, "Reaction type is not a symbol.");
};

protected method .check_reactions() {
    arg type, str, sender;
    var rnum, t, id, chance, times, method, template, m, types;
    
    rnum = random(100);
    if (type == 'tell)
        types = ['tell, 'any];
    else
        types = [type, 'notell, 'any];
    for t in (types) {
        if (!dict_contains(active, t))
            continue;
        for id in (dict_keys(active[t])) {
            [chance, times] = (active[t])[id];
            if (rnum > chance)
                break;
            [method, template] = reactions[id];
            if ((!template) || (m = str.(method)(template))) {
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

public method .connected() {
    // to simulate a user
    return .active();
};

public method .connected_time() {
    arg @args;
    
    [(args ?= 'dhms)] = args;
    if (!(.active()))
        return "Inactive";
    switch (args) {
        case 'seconds:
            return 0;
        default:
            return "";
    }
};

public method .deactivate_reaction() {
    arg id;
    
    // sender should be a writer.  added by Sean 20 Feb 1998
    (> .perms(sender()) <);
    if (active_ids && dict_contains(active_ids, id)) {
        .remove_active(active_ids[id], id);
        active_ids = dict_del(active_ids, id);
        if (!active_ids) {
            clear_var('active_ids);
            .unhook_from_event('social);
        }
    }
};

public method .deactivate_reaction_cmd() {
    arg cmdstr, cmd, int, prep, this;
    
    (> .perms(sender()) <);
    .deactivate_reaction(int);
    sender().tell(((("Reaction " + int) + " deactivated on ") + (.name())) + ".");
};

public method .del_reaction() {
    arg id;
    var key;
    
    (> .perms(sender()) <);
    if (!dict_contains(reactions, id))
        return;
    (| .deactivate_reaction(id) |);
    reactions = reactions.del(id);
};

public method .del_reaction_cmd() {
    arg cmdstr, cmd, id, @args;
    
    (> .perms(caller(), 'command) <);
    .del_reaction(id);
    return ((("Removed reaction " + id) + " from ") + (.name())) + ".";
};

protected method .do_reaction(): forked  {
    arg str, match, id, sender;
    var method, args, min, max, time, range;
    
    [[method, args], min, max] = sublist(reactions[id], 6);
    range = max - min;
    if (range < 2)
        time = 1;
    else
        time = random(range) + min;
    $scheduler.sleep(time);
    catch any
        return (> .(method)(str, match, sender, @args) <);
    with
        .tell_traceback(traceback());
    return 'stop;
};

public method .event_notify() {
    arg event, origin, @args;
    
    if (caller() != $event_handler)
        throw(~perm, caller() + " is not $event_handler.");
    if (!(.active()))
        return;
    if (event == 'social)
        .check_reactions(args[2], args[3], args[1]);
};

public method .idle_time() {
    arg @args;
    
    return "";
};

public method .match_type() {
    arg type;
    
    type = strsed(tostr(type), "match_", "");
    if (!dict_contains(match_types, type))
        throw(~type, "Invalid type matcher: " + type);
    return (| match_types[type] |);
};

public method .parse_line() {
    arg line;
    var parse;
    
    (> .perms(sender()) <);
    catch any {
        parse = $command_parser.parse(this(), line, $null_parser);
        (> .handle_parser_result(line, @parse) <);
    } with {
        if (error() == ~stop) {
            if ((traceback()[1])[2])
                .tell((traceback()[1])[2]);
        } else if ((.manager()) != this()) {
            (.manager()).tell(traceback().fmt_tb());
        } else {
            .tell_traceback(traceback());
        }
    }
};

protected method .react_command() {
    arg str, match, sender, cmd;
    
    .parse_line(cmd);
};

protected method .react_subcmd() {
    arg str, match, sender, cmd;
    var m;
    
    cmd = strsub(cmd, "%P", sender.name());
    for m in [1 .. listlen(match)]
        cmd = strsub(cmd, "%" + m, match[m]);
    .parse_line(cmd);
};

public method .reactions() {
    return reactions;
};

public method .reactions_cmd() {
    arg cmdstr, cmd, this;
    var id, m, tmpl, type, chance, times, method, args, max, min, out, t, a;
    
    // [id, [match, template, type, chance, times, [method, args], max, min]]
    out = [];
    for id in (dict_keys(reactions || #[])) {
        [m, tmpl, type, chance, times, [method, args], min, max] = reactions[id];
        t = $robot.match_type(m);
        a = dict_contains(active_ids || #[], id);
        out += [strfmt("%l%3r %3r %4r %6l %8c %22l %l %l", a ? "*" : " ", id, chance, (times == (-1)) ? "inf" : times, type, (min == max) ? min : ((min + "~") + max), method, t[2], tmpl ? (("\"" + tmpl) + "\"") : "anything")];
    }
    if (out)
        return (["-- Defined Reactions:", "  ID %CH    # TYPE    DELAY   HOOK                   MT  TEMPLATE"] + out) + ["--"];
    return "-- No Reactions Defined --";
};

protected method .remove_active() {
    arg key, id;
    
    active = dict_add(active, key, dict_del(active[key], id));
    if (!(active[key]))
        active = dict_del(active, key);
    if (!active)
        clear_var('active);
};

public method .startup() {
    (> .perms(sender(), 'trusts) <);
    .hook_events('startup);
};

public method .tell() {
    arg what, @who;
    var line;
    
    if (!(.active()))
        return;
    switch (type(what)) {
        case 'list:
            for line in (what)
                .tell(line, @who);
        case 'string:
            // drop through, this is what we want
        default:
            return;
    }
    if (who && (sender().is($place)))
        who = who[1];
    else
        who = sender();
    if (who == this())
        return;
    .check_reactions('tell, what, who);
};

public method .tell_traceback() {
    arg @args;
    
};

protected method .update_active() {
    arg key, id, value;
    
    active = dict_add(active, key, dict_add(active[key], id, value));
};

public method .update_reaction() {
    arg id, part, value;
    var r, chance, times, active;
    
    (> .perms(sender()) <);
    if (!(reactions.contains(id)))
        throw(~noreaction, ("No reaction with id \"" + id) + "\".");
    r = reactions[id];
    if ((active = dict_contains(active_ids, id)))
        .deactivate_reaction(id);
    switch (part) {
        case 'matchwith:
            (> .check_reaction_matchwith(value) <);
            r = replace(r, 1, value);
        case 'template:
            (> .check_reaction_template(value) <);
            r = replace(r, 2, value);
        case 'type:
            (> .check_reaction_type(value) <);
            r = replace(r, 3, value);
        case 'chance:
            (> .check_reaction_chance(value) <);
            r = replace(r, 4, value);
        case 'times:
            (> .check_reaction_times(value) <);
            r = replace(r, 5, value);
        case 'method, 'hook_method:
            (> .check_reaction_hook_method(value) <);
            r = replace(r, 6, replace(r[6], 1, value));
        case 'args, 'hook_args:
            (> .check_reaction_hook_args(value) <);
            r = replace(r, 6, replace(r[6], 2, value));
        case 'min, 'min_delay:
            (> .check_reaction_min(value) <);
            r = replace(r, 7, value);
        case 'max, 'max_delay:
            (> .check_reaction_max(value) <);
            r = replace(r, 8, value);
        default:
            throw(~invpart, ("Invalid part '" + part) + ".");
    }
    reactions = reactions.add(id, r);
    if (active)
        .activate_reaction(id);
};


