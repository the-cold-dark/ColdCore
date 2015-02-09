
new object $command_parser: $user_parsers;

var $root created_on = 796680318;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$command_parser];
var $root manager = $command_parser;

public method ._local() {
    arg user, nmatch, match, obj, template, method, info;
    var x, cmd;
    
    cmd = match[2];
    catch any {
        for x in [1 .. nmatch] {
            if (dict_contains(info, x))
                match = match.replace(x + 2, (> .convert_arg(cmd, (info[x])[1], match[x + 2], user, (info[x])[2], user) <));
        }
    } with {
        if (error() == ~syntax)
            return ['error, (((traceback()[1])[2]) + template) + "\""];
        return ['error, (traceback()[1])[2]];
    }
    return ['command, obj, method, @match];
};

public method ._remote() {
    arg user, nmatch, definer, match, template, method, info;
    var x, value, that, cmd;
    
    cmd = match[2];
    catch any {
        for x in [1 .. nmatch] {
            if (dict_contains(info, x)) {
                if (((info[x])[1]) == 'this) {
                    that = (> user.match_environment(match[x + 2]) <);
                    if (!(that.is(definer)))
                        return ['error, ((("You cannot " + (match[2])) + " ") + (that.name())) + "."];
                    value = that;
                } else {
                    value = (> .convert_arg(cmd, (info[x])[1], match[x + 2], user, ((info[x])[2]) || [definer], user) <);
                }
                match = match.replace(x + 2, value);
            }
        }
    } with {
        if (error() == ~syntax)
            return ['error, (((traceback()[1])[2]) + template) + "\""];
        return ['error, (traceback()[1])[2]];
    }
    if (!that)
        return ['error, "An error was encountered: no target object found."];
    return ['command, that, method, @match];
};

public method .complete() {
    arg cmd, user, obj, match, info;
    var x, method, parsed;
    
    method = info[2];
    info = info[4];
    parsed = info.keys();
    for x in [1 .. match.length()] {
        if (x in parsed)
            match = match.replace(x, (> $command_lib.convert_arg((info[x])[1], match[x], user, ((info[x])[2]) ? ((info[x])[2]) : user, user) <));
    }
    return [user, method, (cmd.explode())[1], @match];
};

public method .convert_arg() {
    arg cmd, type, str, me, argargs, target;
    var obj, args, anc, out, x, y, list;
    
    switch (type) {
        case 'list:
            out = [];
            if (!str)
                return [(> .convert_arg(cmd, argargs[1], "", me, argargs[2], target) <)];
    
            // or do the whole list
            if ("," in str)
                list = str.explode_english_list(",");
            else
                list = explode(str);
            for x in (list) {
                catch ~ambig {
                    out = out.setadd(.convert_arg(cmd, argargs[1], x, me, argargs[2], target));
                } with {
                    if ((| (traceback()[1])[3] |) && (!((argargs[1]) in ['user, 'user_opt]))) {
                        for y in ((traceback()[1])[3])
                            out = out.setadd((> .convert_arg(cmd, argargs[1], tostr(y), me, argargs[2], target) <));
                    } else {
                        rethrow(error());
                    }
                }
            }
            return out;
        case 'any:
            return str;
        case 'any_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            return args;
        case 'object:
            return (> me.match_environment(str) <);
        case 'object_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            if (!(args[1]))
                throw(~syntax, "No reference specified for command \"");
            obj = (> me.match_environment((args[1])[1]) <);
            return [obj, delete(args[1], 1), args[2]];
        case 'objref:
            return (> $parse_lib.ref(str, me) <);
        case 'objref_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            if (!(args[1]))
                throw(~syntax, "No reference specified for command \"");
            obj = (> $parse_lib.ref((args[1])[1], me) <);
            return [obj, delete(args[1], 1), args[2]];
        case 'user:
            if (!str)
                throw(~match, "No user specified.");
            if (str == "me")
                return me;
            return (| $user_db.search(str) |) || throw(~match, ("Unable to find user " + str) + ".");
        case 'user_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            if (!(args[1]))
                throw(~syntax, "Nobody specified for command \"");
            if (str == "me")
                return me;
            return [(> $user_db.search((args[1])[1]) <), args[2]];
        case 'number:
            return (> str.to_number() <);
        case 'number_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            if (!(args[1]))
                throw(~syntax, "No number specified for command \"");
            return [(> str.to_number() <), args[2]];
        case 'descendant:
            obj = (> me.match_environment(str) <);
            anc = argargs ? (argargs[1]) : user;
            if (!(obj.has_ancestor(anc)))
                throw(~parse, strfmt("You cannot %s %s because it is not %s!", cmd, obj.name(), anc.name()));
            return obj;
        case 'descendant_opt:
            args = (> $parse_lib.opt(str, @argargs) <);
            if (!(args[1]))
                throw(~syntax, "No descendant specified for command \"");
            obj = (> me.match_environment((args[1])[1]) <);
            anc = argargs ? (argargs[1]) : user;
            if (!(obj.has_ancestor(anc)))
                throw(~parse, strfmt("You cannot %s %s because it is not %s!", cmd, obj.name(), anc.name()));
            return [obj, args[2]];
        default:
            throw(~ack, ("Support for the type '" + type) + " is incomplete!");
    }
};

public method .grasp_for_remote_command() {
    arg str, cmd, args;
    var reg, obj, cdef, match, matched, info;
    
    reg = args.match_regexp("[$#][a-z_0-9][a-z_0-9]*");
    if (!reg)
        return 0;
    obj = (| $object_lib.to_dbref(args.subrange(@reg[1])) |);
    if (!obj)
        return 0;
    info = (| obj.get_command_info('remote, cmd) |);
    if (!info)
        return 0;
    matched = [];
    for cdef in (info) {
        match = args.match_template(cdef[2]);
        if (match != 0)
            matched += [[match.length(), obj, [str, cmd, @match], @cdef.subrange(3)]];
    }
    if (matched) {
        matched = matched.sort(matched.slice(1));
        return ['remote, matched];
    }
    return ['partial, [[str, cmd], info.slice(3)]];
};

public method .handle_error() {
    arg traceback;
    
    return (traceback[1])[2];
};

public method .local() {
    arg user, @matches;
    var parsed, match, out;
    
    parsed = [];
    out = [];
    for match in (matches) {
        match = ._local(user, @match);
        if ((match[1]) == 'command)
            out += [match];
        else
            parsed = [match[2]] + parsed;
    }
    if (listlen(out) == 1)
        return out[1];
    if (listlen(out) > 1) {
        out = [("Sorry, \"" + (((matches[1])[2])[1])) + "\" could match any of:"];
        for match in (matches)
            out += [(("    \"" + (match[4])) + "\" on ") + ((match[3]).namef('ref))];
        return ['error, out];
    }
    return ['error, parsed.compress()];
};

public method .parse() {
    arg u, str, next_parser, @other_parsers;
    var l, cmd, c, p, obj, exits;
    
    cmd = str.explode();
    if (cmd) {
        cmd = [str, cmd[1], ((cmd.subrange(2)).join()) || ""];
        p = [];
        if ((c = u.match_shortcut(@cmd))) {
            if ((c[1]) == 'shortcut)
                return .shortcut(u, @c[2]);
            p = c[2];
        }
        if ((c = u.match_command(@cmd))) {
            if ((c[1]) == 'command)
                return .local(u, @c[2]);
            p += c[2];
        }
        l = u.location();
        if ((c = (| l.match_shortcut(@cmd) |))) {
            if ((c[1]) == 'shortcut)
                return .shortcut(l, @c[2]);
            p += c[2];
        }
        if ((c = (| l.match_command(@cmd) |))) {
            if ((c[1]) == 'command)
                return .local(l, @c[2]);
            p += c[2];
        }
        if ((c = $remote_cache.match_remote_command(@cmd))) {
            if ((c[1]) == 'remote)
                return .remote(u, @c[2]);
            p += c[2];
        }
        if ((exits = (| (u.location()).exits() |) || [])) {
            catch any {
                obj = exits.match_object(str);
                return ['command, obj, 'invoke];
            } with {
                if (error() == ~ambig) {
                    exits = (traceback()[1])[3];
                    return ['error, ((("\"" + str) + "\" can match ") + ((exits.mmap('namef, 'ref)).to_english("", " or "))) + "."];
                }
            }
        }
        if (p)
            return .partial(u, cmd, p);
    }
    return next_parser.parse(u, str, @other_parsers);
};

public method .partial() {
    arg user, args, templates;
    var part, line;
    
    for part in (templates)
        templates = templates.replace(part in templates, toliteral(part));
    if ((templates.length()) == 1)
        line = toliteral(args[2]) + " could match ";
    else if ((templates.length()) == 2)
        line = toliteral(args[2]) + " could match either ";
    else
        line = toliteral(args[2]) + " could match any of ";
    return ['error, (line + (templates.to_english("", " or "))) + "."];
};

public method .remote() {
    arg user, @matches;
    var parsed, match;
    
    parsed = [];
    for match in (matches) {
        match = ._remote(user, @match);
        if ((match[1]) == 'command)
            return match;
        parsed = [match[2]] + parsed;
    }
    return ['error, parsed.compress()];
};

public method .shortcut() {
    arg user, method, parsed;
    
    return ['command, user, method, @parsed];
};


