
new object $programmer: $storyteller, $dmi_data_ui;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $has_commands local = \
  #[["@id", [["@id", "*", "@id <any>", 'id_cmd, #[[1, ['any, []]]]]]],\
  ["@which",\
    [["@which", "*", "@which <any>", 'which_cmd, #[[1, ['any, []]]]]]],\
  ["@eval",\
    [["@eval", "*", "@eval <any>", 'eval_cmd, #[[1, ['any, []]]]]]],\
  ["@add-c?ommand|@ac",\
    [["@add-c?ommand|@ac", "*", "@add-c?ommand|@ac <any>", 'add_command_cmd, #[[1, ['any, []]]]]]],\
  ["@del-c?ommand|@dc",\
    [["@del-c?ommand|@dc", "*", "@del-c?ommand|@dc <any>", 'del_command_cmd, #[[1, ['any, []]]]]]],\
  ["@join",\
    [["@join", "*", "@join <any>", 'join_cmd, #[[1, ['any, []]]]]]],\
  ["@chpar?ents",\
    [["@chpar?ents", "*", "@chpar?ents <any>", 'chparents_cmd, #[[1, ['any, []]]]]]],\
  ["@add-s?hortcut|@as",\
    [["@add-s?hortcut|@as", "*", "@add-s?hortcut|@as <any>", 'add_shortcut_cmd, #[[1, ['any, []]]]]]],\
  ["@del-m?ethod|@delm?ethod|@dm",\
    [["@del-m?ethod|@delm?ethod|@dm", "*", "@del-m?ethod|@delm?ethod|@dm <objref>", 'del_method_cmd, #[[1, ['objref, []]]]]]],\
  ["@trace-method|@trace",\
    [["@trace-method|@trace", "*", "@trace-method|@trace <objref>", 'trace_method_cmd, #[[1, ['objref, []]]]]]],\
  ["@ledit",\
    [["@ledit", "*", "@ledit <objref: +e?dited>", 'local_edit_cmd, #[[1, ['objref_opt, ["e?dited"]]]]]]],\
  ["@program",\
    [["@program", "*", "@program <objref: +w?arnings +e?dited=1 +a?ccess=1 +f?lags=1>", 'program_cmd, #[[1, ['objref_opt, ["w?arnings", "e?dited", "a?ccess", "f?lags"]]]]], ["@program", "* with *", "@program <objref: +w?arnings +e?dited=1 +a?ccess=1 +f?lags=1> with <any>", 'program_cmd, #[[1, ['objref_opt, ["w?arnings", "e?dited", "a?ccess", "f?lags"]]]], [3, ['any, []]]]]], ["@del-v?ariable|@dv", [["@del-v?ariable|@dv", "*", "@del-v?ariable|@dv <objref>", 'del_var_cmd, #[[1, ['objref, []]]]]]],\
  ["@show",\
    [["@show", "*", "@show <objref: +c?hop>", 'show_cmd, #[[1, ['objref_opt, ["c?hop"]]]]]]],\
  ["@del-s?hortcut|@ds",\
    [["@del-s?hortcut|@ds", "*", "@del-s?hortcut|@ds <any>", 'del_shortcut_cmd, #[[1, ['any, []]]]]]],\
  ["@add-p?arent|@ap",\
    [["@add-p?arent|@ap", "*", "@add-p?arent|@ap <any>", 'add_parent_cmd, #[[1, ['any, []]]]]]],\
  ["@del-p?arent|@dp",\
    [["@del-p?arent|@dp", "*", "@del-p?arent|@dp <any>", 'del_parent_cmd, #[[1, ['any, []]]]]]],\
  ["@grep",\
    [["@grep", "*", "@grep <any:+d?escend +f?ull +l?ist +r?eplace-with=1>", 'grep_cmd, #[[1, ['any_opt, ["d?escend", "f?ull", "l?ist", "r?eplace-with"]]]]]]],\
  ["@chmod|@mmod|@omod|@chflag?s",\
    [["@chmod|@mmod|@omod|@chflag?s", "*", "@chmod|@mmod|@omod|@chflag?s <any>", 'chmod_cmd, #[[1, ['any, []]]]]]],\
  ["@dump",\
    [["@dump", "*", "@dump <any: +t?extdump +m?ethods +v?ariables +h?eader>", 'dump_cmd, #[[1, ['any_opt, ["t?extdump", "m?ethods", "v?ariables", "h?eader"]]]]]]],\
  ["@list",\
    [["@list", "*", "@list <objref: +n?umbers +t?extdump>", 'list_cmd, #[[1, ['objref_opt, ["n?umbers", "t?extdump"]]]]]]],\
  ["@add-v?ariable|@av",\
    [["@add-v?ariable|@av", "*", "@add-v?ariable|@av <any>", 'add_var_cmd, #[[1, ['any, []]]]]]],\
  ["@hl?ist|@help-list",\
    [["@hl?ist|@help-list", "*", "@hl?ist|@help-list <any>", 'help_list_cmd, #[[1, ['any, []]]]]]],\
  ["@hw?rite|@help-write",\
    [["@hw?rite|@help-write", "*", "@hw?rite|@help-write <any>", 'help_write_cmd, #[[1, ['any, []]]]]]],\
  ["@spawn",\
    [["@spawn", "*", "@spawn <any>", 'spawn_cmd, #[[1, ['any, []]]]]]],\
  ["@ancestors",\
    [["@ancestors", "*", "@ancestors <any>", 'ancestors_cmd, #[[1, ['any, []]]]]]],\
  ["@nh?n|@new-help|@new-help-node",\
    [["@nh?n|@new-help|@new-help-node", "*", "@nh?n|@new-help|@new-help-node <any:+n?amed=1 +o?bjname=1 +i?ndex=1>", 'new_help_node_cmd, #[[1, ['any_opt, ["n?amed", "o?bjname", "i?ndex"]]]]]]],\
  ["@config-set?ting|@configure-set?ting",\
    [["@config-set?ting|@configure-set?ting", "*", "@config-set?ting|@configure-set?ting <any>", 'configure_setting_cmd, #[[1, ['any, []]]]]]],\
  ["@def-set?ting|@define-set?ting",\
    [["@def-set?ting|@define-set?ting", "*", "@def-set?ting|@define-set?ting <any>", 'define_setting_cmd, #[[1, ['any, []]]]]]],\
  ["@undef-set?ting|@undefine-set?ting",\
    [["@undef-set?ting|@undefine-set?ting", "*", "@undef-set?ting|@undefine-set?ting <any>", 'undefine_setting_cmd, #[[1, ['any, []]]]]]],\
  ["@descend?ants",\
    [["@descend?ants", "*", "@descend?ants <objref:+a?ll +r?edundant +o?nly +n?ot>", 'descendants_cmd, #[[1, ['objref_opt, ["a?ll", "r?edundant", "o?nly", "n?ot"]]]]]]],\
  ["@d?isplay",\
    [["@d?isplay", "*", "@d?isplay <objref: +c?hop +g?enerations>", 'display_cmd, #[[1, ['objref_opt, ["c?hop", "g?enerations"]]]]]]],\
  ["@cp|@copy",\
    [["@cp|@copy", "*", "@cp|@copy <objref:+c?omment>", 'move_cmd, #[[1, ['objref_opt, ["c?omment"]]]]]]],\
  ["@rehash",\
    [["@rehash", "*", "@rehash <any:+r?aw +c?lient>", 'rehash_cmd, #[[1, ['any_opt, ["r?aw", "c?lient"]]]]]]]];
