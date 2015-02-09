
new object $thing_frob: $frob, $thing;

var $described prose = [];
var $has_name name = ['uniq, "Thing Frob", "the Thing Frob"];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core, 'frob];
var $root inited = 1;
var $root managed = [$thing_frob];
var $root manager = $thing_frob;
var $thing gender = $gender_neuter;

frob method .add_name_template() {
    arg this, template;
    var new;
    
    new = setadd(.name_templates(this), template);
    return .change_data(this, 'name_templates, new);
};

frob method .all_defined_settings(): nooverride  {
    arg this;
    
    (> .perms(this, sender()) <);
    return ._all_defined_settings();
};

frob method .all_local_commands() {
    arg this;
    
    return pass();
};

frob method .all_msgs(): nooverride  {
    arg this;
    
    if (dict_contains(this, 'msgs))
        return pass(this['msgs]);
    return pass();
};

frob method .all_remote_commands() {
    arg this;
    
    return pass();
};

frob method .all_shortcuts() {
    arg this;
    
    return pass();
};

protected method .change_data() {
    arg this, what, new, @remove;
    var l;
    
    l = this['location];
    if (valid(l)) {
        if ((<this(), this>) in (l.contents()))
            (this['location]).del_frob_from_contents((<this(), this>));
    
        //    else if (what != 'location)
        //        throw(~perm, "Bogus location information in frob.");
    }
    if (remove)
        this = this.del(what);
    else
        this = this.add(what, new);
    if (valid(this['location]))
        (this['location]).add_frob_to_contents((<this(), this>));
    return (<this(), this>);
};

frob method .clear_msg(): nooverride  {
    arg this, name, @branches;
    var messages, branch, msg;
    
    (caller() != definer()) && (> .perms(this, sender()) <);
    if (dict_contains(this, 'msgs))
        messages = this['msgs];
    else
        messages = #[];
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
        return .change_data(this, 'msgs, 0, 'remove);
    else
        return .change_data(this, 'msgs, messages);
};

frob method .clear_setting(): nooverride  {
    arg this, name, definer;
    var info, args, settings;
    
    (caller() == definer()) || (> .perms(this, sender()) <);
    info = (> definer.setting_info(name) <);
    if (dict_contains(info, 'clear)) {
        args = sublist(info['clear], 2);
        return (> .((info['clear])[1])(this, name) <);
    } else if (dict_contains(this, 'settings) && dict_contains(this['settings], name)) {
        settings = dict_del(settings, name);
        if (!settings)
            return .change_data(this, 'settings, 0, 'remove);
        else
            return .change_data(this, 'settings, settings);
    }
};

frob method .configure() {
    arg this, set;
    var p, end, ctext, s, still, type;
    
    (> .perms(this, sender()) <);
    s = sender();
    still = ("Do you still want to describe " + (.name(this))) + "? [no] ";
    if (!(set.contains('described_prose))) {
        while (!end) {
            if (.is(this, $path))
                type = "exit ";
            else
                type = "";
            p = s.read((("Describe " + type) + (.name(this))) + ", Enter \".\" to finish or \"@abort\" to abort description.");
            if (p == 'aborted) {
                end = !(s.prompt_yesno(still, 0));
            } else {
                catch any {
                    ctext = (> $compiler.compile_cml(p) <);
                    s.tell(["You submitted the following description:", ""]);
                    s.tell(ctext);
                    s.tell("");
                    if (!(end = s.prompt_yesno("Keep this description? [yes] ")))
                        ctext = 0;
                } with {
                    s.tell(["The following CML compiler error occurred:", "  ", (traceback()[1])[2]]);
                    end = !(s.prompt_yesno(still, 0));
                }
            }
        }
        if (ctext)
            this = (.set_prose(this, ctext)).value();
        set = set.add('described_prose, 1);
    }
    return [this, set];
};

frob method .del_name_template() {
    arg this, template;
    var new;
    
    new = setremove(.name_templates(this), template);
    return .change_data(this, 'name_templates, new);
};

frob method .description() {
    arg this, flags;
    var out;
    
    out = (<$ctext_frob, [[(<$format, ["subj", [], [.name(this)], 'do_subj]>)], #[]]>);
    if ((| flags['prose] |))
        return [out, .prose(this)];
    return [out];
};

frob method .did_move() {
    arg this;
    
    return (<this(), this>);
};

frob method .discard() {
    arg data;
    
    //// just allow anybody to discard for now..
    //  if (data['manager] != sender())
    //      throw(~perm, "You are not the manager of " + .name(data));
    (data['location]).del_frob_from_contents((<this(), data>));
};

frob method .eval_message() {
    arg this, name, definer, vars;
    var eval, msg;
    
    eval = (| definer.get_msg_attr(name, 'evaluator) |) || $bs_eval;
    msg = $message_frob.new_with(.get_msg(this, name, definer));
    vars = dict_add(vars, 'evaluator, eval);
    msg = msg.set_vars(vars);
    vars = dict_add(vars, 'time, 'pre);
    return msg.eval_ctext(vars);
};

frob method .format_setting(): nooverride  {
    arg this, name, definer, value;
    var i, args;
    
    return pass(name, definer, value);
};

frob method .get_command_info() {
    arg this, @args;
    
    return pass(@args);
};

frob method .get_description(): nooverride  {
    arg this, @dflags;
    var flags, f;
    
    flags = #[['prose, 1], ['actor, sender()]];
    if (dflags && (type(dflags[1]) == 'dictionary)) {
        dflags = dflags[1];
        for f in (dflags.keys())
            flags = dict_add(flags, f, dflags[f]);
    }
    return .description(this, flags);
};

frob method .get_lock() {
    arg this, name, definer;
    
    return (| this['lock] |) || (<$true_lock_frob, []>);
};

frob method .get_msg(): nooverride  {
    arg this, name, definer;
    
    return dict_union(definer.get_default_msg(name), (| (this['msgs])[name] |) || #[]);
};

frob method .get_setting(): nooverride  {
    arg this, name, definer;
    var i, settings;
    
    i = definer.setting_info(name);
    if (dict_contains(i, 'access))
        (> .((i['access])[1])(this, name, sender(), caller(), @sublist(i['access], 2.0)) <);
    if (dict_contains(i, 'get))
        return (> .((i['get])[1])(this, name, definer, @sublist(i['get], 2)) <);
    if ((!dict_contains(this, 'settings)) || (!dict_contains(this['settings], name)))
        return (> pass(name, definer) <);
    return (this['settings])[name];
};

frob method .is_obvious_to() {
    arg this, whom;
    
    return 1;
};

frob method .is_writable_by() {
    arg this, obj;
    
    return (| obj in (.writers(this)) |) || ($sys.is_system(obj));
};

frob method .local_commands() {
    arg this;
    
    return pass();
};

frob method .location() {
    arg this;
    
    return (| this['location] |) || $nowhere;
};

frob method .lock() {
    arg this;
    
    return this['lock];
};

frob method .manager() {
    arg this;
    
    return this['manager];
};

frob method .match_name() {
    arg this, str;
    var t, m;
    
    if (!str)
        return 0;
    if ((m = match_begin((this['name])[2], str)))
        return 1;
    if (this.contains('name_templates)) {
        for t in (this['name_templates]) {
            if ((m = match_template(str, t)))
                return 1;
        }
    }
    return 0;
};

frob method .move_to() {
    arg data, place;
    var location;
    
    if (!(place.has_ancestor($location)))
        throw(~type, "Argument is not a location.");
    location = data['location];
    if (!valid(location))
        location = $nowhere;
    (> .will_move(data, sender(), place) <);
    return .change_data(data, 'location, place);
};

frob method .msg_definer(): nooverride  {
    arg this, name;
    
    return pass(name);
};

frob method .msgs(): nooverride  {
    arg this;
    
    return (| this['msgs] |) || #[];
};

frob method .name() {
    arg dict, @args;
    var name;
    
    name = dict['name];
    if (!name)
        return tostr(this());
    if (!args)
        return name[3];
    switch (args[1]) {
        case 'type:
            return name[1];
        case 'noarticle:
            return name[2];
        default:
            return name;
    }
};

frob method .name_templates() {
    arg this;
    
    return (| this['name_templates] |) || [];
};

frob method .namef() {
    arg dict, @args;
    
    return .name(dict);
};

public method .new() {
    var location;
    
    if (sender().is($location))
        location = sender();
    else if (sender().is($located))
        location = sender().location();
    else
        location = $nowhere;
    return (<this(), #[['prose, []], ['location, location], ['manager, sender()], ['name, .name('literal)]]>);
};

public method .new_with() {
    arg @args;
    var name, prose, data, new;
    
    name = (listlen(args) > 0) && (args[1]);
    prose = (listlen(args) > 1) && (args[2]);
    new = .new();
    if (prose)
        new = new.set_prose(prose);
    if (name)
        new = new.set_name(name);
    return new;
};

frob method .perms() {
    arg this, what, @args;
    
    return (what == (this['manager])) || (> (this['location]).perms(what, @args) <);
};

frob method .prose() {
    arg this, @no_default;
    
    return (| this['prose] |) || (no_default ? 0 : "You see nothing special");
};

frob method .remote_commands() {
    arg this;
    
    return pass();
};

frob method .set_gender(): nooverride  {
    arg name, definer, value;
    
    throw(~perm, "You cannot set the gender on frobs, sorry.");
};

frob method .set_lock() {
    arg this, name, definer, value;
    
    if (class(value) == $true_lock_frob)
        return .change_data(this, 'lock, 0, 'remove);
    else
        return .change_data(this, 'lock, value);
};

frob method .set_msg(): nooverride  {
    arg this, name, branch, definer, value;
    var compiler, branches, msg, definer, msgs;
    
    (> .perms(this, sender()) <);
    compiler = (| definer.get_msg_attr(name, 'compiler) |) || $compiler;
    value = (> compiler.compile_cml(value) <);
    branch ?= "general";
    if (!(branch in (definer.get_msg_attr(name, 'branches))))
        throw(~badbranch, ((("Message branch \"" + name) + ".") + branch) + "\" is not defined.");
    if (dict_contains(this, 'msgs))
        msgs = this['msgs];
    else
        msgs = #[];
    msg = dict_add((| msgs[name] |) || #[], branch, value);
    msgs = dict_add(msgs, name, msg);
    return .change_data(this, 'msgs, msgs);
};

frob method .set_name() {
    arg this, new, @args;
    var type;
    
    if (!new)
        return;
    [(type ?= 'normal)] = args;
    (> $code_lib.valid_name(new, type) <);
    switch (type) {
        case 'prop:
            new = [type, new, new];
        case 'uniq:
            new = [type, new, "the " + new];
        case 'normal:
            new = [type, new, ((new.a_or_an()) + " ") + new];
        default:
            throw(~invarg, "Type must be one of: 'prop, 'normal or 'uniq.");
    }
    return .change_data(this, 'name, new);
};

frob method .set_prose() {
    arg this, new;
    
    return .change_data(this, 'prose, new);
};

frob method .set_setting(): nooverride  {
    arg this, name, definer, value;
    var i, args, settings;
    
    (> .perms(this, sender()) <);
    i = (> definer.setting_info(name) <);
    if (dict_contains(i, 'parse)) {
        args = sublist(i['parse], 2);
        catch ~methodnf
            value = (> .((i['parse])[1])(value, @args) <);
        with
            value = (> $settings.((i['parse])[1])(value, @args) <);
    }
    if (dict_contains(i, 'set)) {
        return (> .((i['set])[1])(this, name, definer, value, @sublist(i['set], 2)) <);
    } else {
        settings = dict_add((| this['settings] |) || #[], name, value);
        return .change_data(this, 'settings, settings);
    }
};

frob method .set_visibility() {
    arg this, name, definer, value;
    
    return .change_data(this, 'visibility, value);
};

frob method .setting_definer(): nooverride  {
    arg this, name;
    
    return pass(name);
};

frob method .shortcuts() {
    arg this;
    
    return pass();
};

public method .try_lock() {
    arg this, @args;
    
    return (| this['lock] |) ? ((this['lock]).try(@args)) : 1;
};

frob method .visibility() {
    arg this, @args;
    
    return (| this['visibility] |) || 0;
};

frob method .will_move() {
    arg this, mover, place;
    
    if (!(> .try_lock(this, mover) <))
        throw(~locked, (((((this['name])[3]).capitalize()) + " is locked to ") + ((this['lock]).lock_name('thing))) + ".");
    return 1;
};

frob method .writers(): nooverride  {
    arg this, @literal;
    
    if (literal)
        return [];
    return [this['manager]];
};


