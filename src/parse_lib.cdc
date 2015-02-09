
new object $parse_lib: $libraries;

var $parse_lib boolean_strs = [["yes", "true", "1", "on"], ["no", "false", "0", "off"]];
var $parse_lib ordinal = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eight", "ninth", "tenth"];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$parse_lib];
var $root manager = $parse_lib;

public method ._html_traceback() {
    arg type, what, @more;
    var line;
    
    switch (type) {
        case 'function:
            return ("function <tt>" + what) + "()</tt>";
        case 'opcode:
            return ("operator <tt>" + what) + "</tt>";
        default:
            line = (((((((((("method <tt><a href=\"/bin/display?target=" + (more[2])) + "\">") + (more[2])) + "</a>.<a href=\"/bin/method?target=") + (more[2])) + ".") + tostr(what)) + "&linenumbers=yes\">") + tostr(what)) + "</a>") + "()</tt>";
            if ((more[1]) != (more[2]))
                line += (((" (<a href=\"/bin/display?target=" + (more[1])) + "\">") + (more[1])) + "</a>)";
            line = (line + " line ") + (more[3]);
            return line;
    }
};

public method ._range() {
    arg str;
    
    if (str.is_numeric()) {
        return toint(str);
    } else {
        switch (str) {
            case "$", "last", "end":
                return 'end;
            case ".", "here":
                return 'current;
            case "^", "start":
                return 'start;
            default:
                throw(~range, "Invalid range reference.");
        }
    }
};

public method ._traceback() {
    arg what, @more;
    var line;
    
    if (more) {
        if ((more[1]) == (more[2]))
            return ((((more[1]) + ".") + what) + "() line ") + (more[3]);
        else
            return ((((((more[1]) + "<") + (more[2])) + ">.") + what) + "() line ") + (more[3]);
    } else {
        return what;
    }
};

public method .ask() {
    arg question, @rx;
    var ans, def;
    
    [(rx ?= "(yes|y)"), (def ?= "")] = rx;
    ans = (> (sender().prompt(question)).trim() <);
    ans ?= def;
    if (ans == "@abort")
        throw(~stop, "** Aborted **");
    return match_regexp(ans, rx);
};

