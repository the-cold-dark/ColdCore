
new object $settings_ui: $user_interfaces;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $has_commands local = \
  #[["@set?tings", [["@set?tings", "on|from *", "@set?tings on|from <object reference>", 'settings_on_cmd, #[[2, ['objref, []]]]]]],\
  ["@set|@setting?s",\
    [["@set|@setting?s", "*", "@set|@setting?s <any>", 'set_cmd, #[[1, ['any, []]]]]]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$settings_ui];
var $root manager = $settings_ui;

public method ._change_setting() {
    arg name, value, definer, object;
    var current, style, index, pos;
    
    (> .perms(sender(), 'writers) <);
    style = name.last();
    if (style in ["+", "-"]) {
        name = name.subrange(1, (name.length()) - 1);
        if (!definer)
            definer = object._find_setting_definer(name);
        current = (object.setting(name, definer)) || [];
        if (style == "+")
            value = [@current || [], value];
        else
            value = current.delete(toint(value));
    }
    catch ~check, ~set
        (> object.OLD_set_setting(definer, name, value) <);
    with
        throw(~stop, (traceback()[1])[2]);
};

public method ._show_setting() {
    arg setting, definer, object;
    var line;
    
    line = ("  " + setting) + " = ";
    setting = (| object.display_setting(setting, definer) |);
    if (setting != ~setting)
        line += setting;
    return line;
};

public method ._show_settings() {
    arg object;
    var a, s, out;
    
    if (!(object.trusts(this())))
        return (((object.namef('ref)) + " does not trust you enough to show you ") + (((| object.gender() |) || $gender_neuter).pronoun('pp))) + " settings.";
    out = [];
    for a in (object.ancestors()) {
        if (a == $has_settings)
            break;
        s = (| a.OLD_defined_settings() |);
        if (s)
            out += [._show_settings_on(a, object)];
    }
    return out.reverse();
};

public method ._show_settings_on() {
    arg definer, object;
    var settings, s, setting, line, out;
    
    if (!(object.trusts(this())))
        return [(definer.namef('xref)) + ":", "  ** Unable to see settings **"];
    settings = (| definer.OLD_defined_settings() |) || [];
    out = [];
    for s in (settings)
        out += [._show_setting(s, definer, object)];
    if (!out)
        out = ["  (none)"];
    return [(definer.namef('xref)) + ":"] + out;
};

protected method .set_cmd() {
    arg cmdstr, cmd, args;
    var opt, definer, t, p, name, value, object, reg, s;
    
    (> .perms(caller(), 'command) <);
    if (!args)
        return ._show_settings(this());
    if ((reg = regexp(args, "^ *(.*)<([^)]+)>(.*) *$"))) {
        definer = (> .match_env_nice(reg[2]) <);
        args = (((reg[1]).trim()) + " ") + ((reg[3]).trim());
    }
    if ((reg = regexp(args, "^ *([^:=]+): *(.*) *$"))) {
        object = (> .match_env_nice(reg[1]) <);
        args = reg[2];
    } else {
        object = this();
    }
    if ((reg = regexp(args, "^ *([a-z0-9_@-]+)[ =](.*)$"))) {
        name = (reg[1]).trim();
        args = (reg[2]).trim();
    } else {
        name = args;
        args = "";
    }
    if (!name)
        return [("-- Settings on " + (object.namef('ref))) + ":", ._show_settings(object), "--"];
    
    // this should fix the quotes
    value = args.unquote();
    
    // change it
    catch any {
        ._change_setting(name, value, definer, object);
        .tell(["-- Setting changed to:", ._show_setting(name, definer, object), "--"]);
    } with {
        return (traceback()[1])[2];
    }
};

protected method .settings_cmd() {
    arg cmdstr, cmd, args;
    var flag, value, template, syn, bool, line;
    
    (> .perms(caller(), 'command) <);
    syn = cmd + " [+|-]<flag>[=<value>]";
    if (!args) {
        return .list_settings('local);
    } else if (args in ["-all", "-a"]) {
        return .list_settings('all);
    } else {
        bool = (args[1]) in ["-", "+"];
        if (bool)
            args = args.subrange(2);
        args = args.explode("=");
        flag = args[1];
        if ((args.length()) == 2)
            value = args[2];
        else
            value = "";
        template = .setting_template(flag);
        if (!template)
            return ("No setting available with the flag \"" + flag) + "\".";
        switch (template[2]) {
            case 'boolean:
                if (!bool)
                    return ("Value must be boolean (+|-" + flag) + ").";
                value = bool - 1;
            case 'integer:
                if (!($string.is_numeric(value)))
                    return ("Value must be an integer (" + flag) + "=<integer>).";
                value = toint(value);
            case 'string:
                if (!value)
                    return ("Value must be a string (" + flag) + "=<string>).";
        }
        .OLD_set_setting(flag, value);
        line = ("Setting " + flag) + " set to ";
        switch (template[2]) {
            case 'boolean:
                line += (value == 1) ? "+" : "-";
            default:
                line += toliteral(value);
        }
        .tell(line);
    }
};

protected method .settings_on_cmd() {
    arg cmdstr, cmd, prep, ref;
    
    (> .perms(caller(), 'command) <);
    
    // this is a hookneyed way to do it, and wont work out in the long run,
    // but until we get arguments in the parser this will work fine
    if ((ref[2]) == (ref[3]))
        return ._show_settings(ref[3]);
    else
        return ._show_settings_on(ref[3], ref[2]);
};


