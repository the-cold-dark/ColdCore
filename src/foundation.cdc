
new object $foundation: $root, $dmi_data;

var $foundation defined_msgs = 0;
var $foundation edit_types = 0;
var $foundation msgs = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$foundation];
var $root manager = $foundation;
var $root trusted = [];

private method ._parse_msg_branches(): nooverride  {
    arg name, attr, value;
    var branch, p, varkeys, sub, m, attrs;
    
    if (!value)
        value = ["general"];
    attrs = defined_msgs[name];
    for branch in (value) {
        sub = explode(branch, ".");
        if (listlen(sub) > 2)
            throw(~msgbad, ("Too many message branches '" + branch) + "'.");
        for p in (sub) {
            if (((p[1]) == "(") || (p == "*"))
                varkeys++;
            else if (!($code_lib.valid_message_id(p)))
                throw(~msgbad, ("Branch '" + p) + "' contains invalid characters.");
        }
    }
    if (varkeys) {
        varkeys = #[];
        for branch in (value) {
            if (("(" in branch) || ("*" in branch)) {
                if ((m = regexp(branch, "\.\(([^)]+)\)$"))) {
                    sub = strsed(branch, "\.\(([^)]+)\)$", "");
                    value = replace(value, branch in value, sub + ".*");
                    varkeys = dict_add(varkeys, sub, m[1]);
                } else if ((branch = strsed(branch, "\.\*$", ""))) {
                    varkeys = dict_add(varkeys, branch, "$" + branch);
                } else {
                    throw(~msgbad, "Variable branch part must be last.");
                }
            }
        }
        attrs = dict_add(attrs, 'varkeys, varkeys);
    } else if (dict_contains(attrs, 'varkeys)) {
        attrs = dict_del(attrs, 'varkeys);
    }
    return [attrs, value];
};

public method ._parse_msg_part(): nooverride  {
    arg name, all;
    var m, parts, mparts, mname, yes, x;
    
    m = [];
    parts = explode(name, "-");
    for mname in (all) {
        mparts = explode(mname, "-");
        if (listlen(parts) == listlen(mparts)) {
            yes = 1;
            for x in [1 .. listlen(parts)] {
                if (!match_begin(mparts[x], parts[x])) {
                    yes = 0;
                    break;
                }
            }
            if (yes)
                m += [mname];
        }
    }
    if (listlen(m) == 1)
        name = m[1];
    else if (listlen(m) > 1)
        throw(~ambig, ("Multiple messages match the name '" + name) + "'", m);
    else
        throw(~nomatch, ("No messages match the name '" + name) + "'");
    return name;
};

public method .all_defined_msgs(): nooverride  {
    var msgs, m, a;
    
    msgs = #[];
    for a in ([this()] + ancestors()) {
        if (a == definer())
            break;
        catch any
            msgs = dict_union(msgs, a.defined_msgs());
    }
    return msgs;
};

public method .all_edit_types(): nooverride  {
    var i, l, t;
    
    l = [];
    for i in (.ancestors()) {
        if (type((| (t = i.get_edit_types()) |)) == 'list)
            l = union(l, i.get_edit_types());
    }
    return l;
};

public method .all_msgs() {
    arg @ms;
    var d, out, m, a, ams, av, v, b, at;
    
    out = #[];
    if (ms)
        ms = ms[1];
    else
        ms = msgs || #[];
    d = $compiler.compile_cml(">>NO DEFAULT<<");
    for a in ([this()] + ancestors()) {
        if (a == definer())
            break;
        catch any {
            ams = a.msgs();
            for m in (a.defined_msgs()) {
                [m, at] = m;
                v = (| ms[m] |);
                av = (| ams[m] |);
                if (v) {
                    if (av)
                        v = dict_union(av, v);
                    else
                        v = dict_union(hash b in (at['branches]) to ([b, d]), v);
                } else if (av) {
                    v = av;
                } else {
                    v = hash b in (at['branches]) to ([b, d]);
                }
                out = dict_add(out, m, v);
            }
        }
    }
    return out;
};

public method .clear_msg(): nooverride  {
    arg name, @branches;
    var messages, branch, msg;
    
    (caller() != definer()) && (> .perms(sender()) <);
    messages = msgs || #[];
    if (!dict_contains(messages, name))
        return;
    if (!branches) {
        messages = dict_del(messages, name);
    } else {
        msg = messages[name];
        for branch in (branches) {
            if (dict_contains(msg, branch))
                msg = dict_del(msg, branch);
        }
        if (!msg)
            messages = dict_del(messages, name);
    }
    if (!messages)
        clear_var('msgs);
    else
        msgs = messages;
};

public method .configure() {
    arg set;
    
    // This is for post-creation configuration of a VR object.  It is used
    // to interactively configure the VR aspects and behaviour of an object.
    // It should be optional, any command hooking into configure should check
    // for a -conf?igure option first (which would imply skipping configuration).
    //
    // Overriding methods should pass() first, giving priority to their
    // ancestors.  The argument 'set' is a dictionary with symbol keys
    // defining what has been set.  Use the definer's name + "_" + setting
    // as the name of the key ("name" on $has_name would be 'has_name_name).
    // If something is already in the set dictionary, do not re-set it
    // again (for instance, if the command hooking into configure accepted
    // the name of the object on it's command line it would put
    // 'has_name_name in the dictionary and $has_name.configure() would not 
    // prompt for the name).
    //
    // "@skip" should always skip the setting, and not alter it.
    // if .prompt() returns 'aborted, throw ~abort.
    //
    (> .perms(sender()) <);
    return set;
};

public method .define_msg(): nooverride  {
    arg name;
    
    (> .perms(sender()) <);
    if ((.all_defined_msgs()).contains(name))
        throw(~msgexists, ("Message \"" + name) + "\" is already defined.");
    if (!($code_lib.valid_message_id(name)))
        throw(~msgbad, ("Message \"" + name) + "\" contains invalid characters.");
    defined_msgs = (.defined_msgs()).add(name, #[['branches, ["general"]]]);
};

public method .defined_msgs(): nooverride  {
    return defined_msgs || #[];
};

public method .environment() {
    return [];
};

public method .eval_message() {
    arg name, definer, vars;
    var eval, msg, varkeys;
    
    eval = (| definer.get_msg_attr(name, 'evaluator) |) || $bs_eval;
    msg = $message_frob.new_with(.get_msg(name, definer));
    vars = dict_add(vars, 'evaluator, eval);
    if ((varkeys = (| definer.get_msg_attr(name, 'varkeys) |)))
        vars = dict_add(vars, 'varkeys, varkeys);
    else
        vars = dict_add(vars, 'varkeys, 0);
    msg = msg.set_vars(vars);
    vars = dict_add(vars, 'time, 'pre);
    return msg.eval_ctext(vars);
};

public method .gender() {
    return $gender_neuter;
};

public method .gender_context() {
    return "it";
};

public method .get_default_msg(): nooverride  {
    arg name;
    var def, b;
    
    catch any {
        return msgs[name];
    } with {
        def = $compiler.compile_cml(">>NO DEFAULT<<");
        return hash b in (.get_msg_attr(name, 'branches)) to ([b, def]);
    }
};

public method .get_edit_types() {
    return edit_types || [];
};

public method .get_local_msg() {
    arg name;
    
    return msgs[name];
};

public method .get_msg() {
    arg name, definer;
    var get;
    
    if (!(get = (| definer.get_msg_attr(name, 'getter) |)))
        return dict_union(definer.get_default_msg(name), (| msgs[name] |) || #[]);
    return .(get)(name, definer);
};

public method .get_msg_attr(): nooverride  {
    arg name, attr;
    
    return (defined_msgs[name])[attr];
};

public method .local_to_environment() {
    arg obj;
    
    return obj in (.environment());
};

public method .match_environment() {
    arg str;
    var obj, env, found, match, target;
    
    if (!str)
        throw(~objnf, "No object specified.", str);
    str = str.strip_article();
    
    // Handle special cases.
    if (str in ["me", "my"]) {
        return this();
    } else if (((str[1]) == "$") || ((str[1]) == "#")) {
        return (> $object_lib.to_dbref(str) <);
    } else if ((str[1]) == "~") {
        str = str.subrange(2);
        if ((str[1]) != "~")
            return $user_db.match_begin(str);
    } else if (str in ["it", "him", "her"]) {
        return (| .match_context(str) |) || throw(~context, ("I don't see " + str) + " here, do you?");
    }
    
    // Start matching
    found = [];
    env = .environment();
    
    // special case ordinal references
    if ((match = $parse_lib.ordinal_reference(str)))
        return (> env.match_nth(@match) <);
    if ((match = $parse_lib.possessive_reference(str))) {
        if ((match[1]) == "me")
            obj = this();
        else
            obj = (> env.match_object(match[1]) <);
        if (!(obj.match_name(str))) {
            catch ~objnf, ~ambig, ~range {
                env = (| obj.contents() |) || [];
                if ((found = $parse_lib.ordinal_reference(match[2])))
                    return (> env.match_nth(@found) <);
                else
                    return (> env.match_object(match[2]) <);
            } with {
                if (error() == ~objnf)
                    throw(~objnf, (((obj.name()) + " does not have ") + ((match[2]).add_indefinite())) + ".");
                else if (error() == ~ambig)
                    throw(~ambig, ((("\"" + str) + "\" can match ") + ((((traceback()[1])[3]).mmap('namef, 'ref)).to_english("", " or "))) + ".");
                else
                    throw(~objnf, (obj.name()) + "'s what?");
            }
        }
    }
    catch any {
        return (> env.match_object(str) <);
    } with {
        if (error() == ~badfrob) {
            target = (traceback()[1])[3];
            obj = frob_value(target)['location];
            obj.del_frob_from_contents(target);
            throw(~badfrob, "Cleaned up bogus frob in your environment, try again..");
        }
        if (error() == ~objnf)
            throw(~objnf, ("You do not see " + (str.add_indefinite())) + " anywhere.");
        if (error() == ~ambig) {
            found = filter obj in ((traceback()[1])[3]) where ((obj.name()) == str);
            if (listlen(found) == 1)
                return found[1];
            if (found)
                found = (found.mmap('namef, 'ref)).to_english("", " or ");
            else
                found = (((traceback()[1])[3]).mmap('namef, 'ref)).to_english("", " or ");
            throw(~ambig, ((("\"" + str) + "\" can match ") + found) + ".");
        }
        rethrow(error());
    }
};

public method .msg_definer(): nooverride  {
    arg name;
    var a;
    
    for a in (ancestors()) {
        if (a == definer())
            break;
        catch any {
            if ((a.defined_msgs())[name])
                return a;
        }
    }
    throw(~invmsg, ("Message \"" + name) + "\" is not defined.");
};

public method .msgs(): nooverride  {
    return msgs || #[];
};

public method .parse_msg(): nooverride  {
    arg name, branch;
    var parser, name, def, b, parts, x, yes, m, mb, full, varkeys;
    
    if (!(def = (| .msg_definer(name) |))) {
        name = (> ._parse_msg_part(name, (.all_msgs()).keys()) <);
        def = (> .msg_definer(name) <);
    }
    if (!branch)
        return [def, name, "general"];
    if (listlen(branch) > 2)
        throw(~badmsg, "Too many message branches");
    m = [];
    varkeys = (| def.get_msg_attr(name, 'varkeys) |) || #[];
    for b in ((> def.get_msg_attr(name, 'branches) <)) {
        parts = explode(b, ".", "b");
        full = [];
        if (dict_contains(varkeys, parts[1])) {
            if ((mb = (| ._parse_msg_part(branch[1], [parts[1]]) |)))
                full += [mb] + sublist(branch, 2);
        } else if ((mb = (| ._parse_msg_part(branch[1], [parts[1]]) |))) {
            full += [mb];
        }
        if (full)
            m += [full];
    }
    branch = branch.join(".");
    if (listlen(m) == 1)
        full = m[1];
    else if (listlen(m) > 1)
        throw(~ambig, ("Multiple branches match the name '" + branch) + "'", m);
    else
        throw(~nomatch, ((("No branches of " + name) + " match '") + branch) + "'");
    if ((parser = (| def.get_msg_attr(name, 'parser) |)))
        return .(parser)(def, name, @full);
    return [def, name, join(full, ".")];
};

public method .set_edit_types(): nooverride  {
    arg t;
    
    (> .perms(sender()) <);
    if (t)
        edit_types = t;
};

public method .set_msg(): nooverride  {
    arg name, branch, definer, value;
    var compiler, branches, msg, definer, b;
    
    (> .perms(sender()) <);
    compiler = (| definer.get_msg_attr(name, 'compiler) |) || $compiler;
    value = (> compiler.compile_cml(value) <);
    branch ?= "general";
    branches = definer.get_msg_attr(name, 'branches);
    if ((!find b in (branches) where (match_pattern(branch, b) != 0)) && match_pattern(branch + ".", b))
        throw(~badbranch, ("Message branch \"" + branch) + "\" is invalid.");
    msgs ?= #[];
    msg = dict_add((| msgs[name] |) || #[], branch, value);
    msgs = dict_add(msgs, name, msg);
};

public method .set_msg_attr(): nooverride  {
    arg name, attr, value;
    var attrs;
    
    (> .perms(sender()) <);
    if ((!defined_msgs) || (!dict_contains(defined_msgs, name)))
        throw(~msgnf, (("Message \"" + name) + "\" is not defined on ") + this());
    if (attr == 'branches)
        [attrs, value] = (> ._parse_msg_branches(name, attr, value) <);
    else
        attrs = defined_msgs[name];
    if (!value)
        attrs = dict_del(attrs, attr);
    else
        attrs = dict_add(attrs, attr, value);
    defined_msgs = dict_add(defined_msgs, name, attrs);
};

public method .undefine_msg(): nooverride  {
    arg name;
    var d;
    
    (> .perms(sender()) <);
    if (!((.defined_msgs()).contains(name)))
        throw(~msgnf, (("Message \"" + name) + "\" is not defined by ") + this());
    
    // clear it on all descendants, then us
    for d in (.descendants()) {
        d.clear_msg(name);
        pause();
    }
    .clear_msg(name);
    
    // bye bye
    defined_msgs = dict_del(defined_msgs, name);
    if (!defined_msgs)
        clear_var('defined_msgs);
};

public method .will_inherit(): nooverride  {
    arg who;
    
    if ((this() != definer()) && (!(sender().has_ancestor(definer()))))
        throw(~perm, this() + " may only have parents who are descendants of $foundation");
    (> pass(who) <);
};