public method .buildref() {
    arg type, obj, def, name, @ignore;
    var line;
    
    line = tostr(obj);
    if (obj != def)
        line += ("<" + def) + ">";
    if (type == 'object)
        return line;
    if (type == 'method)
        return ((line + ".") + tostr(name)) + "()";
    if (type == 'variable)
        return (line + ",") + tostr(name);
};

public method .filter_ctext() {
    arg what, @defaults;
    var dic, output, prop, eff, ctext;
    
    dic = #[['receiver, sender()], ['time, 'post], ['formatter, $plain_format]];
    if (defaults && (type(defaults[1]) == 'dictionary))
        dic = dict_union(dic, defaults[1]);
    switch (class(what)) {
        case $ctext_frob:
            output = (what.set_vars(dic)).format();
        case $message_frob:
            output = what.format(dic);
        case $filtered_frob:
            if ((prop = (| sender().default_propagator() |)))
                what = what.propagate(prop);
            if (!what) {
                output = `[];
            } else {
                ctext = (what.message()).to_ctext(dic);
                for eff in (what.effects()) {
                    if (type(eff) == 'string)
                        ctext = ($ctext_frob.new_with([eff + " "], ctext.vars())).append(ctext);
                    else
                        ctext = $propagator_effects.(eff[1])(ctext, dic, eff.subrange(2));
                }
                ctext = ctext.set_vars(what.sensory());
                output = ctext.format();
            }
        default:
            output = what;
    }
    return output;
};

public method .getopt() {
    arg line, @defaults;
    var out, newlist, part, v, opt, t, keys, key, x;
    
    // submit: [["template", value], [...]];
    // => if value is 1, it will take the next part of the string
    // receive: [["template", "flag", bool, value]], [...]]; 
    line = line.explode_quoted();
    out = [];
    newlist = [];
    [(defaults ?= [])] = defaults;
    while (line) {
        [x, @line] = line;
        if (x && ((x[1]) in ["-", "+"])) {
            opt = 0;
            v = "";
            part = x.subrange(2);
            if ("=" in part) {
                part = part.explode("=", 1);
                [part, v] = part;
            }
            for t in (defaults) {
                if (part.match_template(t[1])) {
                    opt = [t[1], part, (x[1]) == "+"];
                    if ((| t[2] |) && ((!v) && line)) {
                        [v, @line] = line;
                        if (v == "=")
                            [(v ?= ""), @line] = line;
                    }
                    opt += [v];
                }
            }
            if (!opt)
                opt = [0, part, (x[1]) == "+", ""];
            out += [opt];
        } else {
            newlist += [x];
        }
    }
    return [newlist, out];
};

public method .html_traceback() {
    arg t, status;
    var line, out, x;
    
    out = ("<h2>" + (((t[1])[2]).to_html())) + "</h2>";
    out += ("<i><b>Thrown by " + (._html_traceback(@t[2]))) + "</b></i><p>";
    for x in [3 .. listlen(t)]
        out += ((("<code><i>" + ((t[x])[1])) + "</i>: ") + (._html_traceback(@t[x]))) + "</code><br>";
    return $http.response(status, out + "</p>");
};

public method .object_match() {
    arg name, @who;
    var msg;
    
    // .object_match("name"[, who])
    // -> 0        name was the empty string
    // -> ~objnf   nothing matched name
    // -> ~ambig   more than one object matched name
    // Attempt to match an object name with who.match_environment().  If one
    // is found, return it.  Else, print a message and return one of the above
    // false values.
    // 'who' defaults to sender().
    who = who ? (who[1]) : sender();
    if (!name) {
        (| who.tell("You must give the name of something.") |);
        return 0;
    }
    catch ~objnf, ~ambig {
        return who.match_environment(name);
    } with {
        switch (error()) {
            case ~objnf:
                msg = ("I don't see any \"" + name) + "\" here.";
            case ~ambig:
                msg = ("I don't know which \"" + name) + "\" you mean.";
        }
        (| who.tell(msg) |);
        return error();
    }
};

public method .opt() {
    arg line, @defs;
    var out, a, l, x, m, args, opts, o, i, v;
    
    // submit: ["template", "template"..]
    // => if value is 1, it will take the next part of the string
    // receive: [["template", "flag", bool, value]], [...]];
    opts = (args = []);
    line = line.explode_quoted();
    l = listlen(line);
    x = 1;
    while (x <= l) {
        a = line[x];
        if ((m = regexp(a, "^[+-]"))) {
            o = (m[1]) == "+";
            v = "";
            a = substr(a, 2).trim();
            if (!a)
                throw(~stop, ("Missing option flag following '" + (o ? "+" : "-")) + "'");
            if ((i = "=" in a)) {
                if ((i == strlen(a)) && (listlen(line) > x)) {
                    v = line[++x];
                    a = substr(a, 1, strlen(a) - 1).trim();
                } else {
                    [a, v] = explode(a, "=", 1);
                }
            }
            if ((i = find m in (defs) where (match_template(a, m))))
                opts += [[defs[i], a, o, v]];
            else
                opts += [[0, a, o, v]];
        } else {
            args += [a];
        }
        x++;
    }
    return [args, opts];
};

public method .ordinal() {
    return ordinal;
};

public method .ordinal_reference() {
    arg str;
    var rx, num;
    
    if (!(rx = regexp(str, "^ *(first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|1st|2nd|3rd|[456789]th|10th) *(.*)$")))
        return 0;
    num = toint(rx[1]) || ((rx[1]) in ordinal);
    return [rx[2], num];
    
    // Original code from LamdaMOO, Author Unknown
};

public method .parse_method_access() {
    arg str;
    var t;
    
    for t in (["pub?lic", "pro?tected", "pri?vate", "r?oot", "dr?iver", "f?rob"]) {
        if (match_template(str, t))
            return tosym(t.strip("?"));
    }
    return 'public;
};

public method .parse_method_flags() {
    arg flags;
    var t, out, flag;
    
    out = [];
    for flag in (flags.explode(",")) {
        for t in (["no?override", "l?ocked", "f?orked", "na?tive"]) {
            if (match_template(flag, t))
                out += [tosym(t.strip("?"))];
        }
    }
    return out;
};

public method .possessive_reference() {
    arg str;
    var rx;
    
    if ((rx = regexp(str, "^my$|^my +(.+)?"))) {
        return ["me", (| rx[1] |) || ""];
    } else if ((rx = regexp(str, "^([^ ]+'s|[^ ]+s') *(.+)?"))) {
        if (listlen(rx) == 1)
            return 0;
        return [substr(rx[1], 1, strlen(rx[1]) - 2), rx[2]];
    }
    return 0;
};

public method .range() {
    arg str;
    var out;
    
    out = split(str, " *- *");
    if ((out.length()) == 1) {
        if ("," in str)
            return ['specific, str];
        out = [(> ._range(str) <), 'single];
    } else if ((out.length()) == 2) {
        out = out.replace(1, (> ._range(out[1]) <));
        out = out.replace(2, (> ._range(out[2]) <));
    } else {
        throw(~range, "Invalid range reference.");
    }
    return out;
};

public method .ref() {
    arg str, @args;
    var def, me, obj, reg, member, match, type, second;
    
    [(me ?= sender())] = args;
    if ((args.length()) > 1)
        match = args[2];
    else
        match = [me, 'match_environment, []];
    if (str == ".") {
        obj = (> (match[1]).(match[2])(".") <);
        return ['object, obj, obj, 0, 0];
    }
    if ((reg = regexp(str, "^(.*)<([^>]*)>(.*)$"))) {
        def = (> (match[1]).(match[2])(reg[2], @match[3]) <);
        str = (reg[1]) + (reg[3]);
    }
    if ((reg = regexp(str, "([^\.,]*)([\.,]+)([^\( ]*)"))) {
        obj = reg[1];
        member = reg[3];
        type = reg[2];
        if (((type.length()) > 1) && (((type[1]) == ".") && (!obj))) {
            type = type.subrange(2);
            obj = (> (match[1]).(match[2])(".") <);
        } else {
            obj = obj ? (> (match[1]).(match[2])(obj, @match[3]) <) : me;
        }
        if ("." in type) {
            if ("," in type)
                second = 'variable;
            type = 'method;
        } else {
            type = 'variable;
        }
    } else {
        obj = (> (match[1]).(match[2])(str, @match[3]) <);
        type = 'object;
    }
    return [type, obj, def || obj, member, second];
};

public method .traceback() {
    arg traceback, @args;
    var line, out, pre, lines, cur, x, error;
    
    // $parse_lib.traceback(traceback(), lines, pre);
    // -1 lines represents the full error
    // pre is set to "! " unless otherwise specified.
    [(lines ?= -1), (pre ?= "! "), (error ?= 0)] = args;
    out = [(pre + "=> ") + ((traceback[1])[2])];
    pre += "   ";
    
    // The primary error
    if (error == 0)
        out += [(pre + "Thrown by ") + (._traceback(@(traceback[2]).subrange(2)))];
    else
        out += [(((pre + "Error ") + error) + " caused by ") + (._traceback(@(traceback[2]).subrange(2)))];
    
    // The rest of it
    for x in [1 .. (traceback.length()) - 2] {
        if ((x <= lines) || (lines == (-1))) {
            line = ((traceback[x + 2])[1]) + ": ";
            line += ._traceback(@(traceback[x + 2]).subrange(2));
            out += [pre + line];
        }
    }
    if (user())
        user().set_last_traceback([time(), traceback, out]);
    return out;
};


