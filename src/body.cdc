
new object $body: $located_location;

var $body actions = 0;
var $body available_body_parts = 0;
var $body body_parts = #[];
var $body interaction = 0;
var $body last_command = 0;
var $body last_traceback = 0;
var $body remote_command_cache = 0;
var $body wearing = [];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $has_commands local = \
  #[["wh?isper", [["wh?isper", "* to *", "wh?isper <any> to <any>", 'whisper_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["say",\
    [["say", "*", "say <any>", 'say_cmd, #[[1, ['any, []]]]]]],\
  ["to",\
    [["to", "* say *", "to <any> say <any>", 'to_say_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["emote",\
    [["emote", "*", "emote <any>", 'emote_cmd, #[[1, ['any, []]]]]]],\
  ["quote",\
    [["quote", "*", "quote <any>", 'quote_cmd, #[[1, ['any, []]]]]]],\
  ["spoof",\
    [["spoof", "*", "spoof <any>", 'spoof_cmd, #[[1, ['any, []]]]]]],\
  ["think",\
    [["think", "*", "think <any>", 'think_cmd, #[[1, ['any, []]]]]]],\
  ["wear",\
    [["wear", "*", "wear <any>", 'wear_cmd, #[[1, ['any, []]]]]]],\
  ["remove|shed",\
    [["remove|shed", "*", "remove|shed <any>", 'remove_cmd, #[[1, ['any, []]]]]]],\
  ["@act?ion",\
    [["@act?ion", "*", "@act?ion <any>", 'action_cmd, #[[1, ['any, []]]]]]],\
  ["pose",\
    [["pose", "*", "pose <any>", 'pose_cmd, #[[1, ['any, []]]]]]],\
  ["get|take",\
    [["get|take", "*", "get|take <descendant of $thing>", 'get_cmd, #[[1, ['descendant, [$thing]]]]], ["get|take", "* from *", "get|take <any> from <descendant of $location>", 'get_from_cmd, #[[1, ['any, []]], [3, ['descendant, [$location]]]]]]],\
  ["drop",\
    [["drop", "*", "drop <descendant of $thing>", 'drop_cmd, #[[1, ['descendant, [$thing]]]]]]],\
  ["give|put",\
    [["give|put", "* to|in|on *", "give|put <descendant of $thing> to|in|on <descendant of $thing>", 'give_to_cmd, #[[1, ['descendant, [$thing]]], [3, ['descendant, [$thing]]]]]]]];
var $has_commands shortcuts = #[["|*", ['quote_cmd, ["quote ", 1]]], ["\"*", ['say_cmd, ["say ", 1]]], ["%*", ['think_cmd, ["think ", 1]]], ["!*", ['spoof_cmd, ["spoof ", 1]]], [",*,*", ['esay_cmd, ["esay ", 1, " with ", 2]]], [":*", ['emote_cmd, ["emote ", 1]]], [".*", ['pose_cmd, ["pose ", 1]]], ["''*", ['to_say_cmd, ["to ", "", " say ", 1]]], ["'* *", ['to_say_cmd, ["to ", 1, " say ", 2]]]];
var $has_name name = ['uniq, "Generic Body", "the Generic Body"];
var $located location = $void;
var $located obvious = 1;
var $location contents = [];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$body];
var $root manager = $body;
var $thing gender = $gender_neuter;

public method ._tell() {
    arg @args;
    var m;
    
    m = .manager();
    if ((m != this()) && ((m.location()) != (.location())))
        (| m.tell(@args.prefix(("<" + (.name())) + "> ")) |);
};

protected method .add_interaction() {
    arg key, value;
    
    if (!interaction)
        interaction = #[];
    if (type(value) != 'list)
        value = [value];
    value = [time(), value];
    interaction = interaction.add(key, value);
};

public method .available_body_parts() {
    return available_body_parts || ['head, 'rleg, 'lleg, 'rarm, 'larm, 'torso];
};

public method .body_parts() {
    return body_parts;
};

protected method .clear_last_traceback() {
    (| clear_var('last_traceback) |);
};

public method .description() {
    arg flags;
    var ctext, what, w, o;
    
    o = [];
    ctext = (> pass(flags) <);
    if ((w = .wearing()))
        o += [((((.gender()).pronoun('psc)) + " is wearing ") + ((w.mmap('name)).to_english())) + "."];
    
    //   else
    //       o += [.gender().pronoun('psc) + " is naked, baring it all to the world."];
    if (o != [])
        ctext += [$ctext_frob.new_with(o)];
    return ctext;
};

public method .directed_tell() {
    arg what, type;
    
    ._tell(what);
    .send_event('social, sender(), type, what);
};

protected method .drop_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), 'command) <);
    if (!(what in (.contents()))) {
        return ("You don't have " + (what.name())) + ".";
    } else {
        catch any {
            (> what.move_to(.location()) <);
            .tell(("You drop " + (what.name())) + ".");
            (| (.location()).announce((((.name()) + " drops ") + (what.name())) + ".", this(), what) |);
        } with {
            return (traceback()[1])[2];
        }
    }
};

protected method .emote_cmd() {
    arg cmdstr, com, what;
    
    (> .perms(caller(), $user, $body) <);
    if (what && ((what[1]) == ":"))
        (.location()).announce((.name()) + (what.subrange(2)));
    else
        (.location()).announce(((.name()) + " ") + what);
};

public method .environment() {
    return pass() + (wearing || []);
};

protected method .esay_cmd() {
    arg cmdstr, cmd, how, prep, what;
    
    (> .perms(caller(), $user, $body) <);
    (.location()).announce((((((.name()) + " ") + (how.trim())) + ", \"") + (what.trim())) + "\"");
};

public method .event_notify() {
    arg event, origin, @args;
    
    if (caller() != $event_handler)
        throw(~perm, caller() + " is not $event_handler.");
    if (event == 'realm_announce)
        .tell_realm_announce(origin, args[1]);
};

protected method .get_cmd() {
    arg cmdstr, cmd, what;
    var ol, l, isuser;
    
    (> .perms(caller(), 'command) <);
    ol = what.location();
    if (ol == this()) {
        throw(~stop, ("You already have " + (what.name())) + ".");
    } else if (what == this()) {
        throw(~stop, "Ewww, its all twisty.");
    } else {
        l = .location();
        if (l != ol) {
            isuser = ol.is($user);
            if ((| ol.location() |) != l)
                throw(~stop, ("You are not in " + (what.location())) + ".");
        }
        catch any {
            (> what.move_to(this()) <);
        } with {
            if (error() == ~locked) {
                if (isuser)
                    ol.tell((((.name()) + " tried to take ") + (what.name())) + " from you.");
                rethrow(~stop);
            } else {
                rethrow(~stop);
            }
        }
        if (isuser)
            ol.tell((((.name()) + " takes ") + (what.name())) + " from you.");
        l.announce((((.name()) + " takes ") + (what.name())) + ".", this(), ol);
        if (l != ol) {
            if (!isuser)
                l.announce((((.name()) + " takes ") + (what.name())) + ".");
            return ((("You take " + (what.name())) + " from ") + (ol.name())) + ".";
        }
        return ("You take " + (what.name())) + ".";
    }
};

public method .get_cols() {
    arg @args;
    
    return 80;
};

protected method .get_from_cmd() {
    arg cmdstr, cmd, what, p, loc;
    var c, obj, l, wl, str;
    
    (> .perms(caller(), 'command) <);
    if (loc == this())
        return "Huh?  Get what?";
    for c in (loc.contents()) {
        if (c.match_name(what))
            obj = c;
    }
    if (!obj) {
        if (loc.is($place))
            return ("No \"" + what) + "\" in your environment.";
        else
            return ((loc.name()) + " does not have ") + what;
    }
    if ((obj == this()) || (obj == loc))
        return "Ewww, its all twisty.";
    if (loc.is($place))
        return .get_cmd(cmdstr, cmd, obj);
    catch any {
        l = .location();
        (> obj.move_to(this()) <);
        str = (((" " + (obj.name())) + " ") + p) + " ";
        wl = loc.location();
        .tell(((("You " + cmd) + str) + (loc.name())) + ".");
        (| loc.tell((((((.name()) + " ") + cmd) + "s") + str) + "you.") |);
        cmd += "s";
        str = (str + (loc.name())) + " ";
        if (l != wl)
            wl.announce((((.name()) + " ") + cmd) + str, this(), loc);
        l.announce((((.name()) + " ") + cmd) + str, this(), loc);
        return;
    } with {
        switch (error()) {
            case ~locked:
                if (loc.is($user))
                    loc.tell((((((.name()) + " tried to take ") + (obj.name())) + " ") + p) + " you.");
                return (((obj.name()) + " is locked to ") + ((obj.lock()).lock_name('thing))) + ".";
            default:
                return (traceback()[1])[2];
        }
    }
};

public method .get_rows() {
    arg @args;
    
    return 79;
};

protected method .give_to_cmd() {
    arg cmdstr, cmd, what, p, loc;
    var c, obj, l, wl, str;
    
    (> .perms(caller(), 'command) <);
    if (!(what in (.contents())))
        return ("You don't have " + (what.name())) + ".";
    if (what == this())
        return "Give yourself away?  Interesting...";
    if (what == loc)
        return ((("Uhh, you cannot give " + ((what.gender()).pronoun('po))) + " to ") + ((what.gender()).pronoun('pr))) + ".";
    if (loc.is($place))
        return .drop_cmd(cmdstr, cmd, what);
    catch any {
        l = .location();
        wl = loc.location();
        (> what.move_to(loc) <);
        str = (((" " + (what.name())) + " ") + p) + " ";
        .tell(((("You " + cmd) + str) + (loc.name())) + ".");
        (| loc.tell((((((.name()) + " ") + cmd) + "s") + str) + "you.") |);
        cmd += "s";
        str = (str + (loc.name())) + " ";
        if (l != wl)
            wl.announce((((.name()) + " ") + cmd) + str, this(), loc);
        l.announce((((.name()) + " ") + cmd) + str, this(), loc);
    } with {
        .tell_traceback(traceback());
        return (traceback()[1])[2];
    }
};

protected method .handle_parser_result() {
    arg line, action, @more;
    var r, c;
    
    switch (action) {
        case 'error:
            ._tell(more[1]);
        case 'match, 'command:
            r = (> (more[1]).(more[2])(@more.subrange(3)) <);
            if (type(r) in ['list, 'frob, 'string])
                .ptell(r, #[['type, 'parser], ['command, more[2]]]);
        case 'failed:
            for c in (($place_lib.coordinate_shortcuts()).keys()) {
                if (line.match_template(c)) {
                    .tell(("There is no exit " + line) + " here.");
                    r = 1;
                }
            }
            if (!r)
                .tell(("I don't understand " + (line.chop((.linelen()) - 22))) + ".");
        case 'ok:
            // do nothing, probably a null command
        default:
            ._tell("Unusual response from the parser: " + more);
    }
};

public method .last_traceback() {
    return last_traceback;
};

public method .linelen() {
    return 79;
};

public method .match_env_nice() {
    arg name, @syntax;
    var obj, args, line;
    
    catch any {
        return (> .match_environment(name) <);
    } with {
        if (syntax)
            (> .tell_error(syntax[1], (traceback()[1])[2]) <);
        else
            throw(~stop, (traceback()[1])[2]);
    }
};

public method .namef() {
    arg type;
    var str;
    
    switch (type) {
        case 'doing, 'nactivity, 'activity, 'titled:
            return .name();
        default:
            return (> pass(type) <);
    }
};

protected method .parse_interaction_reference() {
    arg targets, what, @userdb;
    var recip, target, msg, out;
    
    [(userdb ?= 0)] = userdb;
    targets = (targets && (targets.explode_list())) || [];
    if (!targets) {
        if (!(targets = (| interaction['objs] |)))
            throw(~stop, ("You must direct your " + what) + " to a target.");
        out = targets[2];
    } else {
        out = [];
        for recip in (targets) {
            target = 0;
            if (userdb)
                target = (| $user_db.match_begin(recip) |);
            if (!target) {
                catch ~objnf, ~namenf, ~invdbref, ~context, ~ambig
                    target = (> .match_environment(recip) <);
                with
                    throw(~stop, (traceback()[1])[2]);
            }
            if (!(target.is($body)))
                throw(~stop, (target.namef('ref)) + " is not a valid recipient.");
            out = setadd(out, target);
        }
    }
    return filter target in (out) where (valid(target));
};

public method .pose_cmd() {
    arg cmdstr, cmd, args;
    var shortwords, preword_punct_chars, postword_punct_chars, preword_punct_expr, postword_punct_expr, pronouns, ant_pronouns, selfmsg, othersmsg, recips, antecedent, prepunct, postpunct, word, oword, things, who, aliases, msg, cap, name, wname, m, w, quoted, msgdict, posessive, name_expr;
    
    (> .perms(caller(), $user, $body) <);
    args = explode("." + (args.trim()));
    if (args == ["."]) {
        (.location()).announce(.name());
        return;
    }
    
    // ------------
    shortwords = ["a", "an", "the", "to", "for", "out", "of", "on", "at", "and"];
    preword_punct_chars = "[\"'`([{]";
    postword_punct_chars = "[]})\"',.!?:;]";
    
    // ------------
    preword_punct_expr = ("^" + preword_punct_chars) + "+";
    postword_punct_expr = postword_punct_chars + "+$";
    pronouns = (.gender()).pronouns();
    ant_pronouns = $gender_neuter.pronouns();
    selfmsg = (othersmsg = (recips = (antecedent = [])));
    quoted = 0;
    for word in (args) {
        if ((m = match_regexp(word, preword_punct_expr))) {
            prepunct = substr(word, @m[1]);
            word = substr(word, ((m[1])[2]) + 1);
        } else {
            prepunct = "";
        }
        if ((m = match_regexp(word, postword_punct_expr))) {
            postpunct = substr(word, @m[1]);
            word = substr(word, 1, ((m[1])[1]) - 1);
        } else {
            postpunct = "";
        }
        oword = word;
        quoted = (quoted + (((prepunct + word).sed("[^\"]+", "", "g")).length())) % 2;
        if ((!quoted) && ((word.length()) > 0)) {
            if ((word[1]) == "\\") {
                oword = (word = word.subrange(2));
            } else if (word in shortwords) {
                // don't match against common short words.
            } else if (word in ["me", "myself"]) {
                word = "yourself";
                oword = pronouns['pr];
            } else if (word == "I") {
                word = "you";
                oword = pronouns['ps];
            } else if (word == "my") {
                word = "your";
                oword = pronouns['pp];
            } else if (word == "mine") {
                word = "yours";
                oword = pronouns['pq];
            } else if (word in [ant_pronouns['ps], "%s"]) {
                word = ant_pronouns['ps];
                oword = antecedent ? [antecedent, word, "you"] : word;
            } else if (word in [ant_pronouns['po], "%o"]) {
                word = ant_pronouns['po];
                oword = antecedent ? [antecedent, word, "you"] : word;
            } else if (word in [ant_pronouns['pp], "%p"]) {
                word = ant_pronouns['pp];
                oword = antecedent ? [antecedent, word, "your"] : word;
            } else if (word in [ant_pronouns['pr], "%r"]) {
                word = ant_pronouns['pr];
                oword = antecedent ? [antecedent, word, ((antecedent.length()) > 1) ? "yourselves" : "yourself"] : word;
            } else if (word in [ant_pronouns['pq], "%q"]) {
                word = ant_pronouns['pq];
                oword = antecedent ? [antecedent, word, "yours"] : word;
            } else if ((word[1]) == ".") {
                // verb to conjugate
                word = substr(word, 2);
                if (match_regexp(word, "(ch|sh|s)$"))
                    oword = word + "es";
                else if (match_regexp(word, "[^a]y$"))
                    oword = substr(word, 1, strlen(word) - 1) + "ies";
                else
                    oword = word + "s";
            } else if ((word[1]) == ":") {
                // a verb for antecedent, to conjugate
                word = substr(word, 2);
                if (match_regexp(word, "es$"))
                    oword = substr(word, 1, strlen(word) - 2);
                else if (match_regexp(word, "ies$"))
                    oword = substr(word, 1, strlen(word) - 3) + "y";
                else if (match_regexp(word, "s$"))
                    oword = substr(word, 1, strlen(word) - 1);
                if ((antecedent.length()) < 2)
                    oword = [antecedent, word, oword];
                else
                    word = oword;
            } else {
                if ((| substr(word, (word.length()) - 1, 2) |) == "'s") {
                    posessive = "'s";
                    word = (oword = substr(word, 1, (word.length()) - 2));
                } else {
                    posessive = "";
                }
                if (((word[word.length()]) == "*") || (word in ["everyone", "everything"])) {
                    // look for matching things..
                    if (word in ["everyone", "everything"]) {
                        things = word == "everything";
                        word = "";
                    } else if (((word.length()) > 1) && ((word[(word.length()) - 1]) == "*")) {
                        // match things too.
                        word = substr(word, 1, (word.length()) - 2);
                        things = 1;
                    } else {
                        // just match people.
                        things = 0;
                        word = substr(word, 1, (word.length()) - 1);
                    }
                    catch ~ambig, ~objnf {
                        who = [.match_environment(word)];
                    } with {
                        if ((error() == ~objnf) && word) {
                            who = [];
                        } else {
                            catch ~ambig, ~objnf {
                                who = [(.environment()).match_object(word)];
                            } with {
                                if (error() == ~ambig)
                                    who = (traceback()[1])[3];
                                else
                                    throw(~stop, ("Object '" + word) + "' not found.");
                            }
                        }
                    }
                    who = setremove(who, this());
                    if (!things)
                        who = filter w in (who) where (w.is($body));
                    else
                        who = filter w in (who) where (w.is($thing));
                    if (who) {
                        word = map w in (who) to ((w.name()) + posessive).to_english();
                        recips = union(recips, who);
                    } else {
                        word = (things ? "nothing" : "nobody") + posessive;
                    }
                    oword = word;
                    posessive = "";
                    antecedent = who;
                    ant_pronouns = ((antecedent.length()) == 1) ? (((antecedent[1]).gender()).pronouns()) : ($gender_plural.pronouns());
                } else if ((| (who = .match_environment((w = word))) |) && (who.is($body))) {
                    // Might be a valid match for a username..
                    if ((wname = who.name()) == w) {
                        // full name match.  Make sure it's capitalized right.
                        word = (oword = wname);
                        recips = setadd(recips, who);
                        antecedent = [who];
                        ant_pronouns = (who.gender()).pronouns();
                    } else {
                        aliases = who.name_templates();
                        aliases = map w in (aliases) to (explode(w, "|")).flatten();
                        aliases = map w in (aliases) to (strsub(w, "?", ""));
                        if (word in aliases) {
                            word = (oword = wname);
                            recips = setadd(recips, who);
                            antecedent = [who];
                            ant_pronouns = (who.gender()).pronouns();
                        }
                    }
                }
                word += posessive;
                oword += posessive;
            }
        }
        quoted = (quoted + ((postpunct.sed("[^\"]+", "", "g")).length())) % 2;
        selfmsg += [(prepunct + word) + postpunct];
        if (type(oword) == 'string)
            othersmsg += [(prepunct + oword) + postpunct];
        else
            othersmsg += [[oword[1], (prepunct + (oword[2])) + postpunct, (prepunct + (oword[3])) + postpunct]];
        refresh();
    }
    msg = "";
    cap = 0;
    for word in (selfmsg) {
        word = cap ? ("  " + (word.capitalize())) : (" " + word);
        msg += word;
        cap = match_regexp(word, "[.!?:][^A-Za-z0-9_]*$");
        refresh();
    }
    msgdict = #[[this(), (<$ctext_frob, [[("You" + msg) + (cap ? "" : ".")], #[]]>)]];
    name = .name();
    for w in (recips + [0]) {
        wname = w ? (w.name()) : 0;
        cap = 0;
        msg = "";
        name_expr = ((((("( |^)" + preword_punct_chars) + "*(") + ((w.name()).regexp_escape())) + ")('s)?") + postword_punct_chars) + "*( |$)";
        for word in (othersmsg) {
            switch (type(word)) {
                case 'string:
                    if (w && (wname != "you")) {
                        while ((m = word.match_regexp(name_expr))) {
                            if ((m[4])[1])
                                word = ((word.subrange(1, ((m[3])[1]) - 1)) + "your") + (word.subrange(((m[4])[1]) + ((m[4])[2])));
                            else
                                word = ((word.subrange(1, ((m[3])[1]) - 1)) + "you") + (word.subrange(((m[3])[1]) + ((m[3])[2])));
                        }
                    }
                    word = cap ? ("  " + (word.capitalize())) : (" " + word);
                case 'list:
                    if (w in (word[1]))
                        word = cap ? ("  " + ((word[3]).capitalize())) : (" " + (word[3]));
                    else
                        word = cap ? ("  " + ((word[2]).capitalize())) : (" " + (word[2]));
            }
            msg += word;
            cap = match_regexp(word, "[.!?:][^A-Za-z0-9_]*$");
            refresh();
        }
        msg = (name + msg) + (cap ? "" : ".");
        msgdict = msgdict.add(w || "general", (<$ctext_frob, [[msg], #[]]>));
    }
    (.location()).announce((<$message_frob, msgdict>));
};

public method .ptell() {
    arg what, flags;
    
    .tell(what);
};

protected method .quote_cmd() {
    arg cmdstr, cmd, what;
    
    (.location()).announce(((.name()) + " | ") + what);
};

protected method .remove_cmd() {
    arg cmd, cmdstr, what;
    
    (> .perms(caller(), $user, $body) <);
    what = (> .match_env_nice(what) <);
    if (!(what.is($wearable_frob)))
        return ("You are not wearing " + (what.name())) + ".";
    catch any
        what = (> what.shed() <);
    with
        return (traceback()[1])[2];
    return "You remove " + (what.name());
};

protected method .say_cmd() {
    arg cmdstr, cmd, what;
    var type, how, idx;
    
    (> .perms(caller(), 'command) <);
    if (what)
        how = $code_lib.punctuation_type(what);
    else
        how = "say";
    (.location()).announce((((((.name()) + " ") + how) + "s, \"") + what) + "\"");
};

public method .set_body_part() {
    arg part, frob, param;
    
    if (sender().has_ancestor($wearable_frob))
        throw(~perm, "Sender must be $wearable_frob.");
    body_parts = body_parts.add(frob.new_with(part, param));
};

public method .set_last_command() {
    arg cmd;
    
    // HACKNOTE: Remove
    if (caller() != $user)
        return;
    last_command = cmd;
};

public method .set_last_traceback() {
    arg tb;
    
    if (caller() != $parse_lib)
        throw(~sorry, "nope.");
    last_traceback = tb;
};

public method .shed() {
    arg what;
    
    if (caller() != $wearable_frob)
        throw(~wear, "You can only wear descendants of $wearable_frob.");
    wearing = setremove(wearing, what);
};

protected method .spoof_cmd() {
    arg cmdstr, cmd, what;
    var name;
    
    (> .perms(caller(), $user, $body) <);
    name = .name();
    if (!(((name + " ") in what) || ((" " + name) in what)))
        what = (what + "     -- ") + name;
    (.location()).announce(what);
};

public method .tell() {
    arg @args;
    
};

public method .tell_error() {
    arg syntax, @problem;
    var problem, line, sprefix, prefix, length;
    
    // arg 1 == syntax
    // arg 2 == problem lines
    length = .linelen();
    if (syntax)
        .tell(("=> Syntax: `" + syntax) + "`");
    if (problem) {
        for line in (problem) {
            if (type(line) == 'string)
                line = line.wrap_lines(length, "!  ", 1);
            .tell(line);
        }
    }
    throw(~stop, "");
};

public method .tell_realm_announce() {
    arg last_realm, message;
    var loc, realm, propagator, prop_list, len, i;
    
    pause();
    loc = .location();
    if (!(propagator = loc.will_propagate()))
        return;
    prop_list = [propagator];
    realm = (.location()).realm();
    if (type(message) == 'symbol)
        message = realm.eval_message(tostr(message), $realm, realm.ctext_variables());
    while (realm != $realm) {
        if (realm == last_realm) {
            len = prop_list.length();
            for i in [1 .. len] {
                message = message.propagate(prop_list[(len - i) + 1]);
                if (!message)
                    return;
            }
            .tell(message);
            return;
        }
        if (!(propagator = realm.will_propagate()))
            return;
        prop_list += [propagator];
        realm = (realm.parents())[1];
    }
};

public method .tell_traceback() {
    arg traceback, @parse;
    
    if (parse && (| ((parse[2]).find_method(parse[3])).has_flag('core) |))
        $sys.log_traceback(traceback, last_command);
    if (.has_ancestor($sys.get_setting("traceback-for", $sys))) {
        .tell(traceback.fmt_tb());
        .tell(["!", "! You may want to use @report to report this problem."]);
    } else {
        .tell("OOPS! An error has occurred, contact an administrator for help.");
    }
};

protected method .think_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms(caller(), $user, $body) <);
    (.location()).announce((((.name()) + " . o O ( ") + what) + " )");
};

protected method .to_say_cmd() {
    arg cmdstr, com, who, prep, message;
    var targets, target, line, invobj, here;
    
    (> .perms(caller(), $user, $body) <);
    catch ~ambig
        targets = (> .parse_interaction_reference(who, "say") <);
    with
        return (traceback()[1])[2];
    here = .location();
    if ((invobj = filter target in (targets) where ((target.location()) != here)))
        return .tell(((invobj.to_english()) + (((invobj.length()) > 1) ? " are " : " is ")) + "not here in this location.");
    .add_interaction('objs, targets);
    line = (((.name()) + " (to ") + ((targets.mmap('name)).to_english())) + ") ";
    if (message)
        line += ((message[1]) == ":") ? (message.subrange(2)) : (((($code_lib.punctuation_type(message)) + "s, \"") + message) + "\"");
    else
        line += "says, \"\"";
    for target in (targets)
        target.directed_tell(line, 'tosay);
    (.location()).announce(line, @targets);
};

public method .wear() {
    arg what;
    
    if (caller() != $wearable_frob)
        throw(~wear, "You can only wear descendants of $wearable_frob.");
    wearing = setadd(wearing || [], what);
};

protected method .wear_cmd() {
    arg cmd, cmdstr, what;
    
    (> .perms(caller(), $user, $body) <);
    what = (> .match_env_nice(what) <);
    if (!(what.is($wearable_frob)))
        return ("You cannot wear " + (what.name())) + ".";
    what = (> what.wear() <);
    return "You wear " + (what.name());
};

public method .wearing() {
    arg @args;
    var x, w;
    
    w = wearing || [];
    if (args && ('objects in args)) {
        for x in [1 .. w.length()]
            w = w.replace(x, class(w[x]));
    }
    return w;
};

protected method .whisper_cmd() {
    arg cmdstr, com, what, prep, who;
    var loc, targets, t, msg, recips;
    
    (> .perms(caller(), $user, $body) <);
    targets = (> .parse_interaction_reference(who, "whisper") <);
    .add_interaction('objs, targets);
    loc = .location();
    if (((targets.mmap('location)).compress()) != [loc]) {
        who = filter t in (targets) where ((t.location()) != loc);
        return ("You must be in the same place as " + (who.english_name_list())) + ", to whisper to them.";
    }
    msg = (((.name()) + " whispers, \"") + what) + "\"";
    for t in (targets)
        (| t.directed_tell(msg, 'whisper) |);
    recips = (targets.mmap('name)).to_english();
    loc.announce((((.name()) + " whispers to ") + recips) + ".", this(), @targets);
    .tell(((("You whisper, \"" + what) + "\" to ") + recips) + ".");
};

public method .will_move() {
    arg mover, place;
    
    // exits should always be able to pull "bodies" through them
    // this becomes sortof a big override returning, but ... *shrug*
    if (mover.is($path))
        return;
    (> pass(mover, place) <);
};


