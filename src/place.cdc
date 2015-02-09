
new object $place: $location, $realm_settings;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $foundation defined_msgs = #[["housekeeper", #[['branches, ["general"]]]], ["connect", #[['branches, ["general"]]]], ["disconnect", #[['branches, ["general"]]]]];
var $foundation msgs = #[["housekeeper", #[["general", <$ctext_frob, [["The housekeeper arrives and takes ", <$generator, ["actor", [], [], 'gen_actor]>, "'s body away."], #[]]>]]], ["connect", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " wakes up."], #[['this, $place]]]>]]], ["disconnect", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " falls asleep."], #[['this, $place]]]>]]]];
var $has_commands local = \
  #[["fribble", [["fribble", "*", "fribble <any>", 'fribble_cmd, #[[1, ['any, []]]]]]]];
var $has_name name = ['uniq, "place", "the place"];
var $location contents = [];
var $place darkness = 0;
var $place entrances = 0;
var $place exits = [];
var $place realm = $realm_of_creation;
var $place restrict_entry = 0;
var $root created_on = 796268969;
var $root defined_settings = #[["public-home", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["realm", #[['get, ['realm]], ['set, ['set_setting_realm]], ['parse, ['parse_realm_setting]], ['clear, ['clear_realm_setting]]]], ["darkness", #[['get, ['darkness]], ['set, ['set_darkness]], ['parse, ['is_type, 'integer]]]], ["restrict-entry", #[['get, ['get_restrict_entry]], ['set, ['set_restrict_entry]], ['parse, ['parse_restrict_entry]], ['format, ['format_restrict_entry]]]]];
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$place];
var $root manager = $place;
var $root settings = #[["public-home", 0], ["map-position", 0], ["propagate", 0]];

public method .add_as_entrance() {
    arg path;
    
    entrances = setadd(entrances, path);
};

public method .attach_exit() {
    arg type, exit;
    
    if (!(caller().is($path)))
        throw(~perm, "Caller is not an exit.");
    if (type == 'source) {
        (| (.realm()).add_exit_to(exit.dest()) |);
        exits = setadd(exits, exit);
    } else {
        entrances = setadd(entrances, exit);
    }
};

public method .clear_entrances() {
    entrances = [];
};

public method .clear_realm_setting() {
    arg name;
    
    (> .perms(sender()) <);
    realm = $realm_of_creation;
};

root method .core_place(): nooverride  {
    .set_realm($realm_of_creation);
};

public method .darkness() {
    arg @args;
    
    return darkness;
};

public method .description() {
    arg f;
    var e;
    
    e = .visible_exits();
    return ((> pass(f) <) + [.format_contents(f)]) + (.format_exits(e, f));
};

