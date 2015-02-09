
new object $command_lib: $libraries;

var $command_lib arg_types = ["this", "any", "any:*", "object", "object:*", "user", "user:*", "descendant of *", "descendant of *:*", "number", "number:*", "objref", "objref:*"];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$command_lib];
var $root manager = $command_lib;

public method ._parse_option_templates() {
    arg opt;
    var reg, out;
    
    out = [];
    opt = strsed(opt, "^ *", "");
    while (opt) {
        if ((reg = regexp(opt, "^[\+-]([^= ]*)=([^ ]+) *(.*)"))) {
            opt = reg[3];
            out += delete(reg, 3);
        } else if ((reg = regexp(opt, "^[\+-]([^ ]+) *(.*)"))) {
            opt = reg[2];
            out += [reg[1]];
        } else {
            throw(~invopt, "Option templates must begin with '+' or '-'");
        }
        opt = strsed(opt, "^ *", "");
    }
    return out;
};

public method .arg_types() {
    return arg_types;
};

public method .break_cards() {
    arg str;
    var card, reg, i, x, cards, out, s;
    
    out = (cards = []);
    while ((reg = match_regexp(str, "(%[0-9]+)"))) {
        if (((reg[2])[1]) != 1)
            out += [@.break_wildcards(str.subrange(1, ((reg[2])[1]) - 1))];
        card = substr(str, @reg[2]);
        str = substr(str, (reg[2]).sum());
        if (!((card[2]).is_numeric()))
            throw(~invcard, "Argument cards must be numeric.");
        card = toint(substr(card, 2));
        cards += [card];
        out += [card];
    }
    if (str)
        out += [str];
    return [out, cards];
};

public method .break_wildcards() {
    arg str;
    var out, i, s;
    
    out = [];
    while ((i = "*" in str)) {
        out += [substr(str, 1, i - 1), ""];
        str = str.subrange(i + 1);
    }
    if (str)
        out += [str];
    return out;
};

public method .format_commands_long() {
    arg cmds, type, clen;
    var def, name, c, cdef, line, o, cs, dname;
    
    o = [];
    for def in (cmds.keys()) {
        o += [((type + " commands on ") + (def.name())) + ":"];
        for cdef in (cmds[def]) {
            for c in (cdef[2])
                o += [((("  " + (toliteral(c[3]).left(clen))) + ".") + tostr(c[4])) + "()"];
        }
    }
    return o;
};

public method .format_commands_short() {
    arg cmds, type, len;
    var def, name, c, cdef, line, o, cs, dname;
    
    o = [];
    for def in (cmds.keys()) {
        o += [((type + " commands on ") + (def.name())) + ":"];
        cs = [];
        for cdef in (cmds[def]) {
            for c in (cdef[2])
                cs += [("\"" + (c[3])) + "\""];
        }
        o += ((cs.sort()).lcolumnize(len - 2, " ")).prefix("  ");
    }
    return o;
};

