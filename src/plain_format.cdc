
new object $plain_format: $formatter;

var $root created_on = 837583858;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$plain_format];
var $root manager = $plain_format;

public method .do_anchor() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args[1], vars);
    return [("/" + args) + "/", vars];
};

public method .do_b() {
    arg vars, flags, args;
    var out, a;
    
    return ._eval_ctext(args, vars);
};

public method .do_br() {
    arg vars, flags, args;
    
    return ["\n", vars];
};

public method .do_columnize() {
    arg vars, flags, args;
    var cols;
    
    cols = (| flags.getkey("cols") |) || "*";
    [args, vars] = ._eval_ctext(args, vars);
    return [[(cols == "*") ? (args.lcolumnize()) : (args.columnize(toint(cols)))], vars];
};

public method .do_dd() {
    arg vars, flags, args;
    
    return .eval_indented(args, vars, (| vars['dl_ind] |) || 4);
};

public method .do_detail() {
    arg vars, flags, args;
    
    return [("[" + (flags.getkey("name"))) + "]", vars];
};

public method .do_dfn() {
    arg vars, flags, args;
    var ind, nobound;
    
    ind = toint((| flags.getkey("ind") |) || 8);
    nobound = (| flags.getkey("nobound") |);
    vars = vars.add('header, "");
    [args, vars] = .eval_indented(args, vars, ind);
    if (nobound)
        return ["\n" + args, vars];
    return [("\n" + args) + "\n", vars];
};

public method .do_dl() {
    arg vars, flags, args;
    var out, token, c, cm, ind, mem;
    
    c = (| vars['columned] |) || 0;
    cm = (| flags.getkey("columned") |) || 0;
    ind = (| toint(flags.getkey("ind")) |) || 4;
    vars = vars.add('columned, cm);
    if (dict_contains(vars, 'dl_ind))
        mem = vars['dl_ind];
    vars = dict_add(vars, 'dl_ind, ind);
    [args, vars] = ._eval_ctext(args, vars);
    if (mem)
        vars = dict_add(vars, 'dl_ind, mem);
    else
        vars = dict_del(vars, 'dl_ind);
    if (c)
        vars = vars.add('columned, c);
    else if (vars.contains('columned))
        vars = vars.del('columned);
    return [args + "\n", vars];
};

public method .do_dt() {
    arg vars, flags, args;
    
    vars = vars.add('header, "");
    [args, vars] = ._eval_ctext(args, vars);
    if ((| vars['columned] |))
        return ["\n  ", vars.add('header, pad("  " + args, 25))];
    else
        return [("\n  " + args) + "\n", vars.add('header, "")];
};

public method .do_em() {
    arg vars, flags, args;
    var out, a;
    
    return ._eval_ctext(args, vars);
};

public method .do_hr() {
    arg vars, flags, args;
    
    if ((| flags.getkey("sep") |))
        return ["---\n", vars];
    return [pad("\n", vars['width], "-") + "\n", vars];
};

public method .do_i() {
    arg vars, flags, args;
    var out, a;
    
    return ._eval_ctext(args, vars);
};

public method .do_img() {
    arg vars, flags, args;
    var alt;
    
    alt = (| flags.getkey("plain") |) || "";
    return [alt, vars];
};

public method .do_lh() {
    arg vars, flags, args;
    var line, oheader;
    
    oheader = (| vars['header] |);
    vars = dict_add(vars, 'header, "");
    [args, vars] = .eval_indented(args, vars, 2);
    if (oheader == ~keynf)
        vars = dict_del(vars, 'header);
    else
        vars = dict_add(vars, 'header, oheader);
    return [args + "\n", vars];
};

public method .do_li() {
    arg vars, flags, args;
    var line, type, num, depth, oheader;
    
    type = (| vars['list_type] |) || 'plain;
    depth = (| vars['list_depth] |) || 1;
    oheader = (| vars['header] |);
    if (type == 'plain) {
        if (depth % 2)
            vars = dict_add(vars, 'header, "* ");
        else
            vars = dict_add(vars, 'header, "+ ");
    } else {
        num = (vars['list_last]) + 1;
        vars = dict_add(vars, 'header, num + ") ");
        vars = dict_add(vars, 'list_last, num);
    }
    depth *= 2;
    [args, vars] = .eval_indented(args, vars, depth);
    if (oheader == ~keynf)
        vars = dict_del(vars, 'header);
    else
        vars = dict_add(vars, 'header, oheader);
    return ["\n" + args, vars];
};

public method .do_link() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args[1], vars);
    return [("[" + args) + "]", vars];
};

public method .do_np() {
    arg vars, flags, args;
    
    return ["\n\n", vars];
};

public method .do_ol() {
    arg vars, flags, args;
    var out, token, old, last, depth;
    
    if (dict_contains(vars, 'list_type)) {
        old = vars['list_type];
        if (old == 'ordinal)
            last = vars['list_last];
        else
            last = -1;
        vars = dict_add(vars, 'list_depth, (vars['list_depth]) + 1);
    } else {
        vars = dict_add(vars, 'list_depth, 1);
    }
    vars = dict_add(vars, 'list_type, 'ordinal);
    vars = dict_add(vars, 'list_last, 0);
    [args, vars] = ._eval_ctext(args, vars);
    if (old) {
        vars = dict_add(vars, 'list_type, old);
        if ((old == 'ordinal) && (last != (-1)))
            vars = dict_add(vars, 'list_last, last);
        vars = dict_add(vars, 'list_depth, (vars['list_depth]) - 1);
    } else {
        vars = dict_del(vars, 'list_type);
        if (dict_contains(vars, 'list_last))
            vars = dict_del(vars, 'list_last);
        vars = dict_del(vars, 'list_depth);
    }
    return [args, vars];
};

public method .do_p() {
    arg vars, flags, args;
    
    return ["\n", vars];
};

public method .do_quote() {
    arg vars, flags, args;
    
    return [args[1], vars];
};

public method .do_subj() {
    arg vars, flags, args;
    var out, word, l, len;
    
    [out, vars] = ._eval_ctext(args, vars);
    len = vars['width];
    switch (toint((| flags.getkey("level") |) || "4")) {
        case 1:
            out = ((("\n\n" + out) + "\n") + ("".pad(strlen(out), "="))) + "\n";
        case 2:
            out = ((("\n\n" + out) + "\n") + ("".pad(strlen(out), "-"))) + "\n";
        case 3:
            out = ("\n\n" + out) + "\n";
        default:
            out = ("\n" + out) + "\n";
    }
    return [out, vars];
};

public method .do_table() {
    arg vars, flags, args;
    var tblinfo, i, ntbinfo, info, width, l, lr, lc, inds, ind, cwidth;
    
    tblinfo = (| vars['table_info] |) || 0;
    width = vars['width];
    if (!(| (ntbinfo = flags.getkey("cols")) |))
        throw(~flags, "Need column information.");
    ind = (| abs(toint(flags.getkey("ind"))) |) || 0;
    info = [];
    cwidth = width - ind;
    if ("%" in ntbinfo) {
        for i in (ntbinfo.explode(","))
            info += [toint(cwidth * (toint(i) / 100.0))];
    } else {
        for i in (ntbinfo.explode(","))
            info += [toint(i)];
    }
    vars = dict_union(vars, #[['table_info, [info, 0]], ['rinfo, $list.make(info.length(), 0)], ['rcont, $list.make(info.length(), [])]]);
    [args, vars] = ._eval_ctext(args, vars);
    vars = tblinfo ? (vars.add('table_info, tblinfo)) : (vars.del('table_info));
    vars = vars.add('width, width);
    return ["\n" + args, vars];
};

public method .do_td() {
    arg vars, flags, args;
    var tblinfo, rinfo, col, cols, rows, w, n, max;
    
    rows = (| toint(flags.getkey("rowspan")) |) || 1;
    cols = (| toint(flags.getkey("colspan")) |) || 1;
    rinfo = vars['rinfo];
    tblinfo = vars['table_info];
    col = (tblinfo[2]) + 1;
    n = [];
    max = listlen(tblinfo[1]);
    while (rinfo[col]) {
        col++;
        n += [[0, (tblinfo[1])[col], []]];
    }
    w = ((tblinfo[1]).subrange(col, cols)).sum();
    tblinfo = tblinfo.replace(2, (col + cols) - 1);
    vars = (vars.add('table_info, tblinfo)).add('header, "");
    [args, vars] = .eval_indented(args, vars, 0, w);
    return [(n + [[rows, w, args.explode("\n", 1)]]) + ($list.make(cols - 1, [rows, 0, []])), vars];
};

public method .do_th() {
    arg vars, flags, args;
    var tblinfo, rinfo, col, cols, rows, w, n, max;
    
    rows = (| toint(flags.getkey("rowspan")) |) || 1;
    cols = (| toint(flags.getkey("colspan")) |) || 1;
    rinfo = vars['rinfo];
    tblinfo = vars['table_info];
    col = (tblinfo[2]) + 1;
    n = [];
    max = listlen(tblinfo[1]);
    while (rinfo[col]) {
        col++;
        n += [[0, (tblinfo[1])[col], []]];
    }
    w = ((tblinfo[1]).subrange(col, cols)).sum();
    tblinfo = tblinfo.replace(2, (col + cols) - 1);
    vars = (vars.add('table_info, tblinfo)).add('header, "");
    [args, vars] = .eval_indented(args, vars, 0, w);
    return [(n + [[rows, w, args.explode("\n", 1)]]) + ($list.make(cols - 1, [rows, 0, []])), vars];
};

public method .do_tr() {
    arg vars, flags, args;
    var tblinfo, rinfo, i, l, len, s, j, col, rcont, done;
    
    tblinfo = vars['table_info];
    tblinfo = tblinfo.replace(2, 0);
    rinfo = vars['rinfo];
    rcont = vars['rcont];
    vars = vars.add('table_info, tblinfo);
    l = [];
    col = 1;
    for i in (args) {
        if (type(i) != 'frob)
            throw(~table, "Only {td} tags permitted in rows");
        switch (i.method()) {
            case 'do_td:
                [i, vars] = .do_td(vars, i.ctext_flags(), i.args());
            case 'do_th:
                [i, vars] = .do_th(vars, i.ctext_flags(), i.args());
            default:
                throw(~table, "Only {td} tags permitted in rows");
        }
        l += i;
        for j in (i) {
            rcont = rcont.replace(col, (rcont[col]) + (j[3]));
            col++;
        }
    }
    l += $list.make((rcont.length()) - (l.length()), [0, 0, []]);
    s = "";
    i = 1;
    done = 0;
    rinfo = map j in [1 .. rinfo.length()] to (((rinfo[j]) - 1) + ((l[j])[1]));
    while (!done) {
        done = 1;
        for j in [1 .. rcont.length()] {
            s += ((| (rcont[j])[i] |) || "").pad((l[j])[2]);
            done = done && ((rinfo[j]) || (i >= listlen(rcont[j])));
        }
        i++;
        s = s.trim('right);
        s += "\n";
    }
    for j in [1 .. rinfo.length()]
        rcont = rcont.replace(j, (| (rcont[j]).subrange(i) |) || []);
    vars = (vars.add('rinfo, rinfo)).add('rcont, rcont);
    return [s, vars];
};

public method .do_tt() {
    arg vars, flags, args;
    var out, a;
    
    return ._eval_ctext(args, vars);
};

public method .do_ul() {
    arg vars, flags, args;
    var out, token, old, last, depth;
    
    if (dict_contains(vars, 'list_type)) {
        old = vars['list_type];
        if (old == 'ordinal)
            last = vars['list_last];
        else
            last = -1;
        vars = dict_add(vars, 'list_depth, (vars['list_depth]) + 1);
    } else {
        vars = dict_add(vars, 'list_depth, 1);
    }
    vars = dict_add(vars, 'list_type, 'plain);
    [args, vars] = ._eval_ctext(args, vars);
    if (old) {
        vars = dict_add(vars, 'list_type, old);
        if ((old == 'ordinal) && (last != (-1)))
            vars = dict_add(vars, 'list_last, last);
        vars = dict_add(vars, 'list_depth, (vars['list_depth]) - 1);
    } else {
        vars = dict_del(vars, 'list_type);
        vars = dict_del(vars, 'list_depth);
    }
    return [args, vars];
};

public method .do_web() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [((((args + "<") + (flags.getkey("name"))) + ":") + (flags.getkey("src"))) + ">", vars];
};

public method .eval_indented() {
    arg args, vars, i, @w;
    var width, indent;
    
    width = vars['width];
    vars = vars.add('width, (| w[1] |) || (width - i));
    [args, vars] = ._eval_ctext(args, vars);
    return [.rewrap_lines(vars, (vars['header]) + args, pad("", i)), vars.add('width, width)];
};

public method .format() {
    arg data, vars;
    var str, len, line, out;
    
    str = (> (._eval_ctext(data, vars))[1] <);
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    return str_to_buf(str);
};

public method .init() {
    return #[['header, ""], ['width, 78]];
};

public method .rewrap_lines() {
    arg vars, str, prefix;
    var s, p, n, firstline;
    
    s = [];
    n = (vars['width]) + (prefix.length());
    for str in (str.explode("\n", 1))
        s += str.wrap_lines(n, prefix, 1);
    return s.join("\n");
};


