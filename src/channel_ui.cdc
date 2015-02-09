
new object $channel_ui: $user_interfaces;

var $channel_ui active_channels = #[];
var $channel_ui channel_creation = 1;
var $channel_ui channel_dict = #[];
var $channel_ui credits = ["Chuck and Brad"];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $has_commands local = \
  #[["@desc-c?hannel", [["@desc-c?hannel", "* as *", "@desc-c?hannel <any> as <any>", 'describe_channel_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["@join-lock-channel|@jlc",\
    [["@join-lock-channel|@jlc", "* with|to *", "@join-lock-channel|@jlc <any> with|to <any>", 'channel_add_lock_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["@leave-lock-channel|@llc",\
    [["@leave-lock-channel|@llc", "* with|to *", "@leave-lock-channel|@llc <any> with|to <any>", 'channel_add_lock_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["@use-lock-channel|@ulc",\
    [["@use-lock-channel|@ulc", "* with|to *", "@use-lock-channel|@ulc <any> with|to <any>", 'channel_add_lock_cmd, #[[1, ['any, []]], [3, ['any, []]]]]]],\
  ["@add-channel-manager|@acm",\
    [["@add-channel-manager|@acm", "* to *", "@add-channel-manager|@acm <user> to <any>", 'channel_add_manager, #[[1, ['user, []]], [3, ['any, []]]]]]],\
  ["@del-channel-manager|@dcm",\
    [["@del-channel-manager|@dcm", "* from *", "@del-channel-manager|@dcm <user> from <any>", 'channel_del_manager, #[[1, ['user, []]], [3, ['any, []]]]]]],\
  ["@add-ch?annel|@addcom",\
    [["@add-ch?annel|@addcom", "*", "@add-ch?annel|@addcom <any>", 'addcom_cmd, #[[1, ['any, []]]]]]],\
  ["@del-ch?annel|@delcom",\
    [["@del-ch?annel|@delcom", "*", "@del-ch?annel|@delcom <any>", 'delcom_cmd, #[[1, ['any, []]]]]]],\
  ["@purge-channel",\
    [["@purge-channel", "*", "@purge-channel <any>", 'channel_purge_cmd, #[[1, ['any, []]]]]]],\
  ["@ch?annels",\
    [["@ch?annels", "*", "@ch?annels <any:+f?ull +d?etailed>", 'channels_cmd, #[[1, ['any_opt, ["f?ull", "d?etailed"]]]]]]],\
  ["@channel-paste",\
    [["@channel-paste", "* to", "@channel-paste <any> to", 'channel_page_cmd, #[[1, ['any, []]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 838251646;
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$channel_ui];
var $root manager = $channel_ui;
var $root trusted_by = [$channel_db];

public method ._broadcast() {
    arg channel, message;
    var q;
    
    if (!(caller() in [$channel_ui, $user, $sys, $guest]))
        throw(~perm, "You are not allowed to call $channel_ui._broadcast() directly");
    for q in ($user_db.connected())
        q.channel_msg(channel, message);
};

private method ._del_active_channel() {
    arg key;
    
    active_channels = active_channels.del(key);
};

public method ._del_channel_dict() {
    arg key;
    
    channel_dict = channel_dict.del(key);
};

public method .active_channels() {
    return active_channels;
};

protected method .addcom_cmd() {
    arg cmdstr, cmd, args;
    var elements, db, channel, lowerchannel, msg;
    
    (> .perms(caller(), 'command) <);
    elements = args.explode("=");
    if ((elements.length()) != 2) {
        return "Syntax: @addcom <alias>=<channel_name>";
    } else if (channel_dict.contains(elements[1])) {
        return "You are already using that alias for a channel.";
    } else {
        catch any
            channel = tosym(elements[2]);
        with
            throw(~stop, ("Channel '" + (elements[2])) + "' contains invalid characters.");
        lowerchannel = tosym((elements[2]).lowercase());
        db = (| $channel_db.search(lowerchannel) |) || 0;
        if (type(db) == 'list) {
            if ((type(db[3]) == 'frob) && ((!((db[3]).try(sender()))) && (!($sys.is_system(sender())))))
                return ("Sorry, channel " + (db[1])) + " is join-locked.";
            msg = (("Channel " + (elements[2])) + " added with alias ") + (elements[1]);
        } else if (.can_create_channel()) {
            db = [channel, 0, 0, 0, sender(), [sender()], 0, 0];
            $channel_db.insert(lowerchannel, db);
            msg = (("Channel " + (elements[2])) + " created with alias ") + (elements[1]);
        } else {
            return "Sorry, that channel doesn't exist, and you are not authorized to create new channels.";
        }
    }
    $channel_db.value_changed(lowerchannel, db.replace(2, (db[2]) + 1));
    channel_dict = channel_dict.add(elements[1], db[1]);
    .channel_on(db[1]);
    return msg;
};

public method .broadcast() {
    arg channel, msg;
    var q, spammer_name, message, target, user;
    
    (> .perms(sender()) <);
    
    // is this really a command?. If so, do the command.
    catch any {
        switch (msg) {
            case "who":
                if ((channel in ($channel_db.system_channels())) && (!($sys.is_system(sender()))))
                    return "Sorry, that's a listen only channel.";
                return .channel_members(channel);
            case "off":
                .channel_off(channel);
                return;
            case "on":
                .channel_on(channel);
                return;
        }
    } with {
        return (traceback()[1])[2];
    }
    if ((channel in ($channel_db.system_channels())) && (channel != 'All))
        return "Sorry, that's a listen only channel.";
    if (!(active_channels.contains(channel)))
        return "You must be on a channel to send a message to it.";
    spammer_name = .name();
    if (((msg[1]) == "'") || ((msg[1]) == "-")) {
        target = ((msg.explode())[1]).subrange(2);
        msg = msg.subrange((target.length()) + 3);
        catch ~namenf
            user = $user_db.match(target);
        with
            return target + " is not a valid user.";
        if (!(user.connected()))
            return (user.name()) + " is not connected.";
        if (!(user.channel_member(channel)))
            return (user.name()) + " is not a member of that channel.";
        spammer_name += (" (to " + (user.name())) + ")";
    }
    
    // check for poses, thinking, etc.
    switch (msg[1]) {
        case ":":
            message = (spammer_name + " ") + (msg.subrange(2));
        case "%":
            message = ((spammer_name + " . o O ( ") + (msg.subrange(2))) + " )";
        case "!":
            (> .channel_moderator_ok() <);
            message = msg.subrange(2);
        default:
            message = msg ? ($code_lib.punctuation_type(msg)) : "say";
            message = ((((spammer_name + " ") + message) + "s, \"") + msg) + "\"";
    
            // message = spammer_name + ": " + msg;
    }
    ._broadcast(channel, message);
};

public method .can_create_channel() {
    if ((sender().has_ancestor($user)) && (($channel_ui.channel_creation()) || ($sys.is_system(sender()))))
        return 1;
    else
        return 0;
};

protected method .channel_add_lock_cmd() {
    arg cmdstr, cmd, this, prep, str;
    var channel, db, lock, mode, modestr;
    
    (> .perms(caller(), 'command) <);
    if ((cmd[2]) == "j") {
        mode = 3;
        modestr = "join";
    } else if ((cmd[2]) == "l") {
        mode = 4;
        modestr = "leave";
    } else {
        mode = 8;
        modestr = "use";
    }
    channel = tosym(this.lowercase());
    db = (| $channel_db.search(channel) |) || 0;
    if (type(db) == 'list) {
        if ((!(sender() in (db[6]))) && (!($sys.is_system(sender())))) {
            return "Sorry, you're not on the manager list for that channel.";
        } else if ((str.length()) == 0) {
            $channel_db.value_changed(channel, db.replace(mode, 0));
            return ((("You un-" + modestr) + "lock channel ") + (db[1])) + ".";
        } else {
            catch ~objnf, ~parse {
                lock = $lock_frob.parse(str, sender());
                $channel_db.value_changed(channel, db.replace(mode, lock));
                return ((((("You " + modestr) + "lock channel ") + (db[1])) + " with ") + (lock.lock_name('thing))) + ".";
            } with {
                switch (error()) {
                    case ~objnf:
                        return "Object not found in lock string.";
                    case ~parse:
                        return "Invalid lock string.";
                }
            }
        }
    } else {
        return "Channel not found, nothing locked.";
    }
};

public method .channel_add_manager() {
    arg cmdstr, cmd, user, prep, channel;
    var db, channel;
    
    channel = (| tosym(channel.lowercase()) |) || 0;
    if (channel == 0)
        return "@add-channel-manager|@acm <user> to <channel>";
    db = (| $channel_db.search(channel) |) || 0;
    if (db == 0)
        return "That channel does not exist.";
    if ((sender() != (db[5])) && (!($sys.is_system(sender()))))
        return "You are not the channel owner.";
    if (user in (db[6]))
        return ((user.name()) + " is already a manager of channel ") + (db[1]);
    $channel_db.value_changed(channel, db.replace(6, [@db[6], user]));
    return "Manager added.";
};

public method .channel_alias() {
    arg ch_alias;
    
    return (| channel_dict[ch_alias] |) || "";
};

public method .channel_command() {
    arg cmd, args, opts, detailed, full;
    var ch, syn, cmd;
    
    syn = ("Syntax: " + cmd) + " <channel> <command>";
    if (listlen(args) < 2)
        return [syn, "Where <command> is one of: WHO, OFF, ON, or INFO"];
    [ch, cmd, @args] = args;
    switch (cmd) {
        case "who":
            if ((ch in ($channel_db.system_channels())) && (!($sys.is_system(this()))))
                return "Sorry, that's a listen only channel.";
            return .channel_members(ch, full);
        case "off":
            .channel_off(ch);
            return;
        case "on":
            .channel_on(ch);
            return;
        case "info":
            return;
        default:
            return ("Unknown @channel command: " + cmd) + ", should be: WHO, OFF, ON or INFO";
    }
};

public method .channel_creation() {
    return channel_creation;
};

public method .channel_del_manager() {
    arg cmdstr, cmd, user, prep, channel;
    var db, channel;
    
    channel = (| tosym(channel.lowercase()) |) || 0;
    if (channel == 0)
        return "@add-channel-manager|@acm <user> from <channel>";
    db = (| $channel_db.search(channel) |) || 0;
    if (db == 0)
        return "That channel does not exist.";
    if ((sender() != (db[5])) && (!($sys.is_system(sender()))))
        return "You are not the channel owner.";
    if (!(user in (db[6])))
        return ((user.name()) + " is not a manager of channel ") + (db[1]);
    $channel_db.value_changed(channel, db.replace(6, (db[6]).del(user)));
    return "Manager deleted.";
};

public method .channel_dict() {
    return channel_dict;
};

public method .channel_member() {
    arg channel;
    
    return channel in dict_values(channel_dict || #[]);
};

public method .channel_members() {
    arg channel, @full;
    var q, members, name, who, line;
    
    members = [];
    [(full ?= 0)] = full;
    if (full) {
        line = ("All members of channel " + channel) + " ('*'=listening, '!'=not connected):";
        who = $user_db.user_dbrefs();
    } else {
        line = ("Connected members of channel " + channel) + " ('*'=listening):";
        who = $user_db.connected();
    }
    for q in (who) {
        if (!valid(q))
            continue;
        if (q.channel_member(channel)) {
            if (q.connected())
                name = " " + (q.name());
            else
                name = "!" + (q.name());
            if (q.listen_channel(channel))
                members += ["*" + name];
            else
                members += [" " + name];
        }
    }
    return ([line] + ((members.vcolumnize(4, (.linelen()) - 4)).prefix("    "))) + ["---"];
};

public method .channel_moderator_ok() {
    (> .check_mojo() <);
    return 1;
};

public method .channel_msg() {
    arg channel, msg;
    
    (caller() == definer()) || (> .perms(sender(), 'system) <);
    if ((channel == 'All) || (active_channels.contains(channel)))
        .tell((("<" + channel) + "> ") + msg);
};

protected method .channel_off() {
    arg channel;
    
    if (active_channels.contains(channel)) {
        if (channel in ($channel_db.system_channels()))
            .tell(("<" + channel) + "> You have left this channel.");
        else
            .broadcast(channel, ":has left this channel.");
        active_channels = active_channels.del(channel);
    } else {
        .tell("You are not on this channel.");
    }
};

protected method .channel_on() {
    arg channel;
    
    if (!(active_channels.contains(channel))) {
        active_channels = active_channels.add(channel, 1);
        if (channel in ($channel_db.system_channels()))
            .tell(("<" + channel) + "> You have joined this channel");
        else
            .broadcast(channel, ":has joined this channel.");
    } else {
        .tell("You are already on this channel.");
    }
};

public method .channel_page_cmd() {
    arg cmd, cmstr, channel;
    var text, line;
    
    if ((.channel_alias(channel)) == "")
        return .tell(("Channel alias " + channel) + " does not exist.");
    text = .read();
    if (text == 'aborted)
        return .tell("@paste aborted.");
    else if (!text)
        return .tell("@paste nothing?");
    for line in (text)
        .broadcast(.channel_alias(channel), ":paste: " + line);
};

public method .channel_purge_cmd() {
    arg cmdstr, cmd, channel;
    var db, channel, connected, u;
    
    channel = (| tosym(channel.lowercase()) |) || 0;
    if (channel == 0)
        return "@purge-channel <channel>";
    db = (| $channel_db.search(channel) |) || 0;
    if (db == 0)
        return "That channel does not exist.";
    if ((sender() != (db[5])) && (!($sys.is_system(sender()))))
        return "You are not the channel owner.";
    $channel_db.remove(channel);
    connected = $user_db.connected();
    for u in ((((($user_db.database()).to_dict()).to_list()).slice(2)).compress()) {
        if ((u in connected) && (((u.channel_dict()).invert()).contains(db[1])))
            u.tell((("<" + (db[1])) + "> Channel deleted by ") + (sender().name()));
        (| u._del_active_channel(db[1]) |);
        (| u._del_channel_dict(((u.channel_dict()).invert())[db[1]]) |);
        pause();
    }
    return "Channel deleted.";
};

protected method .channels_cmd() {
    arg cmdstr, cmd, args;
    var opts, f, d, cur_channels, cd_keys, cd_values, i, alias, db, active, msg, match_with, match_pattern, tmp, form, add, o;
    
    (> .perms(caller(), 'command) <);
    [args, opts] = args;
    o = opts.slice(1);
    if ((f = (| "f?ull" in o |)))
        f = (opts[f])[3];
    if ((d = (| "d?etailed" in o |)))
        d = (opts[d])[3];
    if (listlen(args) > 1) {
        catch any {
            cmd = (| ($channel_db.search(args[1]))[1] |);
            return .channel_members(cmd, f);
        } with {
            return (traceback()[1])[2];
        }
    }
    cd_keys = channel_dict.keys();
    cd_values = channel_dict.values();
    cur_channels = f ? ((($channel_db.database()).values()).slice(1)) : cd_values;
    if (args) {
        match_with = (| .get_setting("match-with", $programmer) |) || 'match_pattern;
        match_pattern = (| (args[1])[1] |) || ((| .get_setting("match-default", $programmer) |) || "*");
        cur_channels = filter f in (cur_channels) where ((f.to_string()).(match_with)(match_pattern) != 0);
    }
    if (!cur_channels)
        return "No channels found.";
    msg = [];
    add = [];
    for i in (cur_channels) {
        alias = (| cd_keys[i in cd_values] |) || "";
        db = (| $channel_db.search(tostr(i)) |);
        if (type(db) == 'list) {
            msg += [[(active_channels.contains(i)) ? "*" : " ", alias, tostr(db[1]), (db[7]) || "<no description>"]];
            form = "%26r: %50l";
            if (d) {
                tmp = [form.format("Number of users", tostr(db[2])), form.format("Owner", (db[5]).name()), form.format("Managers", ((db[6]).mmap('namef, 'name)).to_english())];
                if (db[3])
                    tmp += [form.format("Join Lock", (db[3]).lock_name())];
                if (db[4])
                    tmp += [form.format("Leave Lock", (db[4]).lock_name())];
                if (db[8])
                    tmp += [form.format("Use Lock", (db[8]).lock_name())];
                add += [tmp];
            }
        } else {
            msg += [[(active_channels.contains(i)) ? "*" : " ", alias, "", "Channel not in database!"]];
        }
        refresh();
    }
    msg = (msg.transpose()).tabulate([["", ""], ["Alias", "-----"], ["Channel", "-------"], ["Description", "-----------"]]);
    if (d)
        msg = [msg[1], msg[2], @map i in [3 .. msg.length()] to ([msg[i]] + (add[i - 2])).sum()];
    return [@msg, "   -----"];
};

protected method .delcom_cmd() {
    arg cmdstr, cmd, args;
    var db, channel, del_from_db, msg, dict_var;
    
    (> .perms(caller(), 'command) <);
    del_from_db = 1;
    msg = ("Channel alias " + args) + " deleted.";
    if (!args)
        return ("Syntax: " + cmd) + " <channel>";
    dict_var = (| channel_dict[args] |);
    channel = (| (((channel_dict[args]).to_string()).lowercase()).to_symbol() |) || 0;
    if (type(channel) == 'symbol) {
        db = (| $channel_db.search(channel) |) || 0;
        if (type(db) == 'list) {
            if ((type(db[4]) == 'frob) && ((!((db[4]).try(sender()))) && (!($sys.is_system(sender())))))
                return "Channel leave locked, you can't leave it!";
        } else {
            del_from_db = 0;
            msg = ("That channel does not seem to be in the channel database.  Channel alias " + args) + " deleted.";
        }
    } else {
        return "You do not have that channel alias defined.";
    }
    if (del_from_db)
        $channel_db.value_changed(channel, db.replace(2, (db[2]) - 1));
    if (active_channels.contains(dict_var))
        .channel_off(dict_var);
    channel_dict = channel_dict.del(args);
    return msg;
};

protected method .describe_channel_cmd() {
    arg cmdstr, cmd, channel, prep, desc;
    var db, channel;
    
    (> .perms(caller(), 'command) <);
    channel = (| tosym(channel.lowercase()) |) || 0;
    if (channel == 0)
        return "@desc-ch?annel <channel> as <description>";
    db = (| $channel_db.search(channel) |) || 0;
    if (db == 0)
        return "That channel does not exist.";
    if ((!(sender() in (db[6]))) && (!($sys.is_system(sender()))))
        return "You are not a manager for channel " + (db[1]);
    $channel_db.value_changed(channel, db.replace(7, desc));
    return "Description updated.";
};

protected method .init_channel_ui() {
    channel_dict = #[];
    active_channels = #[];
};

public method .listen_channel() {
    arg channel;
    
    if (active_channels.contains(channel))
        return 1;
    return 0;
};

public method .uninit_channel_ui() {
    var c, channel, db;
    
    for c in (.channel_dict()) {
        if ((| active_channels[c[2]] |) || 0)
            .channel_off(c[2]);
        channel = (| tosym(((c[2]).to_string()).lowercase()) |) || 0;
        if (type(channel) == 'symbol) {
            db = (| $channel_db.search(channel) |) || 0;
            if (type(db) == 'list)
                $channel_db.value_changed(channel, db.replace(2, (db[2]) - 1));
        }
    }
    active_channels = #[];
    channel_dict = #[];
};


