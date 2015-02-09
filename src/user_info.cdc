
new object $user_info: $user_interfaces;

var $command_cache modules = [];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 843753238;
var $root defined_settings = #[["rl-name", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-email", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-address", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-affiliation", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-position", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-location", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-interests", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-plan", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-projects", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]], ["rl-home-page", #[['get, ['get_user_info]], ['set, ['set_user_info]], ['clear, ['clear_user_info]], ['format, ['format_user_info]], ['access, ['public_user_info]]]]];
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core];
var $root inited = 1;
var $root managed = [$user_info];
var $root manager = $user_info;
var $root trusted_by = [$smtp];
var $user_info info = 0;
var $user_info info_defaults = #[["rl-name", 1], ["rl-email", 0], ["rl-address", 0], ["rl-affiliation", 0], ["rl-position", 0], ["rl-location", 0], ["rl-interests", 0], ["rl-plan", 0], ["rl-projects", 0], ["rl-home-page", 1]];

protected method .clear_user_info() {
    arg name;
    
    if (info.contains(name))
        info = info.del(name);
};

public method .display_info() {
    arg @no_blanks;
    var out, i, v, sys;
    
    out = [];
    sys = .is_writable_by(sender());
    for i in (($user_info.info_defaults()).keys()) {
        v = (| info[i] |) || [0, ""];
        if ((!(v[2])) && no_blanks)
            continue;
        i = substr(i, 4);
        if ((v[1]) || sys)
            out += [(((i.capitalize()) + ":").pad(13)) + (v[2])];
        else
            out += [(((i.capitalize()) + ":").pad(13)) + "** PRIVATE **"];
    }
    return out;
};

protected method .format_user_info() {
    arg value;
    
    return ((value[1]) ? "+public " : "") + toliteral(value[2]);
};

protected method .get_user_info() {
    arg name, @args;
    
    if ((| $user_info.info_defaults(name) |) == ~keynf)
        throw(~setting, ("Invalid user info setting '" + name) + "'");
    return (| info[name] |) || [0, ""];
};

public method .info_defaults() {
    arg @name;
    
    if (name)
        return (> info_defaults[name[1]] <);
    return info_defaults;
};

public method .public_user_info() {
    arg name, sender, @caller;
    var i;
    
    i = (| info[name] |) || [0, ""];
    if ((!(i[1])) && (!(.is_writable_by(sender))))
        throw(~private, ("'" + name) + "' is private user information.");
};

public method .set_info_default() {
    arg name, def;
    
    def = def ? 1 : 0;
    info_defaults = dict_add(info_defaults, name, def);
};

public method .set_user_info() {
    arg name, definer, value, @args;
    var tmp, bool, public, def, valid;
    
    def = $user_info.info_defaults();
    if (!(def.contains(name)))
        throw(~setting, ("Invalid user info setting '" + name) + "'");
    value = (value.explode_quoted()).join(" ");
    if (value && ((value[1]) in ["+", "-"])) {
        bool = (value[1]) == "+";
        tmp = substr(value, 2);
        if ((tmp = match_template(tmp, "p?ublic *"))) {
            value = tmp[2];
            public = bool;
        } else {
            public = def[name];
        }
    } else {
        public = def[name];
    }
    
    // restrictions
    if ((!value) && (name == "rl-email"))
        throw(~setting, "You must specify an email address");
    if (name == "rl-email") {
        if ($sys.validate_email_addresses()) {
            .tell("Verifying Email Address..");
            tmp = (> $smtp.verify_email_address(value) <);
            .tell("SMTP Response: " + (tmp.join(" ")));
        } else {
            (> $smtp.parse_email_address(value) <);
        }
    }
    
    // set it 
    if (!info)
        info = #[];
    info = info.add(name, [public, value]);
};

public method .user_info() {
    arg name;
    var i;
    
    // call this method to bypass the settings system.
    i = (| info[name] |) || ((| info["rl-" + name] |) || [0, ""]);
    if ((!(i[1])) && ((!(.is_writable_by(sender()))) && ((caller() != $mail_list) && (caller() != $mail_message))))
        throw(~private, ("'" + name) + "' is private user information.");
    return i[2];
};


