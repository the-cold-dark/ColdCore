
new object $uncompiler: $evaluator;

var $root created_on = 837583986;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$uncompiler];
var $root manager = $uncompiler;

public method ._eval_ctext() {
    arg data, vars, @quote_all;
    var out, uflags, token, prev, next, t;
    
    out = [];
    if (type(data) != 'list)
        data = [data];
    prev = 0;
    token = 0;
    for next in (data + [0]) {
        t = token;
        switch (type(token)) {
            case 'integer:
            case 'frob:
                if (class(token) == $generator) {
                    [token, vars] = (> .eval_generator(token, vars) <);
                    out = out.affix(token);
                } else if (class(token) == $format) {
                    [token, vars] = (> .eval_formatter(token, vars) <);
                    out = out.affix(token);
                }
            case 'string:
                token = quote_all ? (.quote_all(token)) : (.quote(token));
                token = ._spaces(token, prev, 'prev);
                token = ._spaces(token, next, 'next);
                out = out.affix(token);
            default:
                out = out.affix(toliteral(token));
        }
        prev = t;
        token = next;
    }
    return [out, vars];
};

public method ._spaces() {
    arg token, other, dir;
    var m, i;
    
    if ((type(other) == 'frob) && ((other.name()) in ($compiler.glue_table()))) {
        if (dir == 'prev) {
            m = ((token.regexp("^ *"))[1]).length();
            return ("".pad(m * 2, "\ ")) + (token.subrange(m + 1));
        } else {
            m = ((token.regexp(" *$"))[1]).length();
            return (token.subrange(1, (token.length()) - m)) + ("".pad(m * 2, "\ "));
        }
    }
    return token;
};

public method .do_br() {
    arg vars, flags, args;
    
    return [["", "{br}"], vars];
};

public method .do_dd() {
    arg vars, flags, args;
    var token;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", "{dd: "].affix(args)).affix("}"), vars];
};

public method .do_detail() {
    arg vars, flags, args;
    
    return .eval_formatter((<$format, ["detail", flags, (| (vars['details])[flags.getkey("name")] |) || ["UNKNOWN"], 'DO_NOT_CALL_THIS]>), vars);
};

public method .do_dfn() {
    arg vars, flags, args;
    var nobound, ind, dfn;
    
    ind = (| flags.getkey("ind") |) || 8;
    nobound = (| flags.getkey("nobound") |);
    dfn = "{dfn";
    if (nobound)
        dfn += " nobound";
    if (ind && (ind != 8))
        dfn += " ind=" + ind;
    [args, vars] = ._eval_ctext(args, vars);
    if (nobound)
        return [(["", ("    " + dfn) + ":"].affix(args)).affix(["}"]), vars];
    return [(["", "", ("    " + dfn) + ":"].affix(args)).affix(["}"]), vars];
};

public method .do_dl() {
    arg vars, flags, args;
    var dl, token;
    
    if ((| flags.getkey("columned") |))
        dl = "{dl columned";
    else
        dl = "{dl";
    if ((| flags.getkey("ind") |))
        dl += " ind=" + (flags.getkey("ind"));
    dl += ":";
    [args, vars] = ._eval_ctext(args, vars);
    return [((["", dl].affix(args.prefix("  "))).affix("}")) + [""], vars];
};

public method .do_dt() {
    arg vars, flags, args;
    var dl, token;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", "{dt: "].affix(args)).affix("}"), vars];
};

public method .do_lh() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", "{lh:"].affix(args)).affix("}"), vars];
};

public method .do_li() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", "{li:"].affix(args)).affix("}"), vars];
};

public method .do_np() {
    arg vars, flags, args;
    
    return [["", "", "{np}"], vars];
};

public method .do_p() {
    arg vars, flags, args;
    
    return [["", "{p}"], vars];
};

public method .do_quote() {
    arg vars, flags, args;
    
    return [(["{quote "].affix((args[1]).explode("\n", 1))).affix("}"), vars];
};

public method .do_subj() {
    arg vars, flags, args;
    var out, word, l;
    
    [args, vars] = ._eval_ctext(args, vars);
    l = toint((| flags.getkey("level") |) || "4");
    return [(["", "", ("{subj level=" + l) + ":"].affix(args)).affix(["}"]), vars];
};

public method .do_switch() {
    arg vars, flags, args;
    var i, j, out, def, ret, val, l, lower, upper, val;
    
    def = [""];
    [val, vars] = ._eval_ctext(flags.getkey("value"), vars);
    out = [""];
    for i in (args) {
        [ret, vars] = ._eval_ctext(i[2], vars);
        if ((i[1]) == 'default) {
            def = ["", "[default]", ""].affix(ret.prefix("  "));
        } else if ((i[1]) == 'ranges) {
            for j in (i[2]) {
                [lower, upper, ret] = j;
                [ret, vars] = ._eval_ctext(ret, vars);
                out = (out.affix(["", ((("[range:" + lower) + "..") + upper) + "]", ""])).affix(ret.prefix("  "));
            }
        } else {
            out = (out.affix(["", ("[case:" + (i[1])) + "]", ""])).affix(ret.prefix("  "));
        }
    }
    return [(((["", "{switch value="].affix(val)).affix(":")).affix((out.affix(def)).prefix("  "))).affix(["}", ""]), vars];
};

public method .do_td() {
    arg vars, flags, args;
    var opts, value;
    
    if ((value = (| toint(flags.getkey("rowspan")) |)))
        opts = " rowspan=" + value;
    else
        opts = "";
    if ((value = (| toint(flags.getkey("colspan")) |)))
        opts += " colspan=" + value;
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", ("  {td" + opts) + ":"].affix(args)).affix("}"), vars];
};

public method .do_th() {
    arg vars, flags, args;
    var opts, value;
    
    if ((value = (| toint(flags.getkey("rowspan")) |)))
        opts = " rowspan=" + value;
    else
        opts = "";
    if ((value = (| toint(flags.getkey("colspan")) |)))
        opts += " colspan=" + value;
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", ("  {th" + opts) + ":"].affix(args)).affix("}"), vars];
};

public method .do_tr() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(["", "{tr:"].affix(args)).affix("}"), vars];
};

public method .do_ul() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [((["", "{ul:"].affix(args.prefix("  "))).affix("}")) + [""], vars];
};

public method .eval_formatter() {
    arg gen, vars;
    var out, flags, key, value, text;
    
    catch ~methodnf {
        return .(gen.method())(vars, gen.ctext_flags(), gen.args());
    } with {
        out = ["{" + (gen.name())];
        flags = gen.ctext_flags();
        for key in (flags) {
            if ((key[2]) == 1) {
                out = out.affix(" " + (key[1]));
            } else {
                [text, vars] = ._eval_ctext(key[2], vars, 1);
                out = (out.affix((" " + (key[1])) + "=")).affix(text);
            }
        }
        if (gen.args()) {
            out = out.affix(":");
            for key in (gen.args()) {
                [text, vars] = ._eval_ctext([key], vars);
                out = out.affix(text);
            }
        }
        out = out.affix("}");
        return [out, vars];
    }
};

public method .eval_generator() {
    arg gen, vars;
    var out, flags, key, value, text;
    
    catch ~methodnf {
        return .(gen.method())(vars, gen.ctext_flags(), gen.args());
    } with {
        out = ["[" + (gen.name())];
        flags = gen.ctext_flags();
        for key in (flags) {
            if ((key[2]) == 1) {
                out = out.affix(" " + (key[1]));
            } else {
                [text, vars] = (> ._eval_ctext([key[2]], vars, 1) <);
                out = (out.affix((" " + (key[1])) + "=")).affix(text);
            }
        }
        if (gen.args()) {
            out = out.affix(":");
            for key in (gen.args()) {
                [text, vars] = (> ._eval_ctext([key], vars) <);
                out = out.affix(text);
            }
        }
        return [out.affix("]"), vars];
    }
};

public method .gen_switch() {
    arg vars, flags, args;
    var i, j, out, def, ret, val, l, lower, upper, val;
    
    def = [""];
    [val, vars] = ._eval_ctext(flags.getkey("value"), vars);
    out = [""];
    for i in (args) {
        [ret, vars] = ._eval_ctext(i[2], vars);
        if ((i[1]) == 'default) {
            def = ["", "[default]", ""].affix(ret.prefix("  "));
        } else if ((i[1]) == 'ranges) {
            for j in (i[2]) {
                [lower, upper, ret] = j;
                [ret, vars] = ._eval_ctext(ret, vars);
                out = (out.affix(["", ((("[range:" + lower) + "..") + upper) + "]", ""])).affix(ret.prefix("  "));
            }
        } else {
            out = (out.affix(["", ("[case:" + (i[1])) + "]", ""])).affix(ret.prefix("  "));
        }
    }
    return [(((["", "[switch value="].affix(val)).affix(":")).affix((out.affix(def)).prefix("  "))).affix(["]", ""]), vars];
};

public method .quote() {
    arg s;
    
    return s.sed("([][{}\])", "\%1", "g");
};

public method .quote_all() {
    arg s;
    
    return s.sed("([][{}\:= ])", "\%1", "g");
};


