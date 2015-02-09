
new object $html_format: $formatter;

var $root created_on = 837902808;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$html_format];
var $root manager = $html_format;

public method ._eval_ctext() {
    arg data, vars, @unexpand;
    var out, uflags, token;
    
    out = "";
    if (type(data) != 'list)
        data = [data];
    for token in (data) {
        refresh();
        switch (type(token)) {
            case 'frob:
                switch (class(token)) {
                    case $generator:
                        [token, vars] = ((| vars['evaluator] |) || $bs_eval).eval_generator(token, vars);
                        if (type(token) == 'string) {
                            out += token;
                        } else {
                            [token, vars] = ._eval_ctext(token, vars, 1);
                            out += token;
                        }
                    case $format:
                        [token, vars] = .eval_formatter(token, vars);
                        out += token;
                }
            case 'string:
                out += unexpand ? token : (token.to_html());
            case 'list:
                [token, vars] = ._eval_ctext(token, vars, @unexpand);
                out += token;
            default:
                out += token;
        }
    }
    return [out, vars];
};

public method .do_anchor() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext([args[1]], vars);
    return [[("/" + (args[1])) + "/"], vars];
};

public method .do_b() {
    arg vars, flags, args;
    var out, a;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("<b>" + args) + "</b>", vars];
};

public method .do_br() {
    arg vars, flags, args;
    
    return ["\n<br>", vars];
};

public method .do_columnize() {
    arg vars, flags, args;
    var cols, l, out, i;
    
    cols = (| flags.getkey("cols") |) || "*";
    [args, vars] = ._eval_ctext(args, vars);
    out = "\n<table border=0>\n";
    while (args) {
        if ((args.length()) > cols)
            [l, args] = [args.subrange(1, cols), args.subrange(cols + 1)];
        else
            [l, args] = [args, []];
        out += ("<tr><td>" + (l.join("</td><td>"))) + "</td></tr>\n";
    }
    out += "</table>\n";
    return [out, vars];
};

public method .do_dd() {
    arg vars, flags, args;
    var c;
    
    c = (| vars['columned] |);
    [args, vars] = ._eval_ctext(args, vars);
    if (c)
        return [("<td>" + args) + "</td></tr>", vars];
    return ["<dd>" + args, vars];
};

public method .do_detail() {
    arg vars, flags, args;
    var det;
    
    det = flags.getkey("name");
    return [((((("<a href=\"/bin/describe?target=" + ((vars['this]).objname())) + "&detail=") + ($http.encode(det))) + "\">") + det) + "</a>", vars];
};

public method .do_dfn() {
    arg vars, flags, args;
    var out, a;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("\n<blockquote>" + args) + "</blockquote>", vars];
};

public method .do_dl() {
    arg vars, flags, args;
    var out, token, c, cm;
    
    c = (| vars['columned] |);
    cm = (| flags.getkey("columned") |) || 0;
    vars = vars.add('columned, cm);
    [args, vars] = ._eval_ctext(args, vars);
    if (c)
        vars = vars.add('columned, c);
    else if (vars.contains('columned))
        vars = vars.del('columned);
    if (cm)
        return [("\n<blockquote><table cols=2 border=0>\n" + args) + "\n</table></blockquote>\n", vars];
    return [("\n<dl>\n" + args) + "\n</dl>\n", vars];
};

public method .do_dt() {
    arg vars, flags, args;
    var term, c;
    
    c = (| vars['columned] |);
    [args, vars] = ._eval_ctext(args, vars);
    if (c)
        return [("\n<tr><td>" + args) + "</td>", vars];
    return ["\n<dt>" + args, vars];
};

public method .do_em() {
    arg vars, flags, args;
    var out, a;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("<em>" + args) + "</em>", vars];
};

public method .do_hr() {
    arg vars, flags, args;
    
    return ["\n<hr size=1 noshade>\n", vars];
};

public method .do_i() {
    arg vars, flags, args;
    var out, a;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("<i>" + args) + "</i>", vars];
};

public method .do_input() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(("\n<input " + ((flags.mmap('join, "=")).join(" "))) + ">") + args, vars];
};

public method .do_invoke() {
    arg vars, flags, args;
    var object, method, eacharg;
    
    [args, vars] = ._eval_ctext(args, vars);
    object = flags.getkey("object");
    method = flags.getkey("method");
    return [((((("<a href=\"/" + (object.subrange(2))) + "/") + method) + "\">") + args) + "</a>", vars];
};

public method .do_lh() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return ["\n<lh>" + args, vars];
};

public method .do_li() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return ["\n<li>" + args, vars];
};

public method .do_link() {
    arg vars, flags, args;
    var node;
    
    [args, vars] = ._eval_ctext([args[1]], vars);
    node = (| flags.getkey("node") |);
    if (node)
        return [((("<a href=\"/bin/help?node=" + node) + "\">") + args) + "</a>", vars];
    return ["&gt;&gt;ERROR: Invalid node&lt;&lt;", vars];
};

public method .do_method() {
    arg vars, flags, args;
    var out, vars, m;
    
    m = (flags[1])[1];
    [out, vars] = ._eval_ctext(args, vars);
    return [((("<a href=\"/bin/method?target=" + m) + "\"><tt>") + out) + "</tt></a>", vars];
};

public method .do_np() {
    arg vars, flags, args;
    
    return ["\n<p>\n", vars];
};

public method .do_obj() {
    arg vars, flags, args;
    var href, context, object, name, options;
    
    context = flags.getkey("context");
    options = (| flags.getkey("options") |);
    name = flags.getkey("name");
    object = args[1];
    if (type(context) == 'string)
        context = tosym(context);
    if (options && (type(options) == 'string))
        options = tosym(options);
    if (type(object) == 'frob)
        return [name.to_html(), vars];
    switch (context) {
        case 'look:
            href = "/bin/describe?target=";
            if (options == 'exit)
                object = object.dest(args[2]);
        case 'set:
            href = "/set/set_list?target=";
        default:
            href = "/bin/display?target=";
    }
    object = toliteral(object).to_html();
    name = name.to_html();
    return [(((("<a href=\"" + href) + object) + "\">") + name) + "</a>", vars];
};

public method .do_ol() {
    arg vars, flags, args;
    var out, header, line, token;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("\n<ol>\n" + args) + "\n</ol>\n", vars];
};

public method .do_option() {
    arg vars, flags, args;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [(("\n<option " + ((flags.mmap('join, "=")).join(" "))) + ">") + args, vars];
};

public method .do_p() {
    arg vars, flags, args;
    
    return ["\n<p>\n", vars];
};

public method .do_passthru() {
    arg vars, flags, args;
    
    args = args[1];
    return [args, vars];
};

public method .do_quote() {
    arg vars, flags, args;
    
    return [("<pre>" + ((((args[1]).replace("&", "&amp;")).replace("<", "&lt;")).replace(">", "&gt;"))) + "</pre>", vars];
};

public method .do_subj() {
    arg vars, flags, args;
    var out, word, l;
    
    [args, vars] = ._eval_ctext(args, vars);
    l = (| flags.getkey("level") |) || "4";
    return [((((("<h" + l) + ">") + args) + "</h") + l) + ">\n", vars];
};

public method .do_table() {
    arg vars, flags, args;
    var cols, tcs, tc;
    
    tcs = (| vars['table_cols] |);
    tc = (| vars['table_col] |);
    if ((cols = (| flags.getkey("cols") |)) && ("%" in cols))
        vars = vars.add('table_cols, cols.explode(","));
    [args, vars] = ._eval_ctext(args, vars);
    vars = tcs ? (vars.add('table_cols, tcs)) : (vars.del('table_cols));
    vars = tc ? (vars.add('table_col, tc)) : (vars.del('table_col));
    return [("\n<table border=0>" + args) + "\n</table>\n", vars];
};

public method .do_td() {
    arg vars, flags, args;
    var f, n, c, width, align;
    
    c = vars['table_col];
    vars = vars.add('table_col, c + 1);
    width = (| (vars['table_cols])[c] |);
    f = " " + join(flags.mmap('join, "="), " ");
    if (!(| flags.getkey("valign") |))
        f += " valign=top";
    if (width)
        f += (" width=\"" + width) + "\"";
    [args, vars] = ._eval_ctext(args, vars);
    return [((("\n<td " + f) + ">") + args) + "</td>", vars];
};

public method .do_th() {
    arg vars, flags, args;
    var f, n, c, width;
    
    c = vars['table_col];
    vars = vars.add('table_col, c + 1);
    width = (| (vars['table_cols])[c] |);
    f = "";
    if ((n = (| flags.getkey("rowspan") |)))
        f += " rowspan=" + n;
    if ((n = (| flags.getkey("colspan") |)))
        f += " colspan=" + n;
    if (width)
        f += (" width=\"" + width) + "\"";
    [args, vars] = ._eval_ctext(args, vars);
    return [((("\n<th align=left valign=top" + f) + ">") + args) + "</td>", vars];
};

public method .do_tr() {
    arg vars, flags, args;
    
    vars = vars.add('table_col, 1);
    [args, vars] = ._eval_ctext(args, vars);
    return [("\n<tr>" + args) + "</tr>", vars];
};

public method .do_tt() {
    arg vars, flags, args;
    var out, a;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("<tt>" + args) + "</tt>", vars];
};

public method .do_ul() {
    arg vars, flags, args;
    var out, header, line, token;
    
    [args, vars] = ._eval_ctext(args, vars);
    return [("\n<ul>\n" + args) + "\n</ul>\n", vars];
};

public method .do_web() {
    arg vars, flags, args;
    var src, href, listen;
    
    [args, vars] = ._eval_ctext(args, vars);
    src = flags.getkey("src");
    if ((!match_begin(src, "http")) && (!match_begin(src, "ftp"))) {
        href = "http://" + ($sys.server_info('server_hostname));
        listen = ($http_daemon.get_setting("listen", $daemon)).slice(1);
        if (!listidx(listen, 80))
            href += ":" + (listen[1]);
        src = href + src;
    }
    return [((("<a href=\"" + src) + "\">") + args) + "</a>", vars];
};

public method .eval_formatter() {
    arg form, vars;
    var flags, i, text;
    
    form = form.eval_flags(vars);
    catch ~methodnf {
        return .(form[4])(vars, form[2], form[3]);
    } with {
        [text, vars] = ._eval_ctext(form[3], vars);
        if ((vars['time]) == 'post)
            return ["<%l%l>%l</%l>".format(form[1], map i in (form[2]) to ((((" " + (i[1])) + "=\"") + (i[2])) + "\"").join(""), text, form[1]), vars];
        form = (<$format, [form[1], form[2], text, form[4]]>);
        return [[form], vars];
    }
};

public method .format() {
    arg data, vars;
    var str, len, line, out;
    
    str = (> (._eval_ctext(data, vars))[1] <) + "<br>";
    return str_to_buf(str + "\n");
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    return str_to_buf(str + "<br>\n");
};