var $has_commands shortcuts = #[[";*", ['eval_cmd, ["eval", 1]]]];
var $has_name name = ['prop, "Generic Programmer", "Generic Programmer"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$programmer];
var $mail_list readers = [];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $programmer]];
var $mail_ui subscribed = #[[$programmer, [791485891, 0]]];
var $programmer eval_offset = 0;
var $programmer eval_prefix = 0;
var $programmer eval_tick_offset = 0;
var $root created_on = 796268969;
var $root defined_settings = #[["match-with", #[['parse, ['parse_match_with]]]], ["match-default", #[]], ["@program-options", #[]], ["@list-options", #[]]];
var $root flags = ['methods, 'code, 'core, 'variables, 'general_cache];
var $root inited = 1;
var $root managed = [$programmer];
var $root manager = $programmer;
var $root quota = 75000;
var $root settings = #[["match-default", "*"], ["home", $body_cave], ["@list-options", ""], ["@program-options", ""], ["match-with", 'match_pattern], ["extended-parsers", []]];
var $thing gender = $gender_neuter;
var $user connected_at = 0;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user modes = #[];
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

private method ._def_setcmd_opt() {
    arg opt, type, opts, dict;
    var i, value, m;
    
    if (!(i = opt in (opts.slice(1))))
        return dict;
    value = (opts[i])[4];
    if (!value)
        throw(~stop, ("No value for option \"" + opt) + "\".");
    catch any {
        switch (type) {
            case 'symbol:
                value = [(> value.to_symbol() <)];
            case 'data_list:
                value = (> fromliteral(value) <);
                if (type(value) != 'list)
                    value = [value];
        }
    } with {
        rethrow(~stop);
    }
    opt = opt.strip("?");
    if ((m = match_pattern(opt, "*-args"))) {
        opt = tosym(m[1]);
        if (!dict_contains(dict, opt))
            throw(~stop, ((("Arguments defined for " + opt) + " without defining ") + opt) + " method.");
        value = [(dict[opt])[1], @value];
        return dict_add(dict, opt, value);
    } else {
        return dict_add(dict, tosym(opt), value);
    }
};

protected method ._display_methods() {
    arg obj, info, chop, f;
    var type, types, line, out, m, len;
    
    len = .linelen();
    out = [];
    for type in (info.keys()) {
        line = (tostr(type).capitalize()) + " Methods";
        if (f)
            line += (" matching \"" + f) + "\"";
        out += [line + ":"];
        for m in (info[type]) {
            line = strfmt("%5l %4r %l.%l(%l)", $object_lib.parse_method_flags(m[8]), m[6], ((m[1]) != obj) ? (m[1]) : "", m[2], m[3]);
            if (chop)
                line = line.chop(len);
            out += [line];
            refresh();
        }
    }
    return out;
};

protected method ._display_variables() {
    arg obj, info, chop, f;
    var line, i, len, out, fmt;
    
    len = .linelen();
    line = "Object Variables";
    if (f)
        line += (" matching \"" + f) + "\"";
    out = [line];
    for i in (info.reverse()) {
        line = strfmt("  %s,%s: %d", ((i[1]) != obj) ? (i[1]) : "", i[2], i[3]);
        if (chop)
            line = line.chop(len);
        out += [line];
        refresh();
    }
    return out;
};

protected method ._edit_method_callback() {
    arg code, client_data;
    var errors, edited, object, method, warns, sender;
    
    (> .perms(caller(), $editor_reference) <);
    [object, method] = client_data;
    sender = this();
    code += [(("// $#Edited: " + ($time.format("%d %h %y %H:%M"))) + " ") + sender];
    errors = (> object.add_method(code, method) <);
    if (errors)
        return ['failure, errors];
    warns = (> $code_lib.verify_code(code, method, 1) <);
    return ['success, [warns + ["Method compiled."]]];
};

protected method ._edit_variable_callback() {
    arg data, client_data;
    var name, def, errs, obj, variable;
    
    (> .perms(caller(), $editor_reference) <);
    [obj, variable] = client_data;
    data = ([variable + " = "] + data) + [";"];
    name = tosym("tmp_edit_" + time());
    def = (obj + ",") + variable;
    catch any {
        if ((errs = obj.add_method(data, name, 'evalonly)))
            return ['failure, [(("Unable to store " + def) + ": ") + (errs.join())]];
    } with {
        return ['failure, []];
    }
    catch any {
        data = obj.(name)();
    } with {
        (| obj.del_method(name) |);
        return ['failure, [(("Unable to store " + def) + ": ") + ((traceback()[1])[2])]];
    }
    (| obj.del_method(name) |);
    return ['success, [["Variable stored."]]];
};

protected method ._eval_subs() {
    arg code;
    var out, x;
    
    out = "";
    while ((x = match_regexp(code, "\^[a-z0-9_]+"))) {
        x = x[1];
        out += substr(code, 1, (x[1]) - 1);
        out += (> .match_env_nice(substr(code, (x[1]) + 1, (x[2]) - 1)) <);
        code = substr(code, x.sum());
    }
    if (code)
        out += code;
    return out;
};

protected method ._grep__brief() {
    arg regexp, objs;
    var obj, method, out, x, l, line, lines, code;
    
    for obj in (objs) {
        if (!valid(obj))
            continue;
        if (!(obj.has_flag('code))) {
            .tell(("You cannot read method code on " + obj) + ", skipping..");
            continue;
        }
        out = [];
        for method in (obj.methods()) {
            code = obj.list_method(method);
            lines = [];
            for x in [1 .. listlen(code)] {
                l = code[x];
                if (match_regexp(l, regexp))
                    lines += [x];
                refresh();
            }
            if (lines)
                out += [(((obj + ".") + method) + "(): ") + (lines.to_english())];
            refresh();
        }
        if (out)
            .tell(out);
        refresh();
    }
    return "---";
};

protected method ._grep__full() {
    arg regexp, objs;
    var obj, method, out, x, l, code;
    
    for obj in (objs) {
        if (!valid(obj))
            continue;
        if (!(obj.has_flag('code))) {
            .tell(("You cannot read method code on " + obj) + ", skipping..");
            continue;
        }
        out = [];
        for method in (obj.methods()) {
            code = obj.list_method(method);
            for x in [1 .. listlen(code)] {
                l = code[x];
                if (match_regexp(l, regexp))
                    out += [(((((obj + ".") + method) + "() line ") + x) + ": ") + l];
                refresh();
            }
            refresh();
        }
        if (out)
            .tell(out);
        refresh();
    }
    return "---";
};

protected method ._grep__list() {
    arg regexp, objs;
    var obj, code, x, l, lr, what, loop, method, opt;
    
    opt = .get_setting("@program-options", $programmer);
    for obj in (objs) {
        if (!valid(obj))
            continue;
        if (!(obj.has_flag('code))) {
            .tell(("You cannot read method code on " + obj) + ", skipping..");
            continue;
        }
        for method in (obj.methods()) {
            code = obj.list_method(method);
            for l in (code) {
                if (match_regexp(l, regexp)) {
                    .tell(([$object_lib.format_method_header(obj, method, opt, obj.method_flags(method), obj.method_access(method))] + (code.prefix("  "))) + ["."]);
                    break;
                }
                refresh();
            }
            refresh();
        }
        refresh();
    }
    return "---";
};

protected method ._grep__replace() {
    arg regexp, objs, replace;
    var obj, method;
    
    for obj in (objs) {
        if (!valid(obj))
            continue;
        if (!(obj.is_writable_by(this()))) {
            .tell(("You cannot write on " + obj) + ", skipping..");
            continue;
        }
        for method in (obj.methods()) {
            (> ._grep__replace_method(obj, method, regexp, replace) <);
            refresh();
        }
        refresh();
    }
    return "Done.";
};

protected method ._grep__replace_method() {
    arg obj, method, regexp, replace;
    var old_code, code, x, l, lr, errs, what;
    
    old_code = (code = obj.list_method(method));
    for x in [1 .. listlen(code)] {
        l = code[x];
        if (!match_regexp(l, regexp))
            continue;
        lr = strsed(l, regexp, replace, "g");
        .tell([((((("Change " + obj) + ".") + method) + "() line ") + x) + " from:", "  " + l, "to:", "  " + lr]);
        what = (> .prompt("? (yes, no, abort, abort-all) [yes] ") <);
        if ((!what) || (what in ["yes", "y"])) {
            code = replace(code, x, lr);
        } else if (what == "abort") {
            .tell("Aborting method ..");
            return;
        } else if (what == "abort-all") {
            throw(~stop, "Aborting grep replace");
        } else if (!(what in ["no", "n"])) {
            .tell(("Unknown command '" + what) + "', assuming 'no'.");
        }
        refresh();
    }
    if ((old_code != code) && (errs = obj.add_method(code, method)))
        .tell(((([((("Error in compilation of updated method " + obj) + ".") + method) + "():"] + (errs.prefix("  "))) + ["-- Method code: "]) + (code.prefix("  "))) + ["--"]);
};

protected method ._list_method() {
    arg obj, method, @args;
    var code, opt, flags, f;
    
    [(args ?= 0), (opt ?= "")] = args;
    code = obj.list_method(method);
    flags = obj.method_flags(method);
    if (args) {
        code = code.numbered_text();
        return ([(((((("-- " + (obj.method_access(method))) + " method ") + obj) + ".") + method) + "()") + (flags ? (": " + (flags.join(", "))) : "")] + code) + ["--"];
    } else {
        return ([$object_lib.format_method_header(obj, method, opt, flags, obj.method_access(method))] + (code.prefix("  "))) + ["."];
    }
};

protected method ._move_method() {
    arg remove, fobj, fname, tobj, tname, comment;
    var code, line, result, access, flags;
    
    if ((fobj == tobj) && remove) {
        if ((| tobj.find_method(tname) |) == tobj)
            tobj.del_method(tname);
        return (> fobj.rename_method(fname, tname) <);
    }
    code = (> fobj.list_method(fname) <);
    flags = (> fobj.method_flags(fname) <);
    access = (> fobj.method_access(fname) <);
    if (comment) {
        line = (((((((("// $#" + (remove ? "Moved" : "Copied")) + " ") + ($time.format("%d %h %y %H:%M"))) + " from ") + fobj) + ".") + fname) + "() by ") + this();
        if (type(comment) == 'string)
            line += ": " + comment;
        code += [line];
    }
    if ((> tobj.add_method(code, tname) <))
        throw(~compile, "Error encountered upon moving method!");
    (> tobj.set_method_flags(tname, flags) <);
    (> tobj.set_method_access(tname, access) <);
    if (remove)
        (> fobj.del_method(fname) <);
};

public method ._move_variable() {
    arg remove, fobj, fname, tobj, tname, comment;
    var value, line, result, tmp;
    
    value = (> fobj.eval([("return " + fname) + ";"]) <);
    if ((value[1]) != 'result)
        throw(~eval, "An error was encountered upon evaluation.");
    value = value[2];
    (> tobj.add_var(tname, value) <);
    if (remove)
        (> fobj.del_var(fname) <);
};

protected method ._show__methods() {
    arg obj, f, match, chop;
    var methods, types, m, t, out;
    
    types = #[];
    for m in (obj.methods()) {
        if (tostr(m).(match)(f) != 0)
            types = types.add_elem(obj.method_access(m), ((("." + m) + "(") + ((obj.method_info(m))[1])) + ")");
    }
    
    // hard-listing the types guarantee's their order
    out = [];
    for t in (['root, 'driver, 'public, 'protected, 'private, 'frob]) {
        if (!(types.contains(t)))
            continue;
        out += [(((tostr(t).capitalize()) + " methods matching \"") + f) + "\":"];
        for m in (types[t])
            out += ["  " + m];
    }
    return out;
};

protected method ._show__variables() {
    arg obj, f, match, chop;
    var parent, out, v, line, len;
    
    out = [];
    len = .linelen();
    for parent in (obj.data()) {
        if (valid(parent[1])) {
            out += [(((parent[1]) + " variables matching \"") + f) + "\":"];
            if ((parent[1]).has_flag('variables, this())) {
                for v in (parent[2]) {
                    if (tostr(v[1]).(match)(f) == 0)
                        continue;
                    line = (("  " + (v[1])) + ": ") + toliteral(v[2]);
                    if (chop)
                        line = line.chop(len);
                    out += [line];
                }
            } else {
                out += ["  ** Permission Denied **"];
            }
        } else {
            out += [($object_lib.get_name(parent[1])) + " Variables:"];
            for v in (parent[2]) {
                if (tostr(v[1]).(match)(f) == 0)
                    continue;
                line = (("  " + (v[1])) + ": ") + toliteral(v[2]);
                if (chop)
                    line = line.chop(len);
                out += [line];
            }
        }
        refresh();
    }
    return out;
};

protected method .add_command_cmd() {
    arg cmdstr, cmd, str;
    var ref, t, args, objref;
    
    (> .perms(caller(), 'command) <);
    args = str.explode_quoted();
    if (listlen(args) > 2) {
        if ((args[2]) in ["to", "for"])
            args = delete(args, 2);
        t = delete(args, listlen(args)).join();
        objref = args.last();
    } else if (listlen(args) == 2) {
        t = args[1];
        objref = args[2];
    } else {
        return ("Syntax: `" + cmd) + " \"template\" [to|for] <objref>";
    }
    catch any {
        ref = (> $parse_lib.ref(objref) <);
        if ((ref[1]) != 'method)
            return ("The reference " + objref) + " is not for a method.";
        if ((!(ref[4])) || (!((ref[4]).valid_ident())))
            return ((("Invalid method name " + (ref[3])) + ".") + (ref[4])) + "().";
        (> (ref[2]).add_command(t, tosym(ref[4])) <);
    } with {
        return (traceback()[1])[2];
    }
    return strfmt("Command %d added to %s.%s()", t, ref[3], ref[4]);
};

protected method .add_parent_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, parent;
    
    (> .perms(caller(), 'command) <);
    args = args.explode();
    if ((listlen(args) > 2) && ((args[2]) == "to"))
        args = delete(args, 2);
    if (listlen(args) != 2)
        return ("Syntax: `" + cmd) + " <parent> [to] <object>`";
    parent = (> .match_env_nice(args[1]) <);
    obj = (> .match_env_nice(args[2]) <);
    catch any {
        (> obj.add_parent(parent) <);
        return ((("Added parent to " + (obj.namef('ref))) + ", parents: ") + ((obj.parents()).to_english())) + ".";
    } with {
        return (traceback()[1])[2];
    }
};

protected method .add_shortcut_cmd() {
    arg cmdstr, cmd, args;
    var ref, syn;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    syn = cmd + " \"<shortcut>\" [to] \"<command>\" [on] \"<object>\"";
    if ((listlen(args) == 5) && (((args[2]) == "to") && ((args[4]) == "on")))
        args = [args[1], args[3], args[5]];
    if (listlen(args) != 3)
        return ("Syntax: `" + syn) + "`";
    ref = (> $parse_lib.ref(args[3]) <);
    if (((ref[1]) != 'method) || ((!(ref[4])) || (!(| tosym(ref[4]) |))))
        return ("Invalid method reference reference \"" + (args[3])) + "\".";
    catch any
        (> (ref[2]).add_shortcut(args[1], args[2], tosym(ref[4])) <);
    with
        return (traceback()[1])[2];
    return strfmt("Added shortcut %d to command %d on %s.%s().", args[1], args[2], ref[2], ref[4]);
};

protected method .add_var_cmd() {
    arg cmdstr, cmd, args;
    var ref, value, syn;
    
    (> .perms(caller(), 'command) <);
    syn = "@av <object>,<variable>[=<value>]";
    if (!args)
        (> .tell_error(syn, "Invalid obj,variable reference.") <);
    catch any
        ref = (> $parse_lib.ref(args.word(1)) <);
    with
        (> .tell_error(syn, (traceback()[1])[2]) <);
    if (((ref[1]) != 'variable) || (!(ref[4])))
        (> .tell_error(syn, "Invalid obj,variable reference.") <);
    if (" " in args) {
        args = substr(args, (" " in args) + 1);
        if (args && ((args[1]) == "="))
            args = substr(args, (" " in args) + 1);
        if (args) {
            value = .eval([("return " + args) + ";"]);
            if ((value[1]) == 'errors)
                (> .tell_error(syn, ("Unable to parse value \"" + args) + "\".") <);
            value = value[2];
        } else {
            value = 0;
        }
    } else {
        value = 0;
    }
    catch any {
        (> (ref[3]).add_var(tosym(ref[4]), value) <);
    } with {
        if (error() in [~varexists, ~symbol])
            return (traceback()[1])[2];
        rethrow(error());
    }
    return ((((("Object variable " + (ref[3])) + ",") + (ref[4])) + " added with value ") + value) + ".";
};

protected method .ancestors_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, maxlevels, line;
    
    (> .perms(caller(), 'command) <);
    syn = cmd + " <obj> [<levels>]";
    args = args.explode();
    if (!((args.length()) in [1, 2]))
        return syn;
    obj = (> .match_env_nice(args[1]) <);
    if ((args.length()) == 2) {
        if ((args[2]) == "all")
            maxlevels = 0;
        else
            maxlevels = abs(toint(args[2])) + 1;
    } else {
        maxlevels = 3;
    }
    line = ("Ancestors of " + obj) + ":";
    if (maxlevels) {
        line += tostr(maxlevels - 1);
        line = ((line + " level") + (((maxlevels - 1) > 1) ? "s" : "s")) + ":";
    } else {
        line += "all levels:";
    }
    .tell(line);
    .tell(obj._display_ancestors("", #[], 0, maxlevels));
    .tell("---");
};

protected method .chmod_cmd() {
    arg cmdstr, cmd, args;
    var a, ts, t, opts, b, objs, o, precedence, ref, flags, match, m;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    ts = ["cod?e", "cor?e", "d?river", "fe?rtile", "fo?rked", "fr?ob", "l?ocked", "m?ethods", "na?tive", "no?override", "pri?vate", "pro?tected", "pu?blic", "r?oot", "v?ariables"];
    if (!args)
        return ("=> Syntax: `" + cmd) + " <options> <object> [<object ..]`";
    opts = #[];
    objs = [];
    for a in (args) {
        if (a && ((a[1]) in ["+", "-"])) {
            b = (a[1]) == "+";
            a = substr(a, 2);
            match = 0;
            for t in (ts) {
                if (match_template(a, t)) {
                    opts = dict_add(opts, tosym(t.strip()), b);
                    match++;
                    break;
                }
            }
            if (!match) {
                catch ~symbol
                    opts = dict_add(opts, tosym(a), b);
                with
                    .tell(("Invalid option '" + a) + "' (non-alphanumeric characters)");
            }
        } else {
            objs += [a];
        }
    }
    if (!objs)
        return [("=> Syntax: `" + cmd) + " <options> <object> [<object ..]`", "No objects specified."];
    if (!opts)
        return [("=> Syntax: `" + cmd) + " <options> <object> [<object ..]`", "No options specified."];
    
    // ok, now handle it, keep precedence for their own sake
    for o in (objs) {
        catch any {
            ref = $parse_lib.ref(o);
        } with {
            .tell((traceback()[1])[2]);
            continue;
        }
        if (!precedence) {
            precedence = ref[1];
        } else if ((ref[1]) != precedence) {
            .tell(((("Item '" + o) + "' is not a ") + precedence) + " reference.");
            .tell("All references must be the same type.");
            continue;
        }
        o = ref[3];
        for a in (dict_keys(opts)) {
            catch any {
                switch (a) {
                    case 'driver, 'private, 'protected, 'public, 'root, 'frob:
                        if (precedence != 'method) {
                            .tell((("Option " + ((opts[a]) ? "+" : "-")) + a) + " is only applicable to methods.");
                            continue;
                        }
                        m = (> tosym(ref[4]) <);
                        (> o.set_method_access(m, a) <);
                        .tell(((("Set " + ($parse_lib.buildref(@ref))) + " access to ") + a) + ".");
                    case 'nooverride, 'locked, 'native, 'forked:
                        if (precedence != 'method) {
                            .tell((("Option " + ((opts[a]) ? "+" : "-")) + a) + " is only applicable to methods.");
                            continue;
                        }
                        m = (> tosym(ref[4]) <);
                        if (opts[a]) {
                            o.set_method_flags(m, setadd(o.method_flags(m), a));
                            .tell((((("Added Method Flag +" + a) + " to ") + ($parse_lib.buildref(@ref))) + ", flags: ") + (((o.method_flags(m)).prefix("+")).join()));
                        } else {
                            o.set_method_flags(m, setremove(o.method_flags(m), a));
                            .tell((((("Removed Method Flag +" + a) + " from ") + ($parse_lib.buildref(@ref))) + ", flags: ") + (((o.method_flags(m)).prefix("+")).join()));
                        }
                    default:
                        if (precedence != 'object) {
                            .tell((("Option " + ((opts[a]) ? "+" : "-")) + a) + " is only applicable to objects.");
                            continue;
                        }
                        if (opts[a]) {
                            o.add_flag(a);
                            .tell((((("Added Object Flag +" + a) + " to ") + (o.namef('ref))) + ", flags: ") + (((o.flags()).prefix("+")).join()));
                        } else {
                            o.del_flag(a);
                            .tell((((("Removed Object Flag +" + a) + " from ") + (o.namef('ref))) + ", flags: ") + (((o.flags()).prefix("+")).join()));
                        }
                }
            } with {
                .tell((traceback()[1])[2]);
            }
        }
        refresh();
    }
};

protected method .chparents_cmd() {
    arg cmdstr, cmd, args;
    var syn, p, x, obj, parents, match;
    
    (> .perms(caller(), 'command) <);
    syn = ("Syntax: `" + cmd) + " <child> [to] <parent>, <parent>, ...`";
    if ((match = match_template(args, "* to *"))) {
        obj = match[1];
        parents = match[3];
    } else if ((args = explode(args))) {
        if (listlen(args) == 1)
            return syn;
        obj = args[1];
        parents = sublist(args, 2).join();
    } else {
        return syn;
    }
    obj = (> .match_env_nice(obj) <);
    if (("," in parents) || (" and " in parents))
        parents = parents.explode_english_list();
    else
        parents = parents.explode();
    if (!parents)
        return "No parents to change to.";
    parents = map p in (parents) to ((> .match_env_nice(p) <));
    catch any {
        obj.chparents(@parents);
        return ((("Changed parents for " + obj) + " to ") + (parents.to_english())) + ".";
    } with {
        return (traceback()[1])[2];
    }
};

public method .clear_eval() {
    (| clear_var('eval_offset) |);
};

public method .configure_setting_cmd() {
    arg cmdstr, cmd, args;
    var def_opts, opts, o, name, config, m, definer, syn, type, def, val;
    
    syn = ("Syntax: `" + cmd) + " <definer>:<setting>[=default] [options]`";
    def_opts = [];
    for o in (["get", "set", "parse"])
        def_opts += [[o, 1], [o + "-a?rgs", 1]];
    def_opts += [["c?lear", 1], ["f?ormat", 1], ["a?ccess", 1], ["t?ype", 1]];
    [args, opts] = $parse_lib.getopt(args, def_opts);
    args = join(args, " ");
    if (!args) {
        .tell(syn);
        for o in (def_opts.slice(1))
            .tell(((("   +" + o) + "=<") + ((o.strip("?")).replace("-", " "))) + ">");
        return "Types can be any ColdC type and \"boolean\"";
    }
    if ((m = regexp(args, "^([^=]+) *= *(.*)$")))
        [args, def] = m;
    else
        def = "";
    if ((m = regexp(args, "^([^:]+) *: *([\@a-z0-9-]+)")))
        [definer, name] = m;
    else
        definer = args;
    catch any
        definer = (> .match_environment(definer) <);
    with
        return (traceback()[1])[2];
    if (!name)
        return syn;
    catch ~setnf
        definer = definer.setting_definer(name);
    with
        return (traceback()[1])[2];
    
    // setup some default config opts based off the desired type
    config = #[];
    if ((m = "t?ype" in (opts.slice(1)))) {
        type = (| ((opts[m])[4]).to_symbol() |);
        if ((!type) || (!($settings.is_valid_type(type))))
            return "Types can be any ColdC type and " + (($settings.valid_types()).to_english("", " or "));
        switch (type) {
            case 'boolean:
                config = #[['parse, ['is_boolean]], ['format, ['format_boolean]]];
            case 'itemlist:
                // do nothing, we re-adjust things later
            default:
                config = #[['parse, ['is_type, type]]];
        }
    }
    
    // now build default config--not the most efficient way--but cleaner
    config = (> ._def_setcmd_opt("get", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("get-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("set", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("set-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("parse", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("parse-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("c?lear", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("f?ormat", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("a?ccess", 'symbol, opts, config) <);
    if (type == 'itemlist) {
        config = config.add('parse, ['parse_itemlist, @(| config['parse] |) || []]);
        if (!(config.contains('format)))
            config = config.add('format, ['format_itemlist]);
    }
    
    // now reconfig it
    for o in (config) {
        catch any
            (> definer.set_setting_attr(name, @o) <);
        with
            .tell((traceback()[1])[2]);
    }
    .tell(((("Reconfigured setting " + definer) + ":") + name) + " as:");
    config = (definer.defined_settings())[name];
    for o in (config) {
        val = o[2];
        o = o[1];
        .tell((("    +" + strsub(tostr(o), "_", "-")) + "=") + (val[1]));
        if (listlen(val) > 1)
            .tell((("    +" + strsub(tostr(o), "_", "-")) + "-args=") + (map m in (sublist(val, 2)) to (toliteral(m)).join(",")));
    }
};

public method .define_setting_cmd() {
    arg cmdstr, cmd, args;
    var def_opts, opts, o, name, config, m, definer, syn, type, def, val;
    
    syn = ("Syntax: `" + cmd) + " <definer>:<setting>[=default] [options]`";
    def_opts = [];
    for o in (["get", "set", "parse"])
        def_opts += [[o, 1], [o + "-a?rgs", 1]];
    def_opts += [["c?lear", 1], ["f?ormat", 1], ["a?ccess", 1], ["t?ype", 1]];
    [args, opts] = $parse_lib.getopt(args, def_opts);
    args = join(args, " ");
    if (!args) {
        .tell(syn);
        for o in (def_opts.slice(1))
            .tell(((("   +" + o) + "=<") + ((o.strip("?")).replace("-", " "))) + ">");
        return "Types can be any ColdC type and \"boolean\"";
    }
    if ((m = regexp(args, "^([^=]+) *= *(.*)$")))
        [args, def] = m;
    else
        def = "";
    m = split(args, " *: *");
    if (listlen(m) != 2)
        return syn;
    [definer, name] = m;
    if ((m = regexp(name, "[^\@a-z0-9-]"))) {
        .tell((("Invalid character '" + (m[1])) + "' in setting name: ") + name);
        throw(~stop, "Setting name may only contain a-z, 0-9 and a dash");
    }
    catch any
        definer = (> .match_environment(definer) <);
    with
        return (traceback()[1])[2];
    if (!name)
        return syn;
    
    // setup some default config opts based off the desired type
    config = #[];
    if ((m = "t?ype" in (opts.slice(1)))) {
        type = (| ((opts[m])[4]).to_symbol() |);
        if ((!type) || (!($settings.is_valid_type(type))))
            return "Types can be any ColdC type and " + (($settings.valid_types()).to_english("", " or "));
        switch (type) {
            case 'boolean:
                config = #[['parse, ['is_boolean]], ['format, ['format_boolean]]];
            case 'itemlist:
                // do nothing, we re-adjust things later
            default:
                config = #[['parse, ['is_type, type]]];
        }
    }
    
    // now build default config--not the most efficient way--but cleaner
    config = (> ._def_setcmd_opt("get", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("get-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("set", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("set-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("parse", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("parse-a?rgs", 'data_list, opts, config) <);
    config = (> ._def_setcmd_opt("c?lear", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("f?ormat", 'symbol, opts, config) <);
    config = (> ._def_setcmd_opt("a?ccess", 'symbol, opts, config) <);
    if (type == 'itemlist) {
        config = config.add('parse, ['parse_itemlist, @(| config['parse] |) || []]);
        if (!(config.contains('format)))
            config = config.add('format, ['format_itemlist]);
    }
    
    // now add it..
    catch any
        config = (> definer.define_setting(name, config) <);
    with
        return (traceback()[1])[2];
    .tell(((("-- Defined setting " + definer) + ":") + name) + " as:");
    for o in (config) {
        val = o[2];
        o = o[1];
        .tell((("    +" + strsub(tostr(o), "_", "-")) + "=") + (val[1]));
        if (listlen(val) > 1)
            .tell((("    +" + strsub(tostr(o), "_", "-")) + "-args=") + (sublist(val, 2).join(",")));
    }
    
    // and set the default value
    catch any {
        o = definer;
        o = o.set_setting(name, o, def);
        val = o.format_setting(name, o, o.get_setting(name, o));
        return ["-- Default Setting:", (("  " + name) + " = ") + val, "--"];
    } with {
        return (traceback()[1])[2];
    }
};

protected method .del_command_cmd() {
    arg cmdstr, cmd, args;
    var ref, t, objref;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    if (listlen(args) > 2) {
        if ((args[2]) == "from")
            args = delete(args, 2);
        t = delete(args, listlen(args)).join();
        objref = args.last();
    } else if (listlen(args) == 2) {
        t = args[1];
        objref = args[2];
    } else {
        return ("Syntax: `" + cmd) + " \"template\" [from] <objref>";
    }
    catch any {
        ref = (> $parse_lib.ref(objref) <);
        if ((ref[1]) != 'method)
            return ("The reference " + objref) + " is not for a method.";
        if ((!(ref[4])) || (!((ref[4]).valid_ident())))
            return ((("Invalid method name " + (ref[3])) + ".") + (ref[4])) + "().";
        if (!(> (ref[2]).del_command(t, tosym(ref[4])) <))
            return strfmt("Command %d is not defined on %s.", t, ref[2]);
    } with {
        return (traceback()[1])[2];
    }
    return strfmt("Command %d removed from %s.%s()", t, ref[3], ref[4]);
};

protected method .del_method_cmd() {
    arg cmdstr, cmd, objref;
    var name, obj;
    
    (> .perms(caller(), 'command) <);
    if (!(objref[4]))
        return .tell(("No method specified to delete from " + (objref[3])) + ".");
    if (!(| (name = tosym(objref[4])) |))
        return .tell(("Invalid method name \"" + (objref[4])) + "\".");
    catch any {
        (> (objref[3]).del_method(name) <);
        .tell(((("Method " + (objref[3])) + ".") + name) + "() deleted.");
    } with {
        if (error() == ~methodnf)
            .tell(((("Method " + (objref[3])) + ".") + name) + "() does not exist.");
        else
            .tell((traceback()[1])[2]);
    }
};

protected method .del_parent_cmd() {
    arg cmdstr, cmd, args;
    var syn, obj, parent;
    
    (> .perms(caller(), 'command) <);
    syn = cmd + " <parent> [from] <object>";
    args = args.explode();
    if ((listlen(args) > 2) && ((args[2]) == "from"))
        args = delete(args, 2);
    if (listlen(args) != 2)
        (> .tell_error(syn) <);
    if (!args)
        (> .tell_error(syn) <);
    parent = (> .match_env_nice(args[1]) <);
    obj = (> .match_env_nice(args[2]) <);
    catch any {
        (> obj.del_parent(parent) <);
        return ((("Deleted parent from " + (obj.namef('ref))) + ", parents: ") + ((obj.parents()).to_english())) + ".";
    } with {
        (> .tell_error("", (traceback()[1])[2]) <);
    }
};

protected method .del_shortcut_cmd() {
    arg cmdstr, cmd, args;
    var ref, syn;
    
    (> .perms(caller(), 'command) <);
    args = args.explode_quoted();
    if ((listlen(args) == 3) && ((args[2]) == "from"))
        args = delete(args, 2);
    if (listlen(args) != 2)
        return ("Syntax: `" + cmd) + " \"<shortcut>\" [from] <objref>";
    ref = (> $parse_lib.ref(args[2]) <);
    if (((ref[1]) != 'method) || ((!(ref[4])) || (!(| tosym(ref[4]) |))))
        return ("Invalid method reference reference \"" + (args[2])) + "\".";
    catch any
        (> (ref[2]).del_shortcut(args[1]) <);
    with
        return (traceback()[1])[2];
    return strfmt("Deleted shortcut %d from %s.%s().", args[1], ref[2], ref[4]);
};

protected method .del_var_cmd() {
    arg cmdstr, cmd, ref;
    
    (> .perms(caller(), 'command) <);
    if (((ref[1]) != 'variable) || (!(ref[4])))
        return "Invalid obj,variable reference.";
    catch ~symbol
        (ref[3]).del_var(tosym(ref[4]));
    with
        return (traceback()[1])[2];
    return ((("Object variable " + (ref[3])) + ",") + (ref[4])) + " deleted.";
};

protected method .descendants_cmd() {
    arg cmdstr, cmd, args;
    var obj, max, line, opts, i, r, not, only, f;
    
    (> .perms(caller(), 'command) <);
    
    // parse args
    [obj, args, opts] = args;
    if ((obj[1]) != 'object)
        return "Object reference must simply be a dbref.";
    if ((obj[2]) != (obj[3]))
        .tell(("Ignoring specified definer " + (obj[2])) + ".");
    obj = obj[3];
    only = (not = []);
    max = 1;
    if ((i = "o?nly" in (opts.slice(1)))) {
        only = map f in ((((opts[i])[4]).split(" *, *")).nonzero()) to (f.to_symbol());
        opts = delete(opts, i);
    }
    if ((i = "n?ot" in (opts.slice(1)))) {
        not = map f in ((((opts[i])[4]).split(" *, *")).nonzero()) to (f.to_symbol());
        opts = delete(opts, i);
    }
    if ((i = "r?edundant" in (opts.slice(1)))) {
        r = (opts[i])[3];
        opts = delete(opts, i);
    }
    if ((i = "a?ll" in (opts.slice(1)))) {
        if ((opts[i])[3])
            max = 0;
        opts = delete(opts, i);
    }
    if (opts) {
        if ((max = find i in (opts) where ((i[2]).is_numeric()))) {
            max = toint((opts[max])[2]);
            if (max < 1)
                return "Maximum levels must be greater than zero.";
        }
    }
    
    // do it
    line = ("-- Descendants of " + obj) + " [";
    .tell((line + (((obj.parents()).mmap('objname)).to_english())) + "]");
    if (max) {
        line = (max + " level") + ((max > 1) ? "s" : "");
        max++;
    } else {
        line = "all levels";
    }
    if (r)
        line += ", redundant entries";
    .tell("-- " + line);
    if (only)
        .tell("-- only objects with flag(s): +" + (only.join(" AND +")));
    if (not)
        .tell("-- not objects with flag(s): +" + (not.join(" OR +")));
    return [obj.format_descendants("", #[], 0, max, only, not, r), "--"];
};

protected method .display_cmd() {
    arg cmdstr, cmd, args;
    var opts, slice, what, match, i, chop, f, gen, def, obj, out;
    
    (> .perms(caller(), 'command) <);
    opts = args[3];
    args = args[1];
    chop = 1;
    slice = opts.slice(1);
    if ((i = "c?hop" in slice) && (!((opts[i])[3])))
        chop = 0;
    else
        chop = .linelen();
    def = args[3];
    if ((i = "g?enerations" in slice)) {
        gen = (opts[i])[4];
        if (gen.is_numeric())
            gen = ['generations, toint(gen)];
        else if (gen)
            gen = ['ancestors_descending, (> .match_env_nice(gen) <)];
        else
            gen = ['ancestry, def];
        def = 0;
    } else {
        gen = ['generations, 1];
    }
    what = [args[1]] + ((| args[5] |) ? [args[5]] : []);
    obj = args[2];
    if (type(obj) == 'frob)
        return ["The target object was a frob.  Please use @exam instead."];
    out = $object_lib.format_object(obj, chop);
    if (!(args[4]))
        f = .get_setting("match-default", $programmer);
    else
        f = args[4];
    match = .get_setting("match-with", $programmer);
    catch ~perm {
        if ('method in what)
            out += ._display_methods(obj, obj.list_methods(gen, def, f, match), chop, f);
    } with {
        out += ["  ** No permission to list methods **"];
    }
    catch ~perm {
        if ('variable in what)
            out += ._display_variables(obj, obj.variable_info(gen, def, f, match), chop, f);
    } with {
        out += ["  ** No permission to show variables **"];
    }
    return out + ["---"];
};

protected method .dump_cmd() {
    arg cmdstr, cmd, args;
    var opts, objs, o, obj, i, tdfmt, meths, vars, header, bad_objs;
    
    (> .perms(caller(), 'command) <);
    opts = args[2];
    args = args[1];
    o = opts.slice(1);
    (i = "t?extdump" in o) && (tdfmt = (opts[i])[3]);
    (i = "m?ethods" in o) ? (meths = (opts[i])[3]) : (meths = 1);
    (i = "v?ariables" in o) ? (vars = (opts[i])[3]) : (vars = 1);
    (i = "h?eader" in o) ? (header = (opts[i])[3]) : (header = 1);
    if ((!meths) && (!vars))
        return "Perhaps you will want to dump methods and/or vars next time?";
    objs = [];
    bad_objs = [];
    for o in (args) {
        catch any {
            obj = (> .match_env_nice(o) <);
            if (type(obj) == 'frob)
                bad_objs += [o];
            else
                objs += [obj];
        } with {
            .tell((traceback()[1])[2]);
        }
    }
    if (!objs) {
        if ((bad_objs.length()) > 0)
            .tell("NOTE:  these objects were frobs and couldn't be @dump'd: " + (bad_objs.to_english()));
        return "Dump nothing?";
    }
    if (tdfmt)
        .dump_fmt_textdump(objs, meths, vars, header);
    else
        .dump_fmt_commands(objs, meths, vars, header);
    if ((bad_objs.length()) > 0)
        .tell("NOTE:  these objects were frobs and couldn't be @dump'd: " + (bad_objs.to_english()));
};

protected method .dump_fmt_commands() {
    arg objs, meths, vars, header;
    var data, obj, out, a, v, m, line, pars, cmdopts;
    
    // this uses .tell() to keep its internal overhead from bloating
    // it could be faster by building a list and printing it all at once
    // but this is nicer on the server (especially when dumping large objects).
    for obj in (objs) {
        refresh();
        if (header) {
            if (obj == $root) {
                pars = $root;
                line = "";
            } else {
                pars = obj.parents();
                line = (((((((";var p, new; if(!(| valid(" + obj) + ") |)) ") + "{ new = ") + (pars[1])) + ".spawn();") + " new.set_objname('") + (obj.objname())) + ");}";
                if (listlen(pars) > 1)
                    line += (" obj.chparents(" + join(pars, ",")) + ");";
                .tell(line);
            }
        }
        if (vars) {
            catch ~perm {
                data = (> obj.data() <);
                for a in (dict_keys(data)) {
                    refresh();
                    for v in (data[a]) {
                        if (a == obj)
                            .tell(strfmt("@av %l,%l = %d", obj, @v));
                        .tell(strfmt(";|as %l<%l>;%l = %d;", obj, a, @v));
                    }
                }
            } with {
                .tell((traceback()[1])[2]);
            }
        }
        if (meths) {
            cmdopts = .get_setting("@program-options", $programmer);
            catch ~perm {
                for m in ((> obj.methods() <)) {
                    refresh();
                    .tell(.format_method(obj, m, 'normal, cmdopts));
                }
            } with {
                .tell((traceback()[1])[2]);
            }
        }
    }
};

protected method .dump_fmt_textdump() {
    arg objs, meths, vars, header;
    var data, obj, out, a, v, m;
    
    // this uses .tell() to keep its internal overhead from bloating
    // it could be faster by building a list and printing it all at once
    // but this is nicer on the server (especially when dumping large objects).
    for obj in (objs) {
        refresh();
        if (header)
            .tell([((("object " + obj) + ": ") + ((obj.parents()).join(", "))) + ";", ""]);
        if (vars) {
            catch ~perm {
                data = (> obj.data() <);
                for a in (dict_keys(data)) {
                    refresh();
                    for v in (data[a])
                        .tell(strfmt("var %l %l = %d;", a, @v));
                }
            } with {
                .tell((traceback()[1])[2]);
            }
        }
        .tell("");
        if (meths) {
            catch ~perm {
                for m in ((> obj.methods() <)) {
                    refresh();
                    .tell([""] + (.format_method(obj, m, 'textdump)));
                }
            } with {
                .tell((traceback()[1])[2]);
            }
        }
    }
};

protected method .eval_cmd() {
    arg cmdstr, com, str;
    var result, adjust, vars, v, evalp, times, line, reg, obj, definer, ref, debug;
    
    (> .perms(caller(), 'command) <);
    evalp = .eval_prefix();
    vars = (evalp.keys()).join(", ");
    v = (evalp.values()).join();
    
    // clean it up
    str = strsed(str, "^;*", "");
    
    // perform escape substitution
    if (str && ((str[1]) == "|"))
        str = substr(str, 2);
    else
        str = (> .eval_subs(str) <);
    
    // check for debug flags
    if ((reg = regexp(str, "^(trace|debug|profile|ops|opcodes) *;*(.*)$"))) {
        [debug, str] = reg;
        if (debug == "ops")
            debug = "opcodes";
        debug = tosym(debug);
    } else {
        debug = 0;
    }
    
    // who are we evaluating as
    if ((reg = regexp(str, "^ *as +([^; ]+)"))) {
        catch ~objnf, ~namenf, ~ambig
            ref = $parse_lib.ref(reg[1]);
        with
            (> .tell_error("", (traceback()[1])[2]) <);
        obj = ref[2];
        definer = ref[3];
        str = strsed(str, "^ *as +([^; ]+)[ ;]+", "");
        if ((!(definer.is_writable_by(this()))) || (!(obj.is_writable_by(this()))))
            return ("You do not have permission to evaluate on " + (reg[1])) + ".";
        if (!(obj.is(definer)))
            return (obj + " isn't a child of ") + definer;
    } else {
        obj = (definer = this());
    }
    
    // are we just adjusting our offset?
    if (!str) {
        result = (> .evaluate(((("var " + vars) + ";") + v) + "return (> 1 <);", obj, definer, 'no_offset) <);
        result = replace(result[1], 1, ((result[1])[1]) - 1);
        if (eval_offset)
            line = strfmt("adjusted by %s ticks and %s.%6{0}r seconds.", (eval_offset[1]) - (result[1]), (eval_offset[2]) - (result[2]), abs((eval_offset[3]) - (result[3])));
        else
            line = strfmt("set to %s ticks and %s.%6{0}r seconds.", @result);
        eval_offset = result;
        return "Eval offset " + line;
    }
    
    // format it
    if (match_begin(str, "var") && (reg = regexp(str, "var ([^;]+)"))) {
        str = strsed(str, "var ([^;]+);", "");
        str = ((((("var " + vars) + ", ") + (reg.join(","))) + ";") + v) + str;
    } else if ("return" in str) {
        str = ((("var " + vars) + ";") + v) + str;
    } else {
        str = strsed(str, " *;* *$", "");
        str = ((((("var " + vars) + ";") + v) + "return (> ") + str) + " <);";
    }
    if (debug) {
        result = (> .evaluate(str, obj, definer, debug) <);
        debug = (| result[3] |);
    } else {
        result = (> .evaluate(str, obj, definer, debug) <);
    }
    [times, result] = result;
    
    // Display the errors, or the result.
    if ((result[1]) == 'errors) {
        .tell(result[2]);
    } else if ((result[1]) == 'traceback) {
        .tell((result[2]).fmt_tb());
        line = strfmt("[ seconds: %l.%6{0}r; operations: %s", times[2], times[3], times[1]);
        if (times[2])
            line += (" (" + ((times[1]) / (times[2]))) + " ticks per second)";
        return line + " ]";
    } else {
        if (type(result[2]) == 'objnum)
            .tell("=> " + ((| (result[2]).namef('xref) |) || (result[2])));
        else
            .tell("=> " + toliteral(result[2]));
        if (debug)
            .tell(debug);
        line = strfmt("[ seconds: %l.%6{0}r; operations: %s", times[2], times[3], times[1]);
        if (times[2])
            line += (" (" + ((times[1]) / (times[2]))) + " ticks per second)";
        return line + " ]";
    }
};

protected method .eval_offset() {
    return eval_offset || #[['mtime, 0], ['time, 0], ['ticks, 0]];
};

public method .eval_prefix() {
    return dict_union(#[["me", ("me = " + this()) + ";"], ["here", ("here = " + (.location())) + ";"]], eval_prefix || #[]);
};

protected method .eval_subs() {
    arg code;
    var out, m, sub, tok;
    
    // HORRIBLY inefficient         
    tok = ("#@#ESCQUOTE-" + time()) + "#@#";
    code = strsub(code, "\\\"", tok);
    out = "";
    while ((m = match_pattern(code, "*\"*\"*"))) {
        out += (((> ._eval_subs(m[1]) <) + "\"") + (m[2])) + "\"";
        code = m[3];
    }
    if (code)
        out += (> ._eval_subs(code) <);
    return strsub(out, tok, "\\\"");
};

public method .evaluate() {
    arg str, obj, definer, @mode;
    var start, end, time, ticks, mtime, times1, times2, method, errs, trace, result, is_error;
    
    mode = mode ? (mode[1]) : 0;
    if (sender() != $eval_parser)
        (> .perms(caller(), $programmer) <);
    method = tosym("tmp_eval_" + time());
    if ((errs = (> definer.add_method([str], method, 'evalonly) <))) {
        if (mode)
            return [[0, 0, 0], ['errors, errs, 0, 0], []];
        else
            return [[0, 0, 0], ['errors, errs, 0, 0]];
    }
    if (mode == 'opcodes) {
        times1 = [tick(), time(), mtime()];
        result = obj.method_bytecode(method);
        times2 = [mtime(), time(), tick()];
    } else {
        catch any {
            if (mode in ['trace, 'profile])
                debug_callers(1);
            else if (mode == 'debug)
                debug_callers(2);
            times1 = [tick(), time(), mtime()];
            result = (> obj.(method)() <);
            times2 = [mtime(), time(), tick()];
            trace = call_trace();
            debug_callers(0);
        } with {
            times2 = [mtime(), time(), tick()];
            result = traceback();
            is_error = 1;
            debug_callers(0);
        }
    }
    (| definer.del_method(method) |);
    
    // figure up the actual times
    time = (times2[2]) - (times1[2]);
    ticks = (times2[3]) - (times1[1]);
    if ((times2[1]) > (times1[3]))
        mtime = (times2[1]) - (times1[3]);
    else if (time)
        mtime = ((time * 1000000) + (1000000 - (times1[3]))) + (times2[1]);
    else
        mtime = (1000000 - (times2[1])) + (times1[3]);
    
    // offset it?
    if (eval_offset && (mode != 'no_offset)) {
        ticks -= eval_offset[1];
        time -= eval_offset[2];
        mtime -= eval_offset[3];
    }
    if (trace)
        return [[ticks, time, abs(mtime)], ['result, result], $code_lib.generate_debug_listing(trace, mode)];
    return [[ticks, time, abs(mtime)], [is_error ? 'traceback : 'result, result]];
};

protected method .format_method() {
    arg obj, method, format, @opts;
    var code, opt, flags, f;
    
    // this needs to be on $programmer ot get the programmers perms
    [(opt ?= "")] = opts;
    code = obj.list_method(method);
    flags = obj.method_flags(method);
    switch (format) {
        case 'textdump:
            return (([(((((((obj.method_access(method)) + " method ") + obj) + ".") + method) + "()") + (flags ? (": " + (flags.join(", "))) : "")) + " {"] + (code.prefix("    "))) + ["};"]) + ((obj.credit()).prefix("// "));
        case 'numbered:
            code = code.numbered_text();
            return (([(((((("-- " + (obj.method_access(method))) + " method ") + obj) + ".") + method) + "()") + (flags ? (": " + (flags.join(", "))) : "")] + code) + ["--"]) + ((obj.credit()).prefix("// "));
        default:
            return (([$object_lib.format_method_header(obj, method, opt, flags, obj.method_access(method))] + (code.prefix("  "))) + ["."]) + ((obj.credit()).prefix("// "));
    }
};

protected method .grep_cmd() {
    arg cmdstr, cmd, args;
    var more, regexp, from, syn, opts, d, f, l, r, rep, slice, objs, obj, out;
    
    (> .perms(caller(), 'command) <);
    [more, opts] = args;
    if ((more.length()) < 2)
        return ("=> Syntax: `" + cmd) + " [options] <regexp> <object> <object>..";
    regexp = more[1];
    more = more.subrange(2);
    
    // handle the options
    slice = opts.slice(1);
    if ((r = (| "r?eplace-with" in slice |))) {
        rep = (opts[r])[4];
        r = (opts[r])[3];
    }
    if ((d = (| "d?escend" in ((args[2]).slice(1)) |)))
        d = (opts[d])[3];
    if ((l = (| "l?ist" in ((args[2]).slice(1)) |)))
        l = (opts[l])[3];
    if ((f = (| "f?ull" in ((args[2]).slice(1)) |)))
        f = (opts[f])[3];
    
    // now we check for conflicting or incorrect options..
    if (d && (!(.is($admin))))
        return "Only administrators may use the +descend option, talk to one.";
    if (d && ((more.length()) > 1))
        return "+descend can only be used with a single object as the target.";
    if (r && (f || l))
        return "+replace-with option cannot be used with +full or +list.";
    if (f && l)
        return "+full cannot be used with +list.";
    
    // the pause() flushes so we can see the 'Searching for ..'
    // Do this now because .descendants() can lag
    .tell(("Searching for \"" + regexp) + "\"...");
    pause();
    
    // figure out our targets
    if (d) {
        obj = (> .match_env_nice(more[1]) <);
        objs = [obj, @obj.descendants()];
    } else {
        objs = [];
        for obj in (more)
            objs += [(> .match_env_nice(obj) <)];
    }
    
    // verify its a valid regexp
    catch ~regexp
        match_regexp("", regexp);
    with
        return "Invalid regular expression: " + ((traceback()[1])[2]);
    
    // call the right grep method
    if (r)
        return (> ._grep__replace(regexp, objs, rep) <);
    else if (l)
        return (> ._grep__list(regexp, objs) <);
    else if (f)
        return (> ._grep__full(regexp, objs) <);
    else
        return (> ._grep__brief(regexp, objs) <);
};

protected method .help_list_cmd() {
    arg cmdstr, cmd, str;
    var node, out;
    
    (> .perms(caller(), 'command) <);
    if (!str)
        node = .current_node();
    else
        node = .parse_help_reference(str);
    if (!(node.is($help_node)))
        return (node.namef('ref)) + " is not a descendant of $help_node.";
    return (["@hwrite " + node] + ((node.body()).uncompile())) + ["."];
};

protected method .help_write_cmd() {
    arg cmdstr, cmd, str;
    var node, text, errors, ignore;
    
    (> .perms(caller(), 'command) <);
    if (!str) {
        node = .current_node();
    } else {
        catch any {
            node = .parse_help_reference(str);
        } with {
            .tell(("-- " + ((traceback()[1])[2])) + " --");
            .read("-- Ignoring until '.' or @abort --");
            return "Done ignoring.";
        }
    }
    if (!(node.is($help_node))) {
        ignore++;
        .tell((node.namef('ref)) + " is not a descendant of $help_node, ignoring.");
    }
    if (!(node.is_writable_by(this()))) {
        ignore++;
        .tell(("You cannot write help on " + (node.name())) + ", ignoring.");
    }
    text = .read(("-- Enter CML text for " + (node.namef('ref))) + " --");
    if (text == 'aborted)
        return;
    if (ignore)
        return "Done ignoring.";
    node.set_body(text);
    return ("New help text set for " + (node.namef('ref))) + ".";
};

protected method .id_cmd() {
    arg cmdstr, cmd, obj;
    
    (> .perms(caller(), 'command) <);
    obj = (> .match_env_nice(obj) <);
    if (type(obj) == 'frob)
        return ["The target object was a frob."];
    .tell((((((((obj.namef('xref)) + " ") + ($object_lib.see_perms(obj))) + " ") + toliteral(obj.parents())) + " ") + tostr(obj.size())) + " bytes");
};

protected method .join_cmd() {
    arg cmdstr, cmd, who;
    var loc, p, user;
    
    (> .perms(caller(), 'command) <);
    if (!who) {
        .tell("Specify a user to join.");
        return;
    }
    catch any {
        if ((who[1]) in "$#") {
            user = (> $object_lib.to_dbref(who) <);
            if (!(user.has_ancestor($thing)))
                return "You can only join things in the VR.";
        } else {
            user = (> $user_db.search(who) <);
        }
    } with {
        .tell((traceback()[1])[2]);
        return;
    }
    loc = user.location();
    if (loc == (.location())) {
        .tell(("You are already with " + (user.name())) + "!");
        return;
    }
    if (!(.teleport(loc)))
        .tell("Sorry.");
    else
        .tell(("You join " + (user.name())) + ".");
};

protected method .list_cmd() {
    arg cmdstr, cmd, args;
    var i, pattern, ref, methods, s, def, method, opts, str, m, d, out, type;
    
    (> .perms(caller(), 'command) <);
    if ((opts = .get_setting("@list-options", $programmer))) {
        opts = (> $parse_lib.opt(opts, "n?umbers", "t?extdump") <);
        opts = union(args[3], opts[2]);
    } else {
        opts = args[3];
    }
    if ((i = (| "n?umbers" in (opts.slice(1)) |)) && ((opts[i])[3]))
        type = 'numbered;
    else if ((i = (| "t?extdump" in (opts.slice(1)) |)) && ((opts[i])[3]))
        type = 'textdump;
    else
        type = 'normal;
    ref = args[1];
    if ((ref[1]) == 'variable)
        return ((("The reference " + (ref[3])) + ",") + ((ref[4]) || "")) + " is not for a method.";
    if ((ref[1]) == 'object)
        return ("The reference " + (ref[3])) + " is not for a method.";
    if (!((ref[2]).has_flag('methods)))
        return .tell(("You don't have permission to find methods on " + (ref[2])) + ".");
    if (!((ref[2]).has_flag('code)))
        return .tell(("You don't have permission to list methods on " + (ref[2])) + ".");
    def = (| (ref[2]).find_method(tosym(ref[4])) |);
    if (def) {
        pattern = ref[4];
        methods = [tosym(ref[4])];
    } else {
        if (ref[4])
            pattern = ref[4];
        else
            pattern = .get_setting("match-default", $programmer);
        def = ref[3];
        m = .get_setting("match-with", $programmer);
        methods = [];
        for method in (def.methods()) {
            if (tostr(method).(m)(pattern) != 0)
                methods += [method];
        }
        if (!methods)
            return .tell((("No method found matching " + def) + ".") + pattern);
    }
    cmd = .get_setting("@program-options", $programmer);
    out = [];
    for method in (methods) {
        .ptell(.format_method(def, method, type, cmd), #[]);
        pause();
    }
};

protected method .local_edit_cmd() {
    arg cmdstr, cmd, args;
    var ref, edited, code, def, meth, i;
    
    (> .perms(caller(), 'command) <);
    ref = args[1];
    if ((ref[1]) == 'variable)
        return ((("The reference " + (ref[3])) + ",") + ((ref[4]) || "")) + " is not for a method.";
    if ((ref[1]) == 'object)
        return ("The reference " + (ref[3])) + " is not for a method.";
    if ((ref[3]) && (!((ref[3]).is_writable_by(this()))))
        return "You cannot program on that object.";
    if ((!(ref[4])) || (!((ref[4]).valid_ident())))
        return ("The method name '" + (ref[4])) + "' is not acceptable.";
    meth = tosym(ref[4]);
    catch ~methodnf {
        def = (ref[3]).find_method(meth);
        if (!(def.is_writable_by(this())))
            return ("You cannot program on " + def) + ".";
    } with {
        return ((("Method " + (ref[3])) + ".") + meth) + "() not found.";
    }
    if ((i = "e?dited" in ((args[3]).slice(1)))) {
        if (!(((args[3])[i])[3])) {
            if (!($sys.is_admin(this())))
                return "Only admins can shut off edited comments.";
        } else {
            edited = 1;
        }
    } else {
        edited = 1;
    }
    if (edited) {
        edited = (("// $#Edited: " + ($time.format("%d %h %y %H:%M"))) + " ") + this();
        if (i && (((args[3])[i])[4]))
            edited += ": " + (((args[3])[i])[4]);
    }
    catch ~perm
        code = def.list_method(meth);
    with
        return (traceback()[1])[2];
    return .ptell(([(((((("#$# edit name: " + def) + ".") + meth) + " upload: @program ") + def) + ".") + meth] + (code.prefix("    "))) + ["."], #[['nomod, 1]]);
};

protected method .managed_cmd() {
    arg cmdstr, cmd, args;
    var manager, managed, obj, out, len;
    
    (> .perms(caller(), 'command) <);
    if (!args)
        args = ".";
    manager = (| .match_environment(args) |);
    if (!manager) {
        manager = (| $user_db.search(args) |);
        if (!manager)
            return ("Unable to find \"" + args) + "\".";
    }
    managed = manager.managed();
    if (!managed)
        return (manager.namef('ref)) + " does not manage any objects.";
    out = [(manager.namef('ref)) + " manages:"];
    len = (.linelen()) / 2;
    for obj in (managed) {
        if (!valid(obj)) {
            .tell(("  ** invalid object (" + obj) + ") **");
            continue;
        }
        out += [(("  " + ((obj.namef('xref)).pad(len))) + " ") + ($object_lib.see_perms(obj, ["", ""]))];
    }
    return out + ["---"];
};

protected method .move_cmd() {
    arg cmdstr, cmd, args;
    var src, dest, comment, i, how, ref, opts;
    
    (> .perms(caller(), 'command) <);
    
    // is this actually @copy|@cp?
    how = match_begin(cmd, "@c") ? 'copy : 'move;
    
    // handle args
    [src, args, opts] = args;
    if (args && ((args[1]) == "to"))
        args = delete(args, 1);
    if (!args)
        throw(~stop, ("You must " + how) + " to something.");
    catch ~objnf
        dest = $parse_lib.ref(join(args));
    with
        throw(~stop, (traceback()[1])[2]);
    
    // drop back to $builder.move_cmd if it is just an object
    if ((src[1]) == 'object) {
        if (how == 'copy)
            throw(~strop, "You cannot copy objects!");
        return (> pass(cmdstr, cmd, [src, dest, opts]) <);
    }
    
    // options
    if ((i = "c?omment" in (opts.slice(1))))
        comment = ((opts[i])[4]) || ((opts[i])[3]);
    else
        comment = 1;
    
    // twiddle with things a little
    if ((dest[1]) == 'object)
        dest = [src[1], dest[2], dest[3], src[4], 0];
    
    // oops, crossed wires
    if ((src[1]) != (dest[1])) {
        ref = (tostr(src[1]).prefix_a_or_an()) + " to ";
        ref += tostr(dest[1]).prefix_a_or_an();
        throw(~stop, (("You cannot " + how) + " ") + ref);
    }
    if (!(src[4]))
        return ("Invalid " + (src[1])) + " reference, no name specified.";
    if (!(dest[4]))
        dest = replace(dest, 4, src[4]);
    if (((src[3]) == (dest[3])) && ((src[4]) == (dest[4])))
        return ((("Why do you want to " + how) + " the ") + (src[1])) + " to itself?";
    catch ~symbol {
        src = replace(src, 4, (src[4]).to_symbol());
        dest = replace(dest, 4, (dest[4]).to_symbol());
    } with {
        return ("You cannot specify wildcards in the " + (src[1])) + " name.";
    }
    if ((how == 'move) && (!((src[3]).is_writable_by(this()))))
        return ("You do not have permission to move from " + (src[3])) + ".";
    if (!((dest[3]).is_writable_by(this())))
        return ((("You do not have permission to " + how) + " to ") + (dest[3])) + ".";
    catch any
        (> .(tosym("_move_" + (src[1])))(how == 'move, src[3], src[4], dest[3], dest[4], comment) <);
    with
        return (traceback()[1])[2];
    return ((((("You " + how) + " ") + ($parse_lib.buildref(@src))) + " to ") + ($parse_lib.buildref(@dest))) + ".";
};

protected method .new_editor_session() {
    arg ref, opts, type;
    var def, code, name, errs, data;
    
    switch (ref[1]) {
        case 'variable:
            code = ("return " + (ref[4])) + ";";
            def = ((ref[2]) + ",") + (ref[4]);
            name = (ref[4]).to_symbol();
            if (!(name in ((ref[2]).variables())))
                return [("The object variable " + def) + " does not exist.", ("You have to '@add-variable " + def) + "' before you can edit it."];
            name = tosym("tmp_edit_" + time());
            catch any {
                if ((errs = (ref[2]).add_method([code], name, 'evalonly)))
                    return [(("Unable to retrieve " + def) + ": ") + (errs.join())];
            } with {
                return [(("Unable to retrieve " + def) + ": ") + (errs.join())];
            }
            catch any {
                data = (ref[2]).(name)();
            } with {
                (| (ref[2]).del_method(name) |);
                return [(("Unable to retrieve " + def) + ": ") + ((traceback()[1])[2])];
            }
            (| (ref[2]).del_method(name) |);
            data = $data_lib.unparse_indent(data);
            (> .invoke_editor(this(), '_edit_variable_callback, data, [ref[2], ref[4]]) <);
        case 'method:
            def = (| (ref[2]).find_method(tosym(ref[4])) |);
            if (!def) {
                def = ref[3];
                code = [];
            } else {
                code = def.list_method(tosym(ref[4]));
            }
            (> .invoke_editor(this(), '_edit_method_callback, code, [def, tosym(ref[4])]) <);
        default:
            return (> pass(ref, opts, type) <);
    }
    if (.active_editor())
        return [("Editing " + ((.active_editor()).session_name())) + ".", "Type 'help' to list available commands."];
    else
        return ["Remote editing invoked."];
};

protected method .new_help_node_cmd() {
    arg cmdstr, cmd, args;
    var new, name, p, parent, i, syn, m, index, opts, objname, o;
    
    (> .perms(caller(), 'command) <);
    syn = ("=> Syntax: `" + cmd) + " [<parent node>] [options]`";
    [args, opts] = args;
    o = opts.slice(1);
    if ((i = "n?amed" in o)) {
        name = (opts[i])[4];
        if (!name)
            return [syn, "Option +n?amed requires a followup argument."];
    }
    if ((i = "o?bjname" in o)) {
        objname = (| ((opts[i])[4]).to_symbol() |);
        if (!objname)
            return [syn, "Option +o?bjname requires a followup argument."];
    }
    
    // now use 'i' as the string rep of 'index'
    if ((i = "i?ndex" in o)) {
        i = (opts[i])[4];
        if (!i)
            return [syn, "Option +i?ndex requires a followup argument."];
    }
    
    // now figure out the parent node
    if (args) {
        p = args[1];
        catch any
            parent = (> .parse_help_reference(p) <);
        with
            return (traceback()[1])[2];
    } else {
        parent = .current_node();
    }
    
    // figure out the index
    if (i) {
        if ((i[1]) in ["$", "#"])
            index = (| $object_lib.to_dbref(i) |);
        else
            index = $help_index.match_children(i);
        if (!index)
            return [syn, ("!  Unable to find index '" + i) + "'"];
        if (!(index.has_ancestor($help_index)))
            return [syn, ("!  '" + (index.namef('ref))) + "' is not a help index."];
    }
    
    // create it
    new = (> parent.spawn() <);
    .tell(((("Created new node " + new) + " from ") + (parent.namef('ref))) + ".");
    
    // change its objname?
    if (objname) {
        catch any {
            (> new.set_objname(objname) <);
            .tell(("Changed node's objname to " + new) + ".");
        } with {
            .tell("set_objname(): " + ((traceback()[1])[2]));
        }
    }
    
    // set its name?
    if (name) {
        catch any {
            (> new.set_name(name) <);
            .tell(("Changed node's name to " + (new.name())) + ".");
        } with {
            .tell("set_name(): " + ((traceback()[1])[2]));
        }
    } else {
        .tell(("No name specified, set it with `@rename " + new) + " to <name>`");
    }
    
    // set its index?
    if (index) {
        catch any {
            (> new.set_index(index) <);
            .tell(("Set node's index to " + (index.namef('ref))) + ".");
        } with {
            .tell("set_index(): " + ((traceback()[1])[2]));
        }
    } else {
        .tell(("No index specified, set it with `@set " + new) + ":index=<index>`");
    }
};

public method .parse_match_with() {
    arg value, @args;
    
    if (value in ["regexp", "pattern", "begin"])
        return tosym("match_" + (value.lowercase()));
    throw(~perm, "You can match with: regexp, pattern, begin.");
};

public method .parse_methodcmd_options() {
    arg syntax, args, @more;
    var o, opt, opts, out, r, l;
    
    [(o ?= []), (opts ?= [])] = more;
    o += [["pub?lic"], ["r?oot"], ["dr?iver"], ["pri?vate"], ["pro?tected"], ["no?override"], ["s?yncronized"], ["l?ocked"], ["na?tive"]];
    opts = dict_union(#[['exists, 0], ['ignore, 0], ['mflags, []], ['mstate, 'public], ['error, 0]], opts);
    args = $parse_lib.getopt(args, o);
    if (!(args[1])) {
        out = [];
        for opt in (o)
            out += ["  +|-" + (opt[1])];
        (> .tell_error(syntax, ["Valid options:"] + (out.lcolumnize())) <);
    }
    r = (| $parse_lib.ref((args[1]).join()) |);
    if (!r) {
        opts = opts.add('error, "Invalid <object>.<method> reference.");
        opts = opts.add('ignore, 1);
    }
    if (!((r[4]).valid_ident())) {
        opts = opts.add('error, (((r[2]) + ".") + tostr(r[4])) + "() is not a valid method reference.");
        opts = opts.add('ignore, 1);
    }
    r = replace(r, 4, tosym(r[4]));
    if ((r[2]) && (!((r[2]).is_writable_by(this())))) {
        opts = opts.add('error, ("You cannot program " + (r[2])) + ".");
        opts = opts.add('ignore, 1);
    }
    if ((| (r[2]).find_method(r[4]) |) == (r[2])) {
        opts = opts.add('mflags, (r[2]).method_flags(r[4]));
        opts = opts.add('mstate, (r[2]).method_access(r[4]));
        opts = opts.add('exists, 1);
    }
    opts = opts.add('object, r[2]);
    opts = opts.add('method, r[4]);
    for opt in (args[2]) {
        switch (opt[1]) {
            case "pub?lic", "r?oot", "dr?iver", "pri?vate", "pro?tected":
                opts = opts.add('mstate, (opt[1]).to_symbol());
            case "no?override", "s?yncronized":
                opts = opts.add('mflags, (opts['mflags]).setadd((opt[1]).to_symbol()));
            case "l?ocked":
                .tell("You cannot set the locked flag on a method.");
            case "n?ative":
                .tell("You cannot set the native flag on a method.");
            default:
                if (!(opt[1])) {
                    .tell(("Unknown option: \"" + (opt[2])) + "\"");
                    .tell("Valid options: " + ((o.slice(1)).to_english()));
                    continue;
                }
                opts = opts.add((opt[1]).to_symbol(), [opt[3], opt[4]]);
        }
    }
    return opts;
};

protected method .program_cmd() {
    arg cmdstr, com, args, @more;
    var ref, o, i, ops, ign, ed, fl, meth, ex, acc, warn, errs, code, line, errs, code;
    
    (> .perms(caller(), 'command) <);
    ops = args[3];
    ref = args[1];
    
    // verify what we have is correct
    if (!(meth = (| tosym(ref[4]) |))) {
        ign++;
        .tell(("The method name '" + (((ref[4]) == 0) ? "" : (ref[4]))) + "' is not acceptable.");
    }
    if ((!ign) && ((ref[3]) && (!((ref[3]).is_writable_by(this()))))) {
        ign++;
        .tell(("You cannot program on " + ((ref[3]).namef('ref))) + ".");
    }
    if ((!ign) && ((| (ref[3]).find_method(meth) |) == (ref[3])))
        ex++;
    
    // ok, go on with options
    o = ops.slice(1);
    if ((i = "e?dited" in o)) {
        if (!((ops[i])[3])) {
            if (!($sys.is_admin(this()))) {
                ign++;
                .tell("Only admins can shut off edited comments.");
            }
        } else {
            ed = 1;
        }
    } else {
        ed = 1;
    }
    if (ed) {
        ed = (("// $#Edited: " + ($time.format("%d %h %y %H:%M"))) + " ") + this();
        if (i && ((ops[i])[4]))
            ed += ": " + ((ops[i])[4]);
    }
    if ((i = "f?lags" in o))
        fl = $parse_lib.parse_method_flags((ops[i])[4]);
    else if (ex)
        fl = (ref[3]).method_flags(meth);
    else
        fl = [];
    if ((i = "a?ccess" in o))
        acc = $parse_lib.parse_method_access((ops[i])[4]);
    else if (ex)
        acc = (ref[3]).method_access(meth);
    else
        acc = 'public;
    if ((i = "w?arnings" in o))
        warn = (ops[i])[4];
    else
        warn = 1;
    
    // now get on with it already
    if (ign)
        line = "Ignoring input until \".\" or \"@abort\"";
    else if (ex)
        line = ((((("Reprogramming " + acc) + " method ") + (ref[3])) + ".") + meth) + "()";
    else
        line = ((((("Programming " + acc) + " method ") + (ref[3])) + ".") + meth) + "()";
    if (fl)
        line += (" [" + (fl.to_english())) + "]";
    code = more ? (more.subrange(2)) : (.read(("-- " + line) + " --"));
    if (type(code) == 'symbol) {
        switch (code) {
            case 'aborted:
                return;
            case 'engaged:
                return "Sorry, you are already reading on this connection.";
            default:
                return "Unknown response from the read parser: " + code;
        }
    }
    if (ign)
        return "Finished ignoring input.";
    if (ed)
        code += [ed];
    catch any {
        if ((errs = (ref[3]).add_method(code, meth)))
            return errs.prefix("** ");
        (> (ref[3]).set_method_flags(meth, fl) <);
        (> (ref[3]).set_method_access(meth, acc) <);
        if ((line = (> $code_lib.verify_code(code, meth, warn) <)))
            .tell(line);
        return ((((("Method " + (ref[3])) + ".") + meth) + "() ") + (ex ? "re" : "")) + "compiled.";
    } with {
        return (traceback()[1])[2];
    }
};

protected method .show_cmd() {
    arg cmdstr, com, args;
    var show, match, i, chop, f, obj, out;
    
    (> .perms(caller(), 'command) <);
    if (((args[1])[1]) == 'object)
        show = ['method, 'variable];
    else if ((args[1])[5])
        show = [(args[1])[1], (args[1])[5]];
    else
        show = [(args[1])[1]];
    if ((i = "c?hop" in ((args[3]).slice(1))))
        chop = ((args[3])[i])[3];
    else
        chop = 1;
    if ((args[1])[4])
        f = (args[1])[4];
    else
        f = .get_setting("match-default", $programmer);
    match = .get_setting("match-with", $programmer);
    obj = (args[1])[3];
    if (type(obj) == 'frob)
        return ["The target object was a frob.  Please use @exam instead."];
    .tell([((("Object:  " + obj) + " [") + ((obj.size()).to_english())) + " bytes]", "Parents: " + ((obj.parents()).join(", "))]);
    if ('method in show) {
        if (!(obj.has_flag('methods, this())))
            .tell("  ** No permission to list methods **");
        else
            .tell(._show__methods(obj, f, match, chop));
    }
    if ('variable in show) {
        if (!(obj.has_flag('variables, this())))
            .tell("  ** No permission to show variables **");
        else
            .tell(._show__variables(obj, f, match, chop));
    }
    .tell("---");
};

public method .spawn_cmd() {
    arg cmdstr, cmd, args;
    var match, name, parents, p, line, set, nprog, new, t;
    
    (> .perms(caller(), 'command) <);
    if ((match = match_template(args, "* named *"))) {
        name = match[3];
        args = explode(match[1]);
    } else {
        args = args.explode_quoted();
        if (!args)
            return "Spawn from nothing?";
        name = "";
    }
    
    // programmers get additional privs
    nprog = !(.is($programmer));
    parents = [];
    for p in (args) {
        catch any {
            p = (> .match_env_nice(p) <);
        } with {
            .tell((traceback()[1])[2]);
            continue;
        }
        if ((!(p.is($thing))) && nprog) {
            .tell((p.namef('ref)) + " is not a VR object, you may only spawn VR objects.");
            continue;
        }
        if (!(p.has_flag('fertile))) {
            .tell((p.namef('ref)) + " is not a fertile object.");
            continue;
        }
        parents += [p];
    }
    parents = parents.compress();
    if (!parents)
        return "No capable parents.";
    if (name) {
        catch any
            name = (> $code_lib.parse_name(name) <);
        with
            return (traceback()[1])[2];
    }
    
    // spawn from the first parent, add the others
    catch any {
        new = (> (parents[1]).spawn() <);
        (> new.chparents(@parents) <);
    
        // let the user know whats up
        .tell(((("Spawned new object " + (new.namef('ref))) + " from ") + (map p in (parents) to (p.namef('ref)).to_english())) + ".");
        if (new.is($located))
            (> new.move_to(this()) <);
        if (name && ((((name[1])[1])[1]) == "$")) {
            name = (> tosym(((name[1])[1]).subrange(2)) <);
            (> new.set_objname(name) <);
            return ("Object name changed to: " + new) + ".";
        } else if (name) {
            if (!(new.has_ancestor($has_name)))
                return new + " cannot be given a VR name.";
            (> new.set_name(@name[1]) <);
            for t in (name[2])
                (> new.add_name_template(t) <);
            return (((("Renamed " + new) + " to \"") + (new.name())) + "\"") + ((new.name_templates()) ? ((" (" + ((new.name_templates()).to_english())) + ")") : "");
        }
    } with {
        .tell((traceback()[1])[2]);
        if (valid(new)) {
            line = new.namef('xref);
            new.destroy();
            if (valid(new))
                return ("Unable to destroy new object " + line) + ".";
            else
                return ("Sucessfully destroyed new object " + line) + ".";
        }
    }
};

protected method .trace_method_cmd() {
    arg cmdstr, cmd, ref;
    var method, current, trace, syn, minfo, line, anc, len, out, m;
    
    (> .perms(caller(), 'command) <);
    if ((ref[1]) != 'method)
        return toliteral(cmd) + " requires a full method reference.";
    catch any {
        method = (> tosym(ref[4]) <);
        current = (> (ref[2]).find_method(method) <);
        trace = [];
        while (current) {
            trace += [current];
            current = (| (ref[2]).find_next_method(method, current) |);
        }
    } with {
        if (error() == ~symbol)
            return ("Invalid method name \"" + (ref[4])) + "\".";
        return (traceback()[1])[2];
    }
    .tell(((("Method trace of " + (ref[2])) + ".") + (ref[4])) + "():");
    len = .linelen();
    out = [];
    for anc in (trace.reverse()) {
        m = anc.method_info(method);
        out += [strfmt("%5l %4r %l.%l(%l)", $object_lib.parse_method_flags(m[6]), m[4], anc, method, m[1])];
    }
    return out;
};

public method .undefine_setting_cmd() {
    arg cmdstr, cmd, args;
    var name, definer, syn, name, m;
    
    syn = ("Syntax: `" + cmd) + " <definer>:<setting>`";
    if (!(m = regexp(args, "^ *([^:]+):([^ $]+)")))
        return syn;
    [definer, name] = m;
    catch any
        definer = (> .match_environment(definer) <);
    with
        return (traceback()[1])[2];
    if (!name)
        return syn;
    catch any
        (> definer.undefine_setting(name) <);
    with
        return (traceback()[1])[2];
    return ((("Undefined setting " + definer) + ":") + name) + ".";
};

protected method .which_cmd() {
    arg cmdstr, command, str;
    var l, out, d, m, p, c, cache, cmds, cmd, matches, def;
    
    (> .perms(caller(), 'command) <);
    if (!str)
        return ("Syntax: `" + command) + " <partial or full template>`";
    str = str.word(1);
    
    // local commands
    matches = #[];
    for p in ([this()] + (.command_modules())) {
        for def in (p.all_local_commands()) {
            for cmd in (def[2]) {
                for c in ((cmd[1]).explode("|")) {
                    if (str in (c.strip("?"))) {
                        for m in (cmd[2])
                            matches = matches.setadd_elem(m[3], [def[1], m[4], 'local]);
                    }
                }
                refresh();
            }
            refresh();
        }
        refresh();
    }
    
    // remote commands
    cache = #[];
    for cmds in (dict_values($remote_cache.command_cache())) {
        for def in (cmds) {
            if (!dict_contains(cache, def[1])) {
                for c in ((def[1]).explode("|")) {
                    if (str in (c.strip("?"))) {
                        for m in ((def[2]).command_info('remote, def[1]))
                            matches = matches.setadd_elem(m[3], [def[2], m[4], 'remote]);
                    }
                }
                cache = dict_add(cache, def[1], 1);
            }
        }
        refresh();
    }
    
    // return results
    if (!matches)
        return ("No commands found matching the template \"" + str) + "\".";
    l = ((.linelen()) - 2) / 2;
    out = [("Commands matching the template \"" + str) + "\":  (* == remote command)"];
    for c in (matches) {
        cmd = ("\"" + (c[1])) + "\"";
        for def in (c[2]) {
            d = ((def[1]) + ".") + (def[2]);
            if ((def[2]) == 'remote)
                p = "* ";
            else
                p = "  ";
            if (strlen(cmd) > (l - 2))
                out += [p + cmd, "          " + d];
            else
                out += [(p + strfmt("%*l ", l, cmd)) + d];
        }
        refresh();
    }
    return out + ["---"];
};