public method .format_relation() {
    arg relation;
    var x, str;
    
    str = "";
    for x in (relation) {
        if (type(x) == 'integer)
            str = (str + "%") + tostr(x);
        else
            str += x;
    }
    return str;
};

public method .get_argument_type() {
    arg type;
    var a, m, opts, o, result, is_list;
    
    o = $object_lib;
    is_list = 0;
    if ((m = type.match_template("list *"))) {
        type = m[2];
        is_list = 1;
    }
    for a in (arg_types) {
        m = match_pattern(type, a);
        if (type(m) == 'list) {
            switch (a) {
                case "descendant of *":
                    result = ['descendant, [(> o.to_dbref(m[1]) <)]];
                case "descendant of *:*":
                    opts = ._parse_option_templates(m[2]);
                    result = ['descendant, [(> o.to_dbref(m[1]) <)] + opts];
                case "number:*", "objref:*", "any:*", "object:*", "user:*":
                    opts = ._parse_option_templates(m[1]);
                    result = [tosym(((a.explode(":"))[1]) + "_opt"), opts];
                default:
                    result = [tosym(a), []];
            }
            return is_list ? ['list, result] : result;
        }
    }
    throw(~command, ("Invalid argument type \"" + type) + "\"");
};

public method .handle_shortcut_fields() {
    arg subs, fields;
    var subbed_list, elem;
    
    subbed_list = [];
    for elem in (subs) {
        if (type(elem) == 'string)
            subbed_list += [elem];
        else if (type(elem) == 'integer)
            subbed_list += [(> fields[elem] <)];
        else
            throw(~type, "Substitution element is of wrong type.");
    }
    return subbed_list;
};

public method .parse_relation() {
    arg left, right;
    var x, str, out, cards, last;
    
    left = .break_cards(left);
    right = .break_cards(right);
    if (((left[2]).length()) != ((right[2]).length()))
        throw(~invrel, "Left side cards differ from the right side.");
    str = "";
    for x in (left[1]) {
        if (type(x) == 'string)
            str += x;
        else if (str && ((str[strlen(str)]) == "*"))
            str += " *";
        else
            str += "*";
    }
    
    // and now for some sanity...
    cards = #[];
    for x in (left[2]) {
        if (x != (last + 1))
            throw(~invcard, ((("Left side cards are not in sequence (%" + x) + " before %") + (x - 1)) + ").");
        last = x;
        cards = dict_add(cards, x, 1);
    }
    
    // move to the right side
    out = [str, @left];
    str = "";
    for x in (right[1]) {
        if (type(x) == 'string)
            str += x;
        else
            str += "*";
    }
    
    // final sanity check...
    for x in (right[2]) {
        if (!dict_contains(cards, x))
            throw(~invcard, ("Card %" + x) + " does not exist on the left side!");
    }
    
    // good...
    return [out, [str, @right]];
};

public method .recard_shortcut() {
    arg short;
    var x, part;
    
    part = 1;
    while ((x = stridx(short, "*"))) {
        short = ((substr(short, 1, x - 1) + "%") + part) + substr(short, x + 1);
        part++;
    }
    return short;
};

public method .unparse_shortcut() {
    arg s;
    var part, line, short, method, args, x;
    
    line = "";
    [short, [method, args]] = s;
    for part in (args) {
        if (type(part) == 'string)
            line += part;
        else
            line += "%" + part;
    }
    short = .recard_shortcut(short);
    return ((((("\"" + short) + "\"").left(10)) + " => \"") + line) + "\"";
};

public method .unparse_shortcut_full() {
    arg s;
    var part, out, short, method, args;
    
    [short, [method, args]] = s;
    out = "";
    for part in (args) {
        if (type(part) == 'string)
            out += ((out ? ", \"" : "\"") + part) + "\"";
        else
            out += ((out ? ", " : "") + "%") + part;
    }
    out = ((("." + method) + "(") + out) + ")";
    short = .recard_shortcut(short);
    return (((("\"" + short) + "\"").left(10)) + " => ") + out;
};

public method .validate_command_template() {
    arg str;
    var cmd, tmp, loc, types, part, relations;
    
    [tmp, types] = str.explode_delimited("<", ">");
    loc = [];
    cmd = [];
    relations = #[];
    for part in (tmp) {
        if (type(part) == 'string)
            cmd += part.explode();
        else
            cmd += [part];
    }
    
    // clean
    for part in [1 .. cmd.length()] {
        if (type(cmd[part]) == 'string) {
            cmd = cmd.replace(part, (cmd[part]).trim());
        } else {
            relations = relations.add(part - 1, (> .get_argument_type(types[cmd[part]]) <));
            cmd = cmd.replace(part, "*");
        }
    }
    cmd = [cmd[1], (cmd.subrange(2)).join()];
    if ((| "* *" in (cmd[2]) |))
        throw(~parse, "Invalid template: two args cannot be next to each other (<> <>)");
    return [cmd, relations];
};