public method .detach_exit() {
    arg type, exit;
    
    if (!(caller().is($path)))
        throw(~perm, "Caller is not an exit.");
    if (type == 'source)
        exits = setremove(exits, exit);
    else
        entrances = setremove(entrances, exit);
};

public method .did_arrive() {
    arg mover, place;
    
    pass(mover, place);
    .cache_client_init();
};

public method .did_connect() {
    (> .perms(caller(), $user) <);
    if ((.visibility()) >= 0)
        .announce(.eval_message("connect", $place, #[["$actor", sender()], ["actor", sender().name()], ["$here", this()], ["here", .name()]]), sender());
};

public method .did_disconnect() {
    (> .perms(caller(), $user) <);
    if ((.visibility()) >= 0)
        .announce(.eval_message("disconnect", $place, #[["$actor", sender()], ["actor", sender().name()], ["$here", this()], ["here", .name()]]), sender());
};

public method .did_housekeep() {
    arg who;
    var m, v;
    
    (> .perms(sender(), $housekeeper) <);
    .announce(.eval_message("housekeeper", $place, #[["$actor", who], ["actor", who.name()], ["$here", this()], ["here", .name()]]));
};

public method .entrances() {
    (| .perms(caller(), definer(), $command_parser) |) || (> .perms(sender()) <);
    return entrances;
};

public method .environment() {
    return pass() + exits;
};

public method .exits() {
    if (!(caller() in [$command_parser, $user]))
        (> .perms(sender()) <);
    return exits;
};

public method .format_contents() {
    arg flags;
    var users, br, exclude, actor, objects, output, obj, line, item, formatteduser, formattedobj;
    
    // called by .description
    users = [];
    objects = [];
    actor = flags['actor];
    exclude = (| flags['exclude] |) || [];
    for obj in (.contents()) {
        if ((!(obj in exclude)) && ((obj != actor) && (| obj.is_obvious_to(actor) |))) {
            if (obj.has_ancestor($body))
                users += [obj];
            else
                objects += [obj];
        }
    }
    output = $ctext_frob.new_with([]);
    br = $cml_lib.format_br_tag();
    if (users) {
        formatteduser = map item in (users) to ($cml_lib.format_obj_tag('look, item, item.namef('nactivity)));
        formatteduser = [$cml_lib.generate_english_tag(formatteduser), ((users.length()) > 1) ? " are here." : " is here.", br];
        line = $ctext_frob.new_with(formatteduser);
    
        //output += [br, line];
        output = output.append(line);
    }
    if (objects) {
        formattedobj = map item in (objects) to ($cml_lib.format_obj_tag('look, item, item.name()));
        formattedobj = ["You see ", $cml_lib.generate_english_tag(formattedobj), " here.", br];
        line = $ctext_frob.new_with(formattedobj);
    
        //output += [br, line];
        output = output.append(line);
    }
    return output;
};

public method .format_exits() {
    arg exits, flags;
    var output, e, exits, line, actor, how, exit;
    
    actor = flags['actor];
    how = (flags['actor]).get_setting("exit-style", $user);
    switch (how) {
        case 'none:
            return [];
        case 'brief:
            if (!exits)
                return [];
            return [$ctext_frob.new_with(["Visible Exits: ", $cml_lib.generate_english_tag(map exit in (exits) to ($cml_lib.format_obj_tag('look, exit, exit.path_name(this()), 'exit))), $cml_lib.format_br_tag()])];
        case 'templates:
            output = [];
            for e in (exits) {
                if (e.name_templates())
                    output += [$cml_lib.format_obj_tag('look, e, (((e.path_name(this())) + " (") + ((e.name_templates()).to_english())) + ")", 'exit)];
                else
                    output += [$cml_lib.format_obj_tag('look, e, e.path_name(this()), 'exit)];
            }
            return output ? [$ctext_frob.new_with(["Visible Exits: ", $cml_lib.generate_english_tag(output), $cml_lib.format_br_tag()])] : [];
        case 'long:
            output = [];
            for e in (exits)
                output += [(("  " + (e.path_name(this()))) + " to ") + ((e.dest(this())).name())];
            return output ? (["Visible Exits: "] + (output.lcolumnize(actor.linelen()))) : [];
        case 'verbose:
            output = [];
            for e in (exits) {
                if (e.name_templates())
                    line = (((e.path_name(this())) + " (") + ((e.name_templates()).to_english("no templates"))) + ")";
                else
                    line = e.path_name(this());
                output += [(("  " + line) + " to ") + ((e.dest(this())).name())];
            }
            return output ? ["Visible Exits: ", @output.lcolumnize(actor.linelen())] : [];
    }
    return [];
};

root method .format_restrict_entry() {
    arg value;
    var unparse;
    
    unparse = value.unparse();
    if (unparse == "yes")
        return "none";
    else if (unparse == "no")
        return "by-entrances";
    return unparse;
};

public method .get_restrict_entry() {
    arg name, definer;
    
    return restrict_entry || (<$true_lock_frob, []>);
};

root method .init_place() {
    exits = (entrances = []);
    .set_realm($realm_of_creation);
};

public method .is_connected_to() {
    arg dest;
    var i;
    
    (> .perms(caller(), $realm) <);
    for i in (exits) {
        if ((| dest == (i.dest()) |))
            return 1;
    }
    return 0;
};

public method .old_format_content() {
    arg flags;
    var users, br, exclude, actor, objects, output, obj, line;
    
    // called by .description
    users = [];
    objects = [];
    actor = flags['actor];
    exclude = (| flags['exclude] |) || [];
    for obj in (.contents()) {
        if ((!(obj in exclude)) && ((obj != actor) && (| obj.is_obvious_to(actor) |))) {
            if (obj.has_ancestor($body))
                users += [obj.namef('nactivity)];
            else
                objects += [obj.name()];
        }
    }
    output = [];
    br = (<$format, ["br", [], [], 'do_br]>);
    if (users) {
        line = ($list.to_english(users)) + " ";
        line = (line + (((users.length()) > 1) ? "are" : "is")) + " here.";
    
        //output += [br, line];
        output += [line];
    }
    if (objects) {
        line = "You see ";
        line = (line + ($list.to_english(objects))) + " here.";
    
        //output += [br, line];
        output += [line];
    }
    return output;
};

public method .old_format_exits() {
    arg exits, flags;
    var output, e, exits, line, actor, how, exit;
    
    actor = flags['actor];
    how = (flags['actor]).get_setting("exit-style", $user);
    switch (how) {
        case 'none:
            return [];
        case 'brief:
            if (!exits)
                return [];
            return [$ctext_frob.new_with(["Visible Exits: ", $cml_lib.generate_english_tag(map exit in (exits) to ($cml_lib.format_obj_tag('look, exit, exit.name(), 'exit)))])];
        case 'templates:
            output = [];
            for e in (exits) {
                if (e.name_templates())
                    output += [$cml_lib.format_obj_tag('look, e, (((e.name()) + " (") + ((e.name_templates()).to_english())) + ")", 'exit)];
                else
                    output += [$cml_lib.format_obj_tag('look, e, e.name(), 'exit)];
            }
            return output ? [$ctext_frob.new_with(["Visible Exits: ", $cml_lib.generate_english_tag(output)])] : [];
        case 'long:
            output = [];
            for e in (exits)
                output += [(("  " + (e.name())) + " to ") + ((e.dest()).name())];
            return output ? (["Visible Exits: "] + (output.lcolumnize(actor.linelen()))) : [];
        case 'verbose:
            output = [];
            for e in (exits) {
                if (e.name_templates())
                    line = (((e.name()) + " (") + ((e.name_templates()).to_english("no templates"))) + ")";
                else
                    line = e.name();
                output += [(("  " + line) + " to ") + ((e.dest()).name())];
            }
            return output ? ["Visible Exits: ", @output.lcolumnize(actor.linelen())] : [];
    }
    return [];
};

public method .parse_realm_setting() {
    arg value, @args;
    var realm;
    
    realm = $place_lib.match_realm(value);
    if (!realm)
        throw(~invrealm, ("Unable to find the realm " + value) + ".");
    else if (!(realm.is($realm)))
        throw(~invrealm, (realm.namef('ref)) + " is not a realm.");
    return realm;
};

public method .parse_restrict_entry() {
    arg value;
    
    if (!value)
        throw(~invalid, "Restrict with 'by-entrances', 'none' or a lock frob");
    if (value == "by-entrances")
        value = "no";
    else if (value == "none")
        value = "yes";
    return (> $lock_frob.parse(value, user() || this()) <);
};

public method .place_destroyed() {
    arg place;
    var e;
    
    (> .perms(caller(), $place, $realm) <);
    for e in (exits) {
        if ((e.dest()) == sender())
            e.destination_destroyed();
    }
};

public method .prose() {
    arg @no_default;
    var ret;
    
    ret = pass(@no_default);
    if (type(ret) == 'frob)
        (| (ret = ret.set_vars((.realm()).ctext_variables())) |);
    return ret;
};

public method .realm() {
    arg @args;
    
    return realm;
};

public method .realm_name() {
    arg @ctype;
    
    [(ctype ?= "text/plain")] = ctype;
    switch (ctype) {
        case "text/html":
            return (((.hname()) + " (") + ((| (realm.realm_name()).to_html() |) || "&lt;unknown&gt;")) + ")";
        default:
            return (((.name()) + " (") + ((| realm.realm_name() |) || "<unknown>")) + ")";
    }
};

public method .set_darkness() {
    arg name, definer, value, @args;
    
    (> .perms(sender()) <);
    darkness = value;
};

public method .set_name() {
    arg new_name, @args;
    var old_name;
    
    old_name = .name();
    (> pass(new_name, @args) <);
    (| $place_db.room_changed_name(old_name) |);
};

public method .set_objname(): nooverride  {
    arg new_objname;
    
    if ((caller() != $place) && (!(sender() in ($sys.system()))))
        throw(~perm, "Place objname can only be changed by $place.");
    (> pass(new_objname) <);
};

public method .set_realm() {
    arg value;
    
    (caller() == $realm) || ((sender() == this()) || (> .perms(sender()) <));
    realm = value.new();
};

protected method .set_restrict_entry() {
    arg name, definer, value;
    
    if (class(value) == $true_lock_frob)
        (| clear_var('restrict_entry) |);
    else
        restrict_entry = value;
};

public method .set_setting_realm() {
    arg name, definer, value, @args;
    
    (> .perms(sender()) <);
    .set_realm(value);
};

root method .uninit_place() {
    var x;
    
    for x in (exits + entrances)
        (| x.place_destroyed(this()) |);
    (| realm.place_destroyed(this()) |);
    (| $place_db.place_destroyed(this()) |);
};

public method .update_exit_frob() {
    arg this, what, new, @remove;
    var i;
    
    (> .perms(caller(), $exit_frob) <);
    i = (<sender(), this>) in exits;
    if (remove)
        this = this.del(what);
    else
        this = this.add(what, new);
    exits = exits.replace(i, (<sender(), this>));
    return (<sender(), this>);
};

public method .visible_exits() {
    var obv, exit;
    
    obv = [];
    for exit in (exits) {
        if ((exit.visibility()) >= (.visibility()))
            obv += [exit];
    }
    return obv;
};

public method .visible_exits_formatted() {
    arg actor, how;
    var output, ex, exits, line;
    
    exits = .visible_exits();
    switch (how) {
        case 'none:
            return [];
        case 'brief:
            if (!exits)
                return [];
            return ["Exits: " + ($list.to_english($list.mmap(exits, 'name), "none"))];
        case 'average:
            output = [];
            for ex in (exits) {
                line = (ex.name()) + " (";
                line += $list.to_english(ex.name_templates(), "no, templates");
                output += [line];
            }
            return output ? ["Exits: " + ($list.to_english(output))] : [];
        case 'long:
            output = [];
            for ex in (exits)
                output += [((("  " + (ex.name())) + " (to ") + ((ex.dest()).name())) + ")"];
            return output ? ["Exits: ", @$list.lcolumnize(output, actor.linelen())] : [];
        case 'verbose:
            output = [];
            for ex in (exits) {
                line = ex.prose();
                if (!line)
                    line = [ex.name()];
                output += [line[1]];
            }
            return output ? [output.join()] : [];
    }
};

public method .will_arrive() {
    arg mover, old_place;
    
    (> pass(mover, old_place) <);
    if (restrict_entry && ((!(mover.is($path))) && ((mover != $housekeeper) && ((!(.trusts(mover))) && ((| (mover.location()) != this() |) && (!(restrict_entry.try(mover))))))))
        throw(~locked, ((((.name()).capitalize()) + " is locked to ") + (restrict_entry.lock_name('place))) + ".");
};

public method .will_attach() {
    arg type, @by_whom;
    
    [(by_whom ?= sender())] = by_whom;
    if ((.realm()).is_buildable_by(by_whom))
        return 1;
    if ((| .trusts(by_whom) |))
        return 1;
    if (.get_setting("public-home", $place))
        return 1;
    throw(~perm, "Place is not publicly extendable.");
};


