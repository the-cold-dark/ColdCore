
new object $tutorial: $place;

var $command_cache modules = [];
var $described prose = <$ctext_frob, [["This is the tutorial room. It's not part of any tutorial, and you probably shouldn't be here. Type", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["exit"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "now to get back to ", <$generator, ["servname", [], [], 'gen_servname]>, "."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooks = #[];
var $has_commands local = \
  #[["exit", [["exit", "", "exit", 'exit_cmd, #[]]]], ["n?ext|p?revious|m?ore|b?ack", [["n?ext|p?revious|m?ore|b?ack", "", "n?ext|p?revious|m?ore|b?ack", 'next_cmd, #[]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Tutorial Room", "Tutorial Room"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177642;
var $root defined_settings = #[["next-topic", #[['parse, ['parse_topic_object]]]], ["prev-topic", #[['parse, ['parse_topic_object]]]], ["class", #[['parse, ['parse_tutorial_class]]]], ["start-topic", #[['parse, ['parse_topic_object, 'start_topic]]]], ["back-topic", #[['parse, ['parse_topic_object]]]], ["more-topic", #[['parse, ['parse_topic_object]]]]];
var $root flags = ['variables, 'methods, 'code, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$tutorial];
var $root manager = $tutorial;
var $root quota_exempt = 1;
var $root settings = #[["next-topic", ""], ["prev-topic", ""], ["class", ""], ["start-topic", ""], ["back-topic", ""], ["more-topic", ""], ["map-position", 0], ["propagate", 0]];
var $tutorial tracking = 0;

public method .announce() {
    arg str, @whonot;
    var p, msg;
    
    if ((!sender()) in (.contents()))
        return;
    if ((type(str) == 'frob) && ((class(str) == $message_frob) && (this() in (str.parts())))) {
        p = str.get_part(this());
        str = str.change_entry(this(), "general");
    }
    if ((!(sender() in whonot)) && (sender() in (.contents())))
        (| sender().tell(str, sender()) |);
    switch (type(str)) {
        case 'string:
            (| sender().tell(("[ Everyone else would see: " + str) + " ]") |);
        case 'frob:
            msg = ($parse_lib.filter_ctext(str, #[['formatter, $plain_format]])).to_strings();
            if (((msg.length()) == 2) && ((msg[2]) == `[])) {
                (| sender().tell(("[ Everyone else would see: " + (msg[1])) + " ]") |);
            } else {
                (| sender().tell("[-- Everyone else would see the following: --]") |);
                (| sender().tell(p) |);
                (| sender().tell("[-- End --]") |);
            }
    }
};

root method .core_tutorial() {
    if (tracking)
        tracking = 0;
};

public method .description() {
    arg @ignored;
    var exit, out, lines, more, back;
    
    out = (> pass(@ignored) <);
    lines = [];
    
    // back/more
    if ((exit = .get_setting("back-topic", $tutorial)))
        lines += [$cml_lib.format_obj_tag('look, exit, "Back: " + (exit.name()))];
    if ((exit = .get_setting("more-topic", $tutorial))) {
        if (lines)
            lines += [" || "];
        lines += [$cml_lib.format_obj_tag('look, exit, "More: " + (exit.name()))];
    }
    
    // reset
    if (lines) {
        out += [$ctext_frob.new_with(["<< ", @lines, " >>"])];
        lines = [];
    }
    
    // prev/next
    if ((exit = .get_setting("prev-topic", $tutorial)))
        lines += [$cml_lib.format_obj_tag('look, exit, "Previous: " + (exit.name()))];
    if ((exit = .get_setting("next-topic", $tutorial))) {
        if (lines)
            lines += [" || "];
        lines += [$cml_lib.format_obj_tag('look, exit, "Next: " + (exit.name()))];
    }
    if (lines)
        return out + [$ctext_frob.new_with(["<< ", @lines, " >>"])];
    else
        return out;
};

public method .did_arrive() {
    arg mover, old_place;
    
    pass(mover, old_place);
    (parents()[1]).track_user(sender(), old_place);
};

public method .did_leave() {
    arg mover, new_place;
    
    pass(mover, new_place);
    if (!(new_place.is(parents()[1])))
        (parents()[1]).user_left(sender());
};

public method .exit_cmd() {
    arg cmdstr, cmd, @who;
    var source, n;
    
    source = (| ((parents()[1]).tracking(sender()))[1] |) || ($world.starting_place());
    n = (((parents()[1]).name()).capitalize()) + " Tutorial.";
    sender().tell("You leave the " + n);
    (> sender().move_to(source) <);
    source.announce(((sender().name()) + " returns from the ") + n, sender());
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
    if (objects) {
        formattedobj = map item in (objects) to ($cml_lib.format_obj_tag('look, item, item.name()));
        formattedobj = ["You see ", $cml_lib.generate_english_tag(formattedobj), " here.", br];
        line = $ctext_frob.new_with(formattedobj);
    
        //output += [br, line];
        output = output.append(line);
    }
    return output;
};

public method .minclass() {
    return (.get_setting("class", $tutorial)) || 0;
};

public method .next_cmd() {
    arg cmd, cmdstr, @args;
    var node, what;
    
    switch (cmd[1]) {
        case "n":
            what = "next";
        case "p":
            what = "prev";
        case "m":
            what = "more";
        case "b":
            what = "back";
        default:
            return "It seems this command is a little mis-configured.";
    }
    if (!(node = .get_setting(what + "-topic", $tutorial)))
        return ((("There is no \"" + what) + "\" topic.  Type \"exit\" to leave the ") + (((parents()[1]).name()).capitalize())) + " Tutorial.";
    sender().move_to(node);
};

public method .parse_topic_object() {
    arg value, @args;
    var obj, class;
    
    if (args) {
        // for $tutorial:start-topic
        class = this();
    } else {
        // for $tutorial:(next|prev)-topic
        class = $tutorial;
    }
    if (!value)
        return "";
    obj = $object_lib.to_dbref(value);
    if (!(obj.is(class)))
        throw(~parse, "The topic must be a child of " + class);
    return obj;
};

public method .parse_tutorial_class() {
    arg value, @args;
    var obj;
    
    if (!value)
        return "";
    obj = $object_lib.to_dbref(value);
    if (!(obj.is($user)))
        throw(~perm, "the class must be a user class");
    return obj;
};

public method .track_user() {
    arg user, prev;
    var current;
    
    if (!tracking)
        tracking = #[];
    if (dict_contains(tracking, user))
        current = tracking[user];
    else
        current = [prev, 0];
    tracking = dict_add(tracking, user, replace(current, 2, sender()));
};

public method .tracking() {
    arg user;
    
    return tracking[user];
};

public method .user_left() {
    arg user;
    
    if (dict_contains(tracking || #[], user))
        tracking = dict_del(tracking, user);
};

public method .will_arrive() {
    arg mover, old_place;
    
    pass(mover, old_place);
    if ((!((parents()[1]).is($tutorial))) || ((parents()[1]) == $tutorial))
        throw(~perm, "Something is wrong with that tutorial topic, you cannot go there.");
};


