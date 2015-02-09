
new object $pueblo_format: $html_format;

var $root created_on = 862777021;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$pueblo_format];
var $root manager = $pueblo_format;

public method ._do_dd() {
    arg vars, flags, args;
    
    return .eval_indented(args, vars, (| vars['dl_ind] |) || 4);
};

public method ._do_dl() {
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

public method ._do_dt() {
    arg vars, flags, args;
    
    vars = vars.add('header, "");
    [args, vars] = ._eval_ctext(args, vars);
    if ((| vars['columned] |))
        return ["\n  ", vars.add('header, pad("  " + args, 25 + ((args.length()) - ((.strip_tags(args)).length()))))];
    else
        return [("\n  " + args) + "\n", vars.add('header, "")];
};

public method .do_dd() {
    arg vars, flags, args;
    
    return ._do_dd(vars, flags, args);
};

public method .do_detail() {
    arg vars, flags, args;
    var det;
    
    det = flags.getkey("name");
    return [((((((("<a href=\"" + (vars['base_url])) + "/bin/describe?target=") + ((vars['this]).objname())) + "&detail=") + ($http.encode(det))) + "\">") + det) + "</a></b>", vars];
};

public method .do_dl() {
    arg vars, flags, args;
    
    [args, vars] = ._do_dl(vars, flags, args);
    return [("<pre>" + args) + "</pre>", vars];
};

public method .do_dt() {
    arg vars, flags, args;
    
    return ._do_dt(vars, flags, args);
};

public method .do_img() {
    arg vars, flags, args;
    var src, html, alt;
    
    src = flags.getkey("src");
    alt = (| ("alt=\"" + (flags.getkey("alt"))) + "\"" |) || "";
    if (!match_regexp(src, "^(http|ftp):"))
        src = (vars['base_url]) + src;
    return [((("<img src=\"" + src) + "\" align=left hspace=10 ") + alt) + ">", vars];
};

public method .do_link() {
    arg vars, flags, args;
    var node;
    
    [args, vars] = ._eval_ctext([args[1]], vars);
    node = (| flags.getkey("node") |);
    if (node)
        return [((("<a xch_cmd=\"@help " + node) + "\">") + args) + "</a>", vars];
    return ["&gt;&gt;ERROR: Invalid node&lt;&lt;", vars];
};

public method .do_obj() {
    arg vars, flags, args;
    var gateway, argname, output, context, object, name, options;
    
    name = flags.getkey("name");
    [name, vars] = ._eval_ctext([name], vars);
    context = flags.getkey("context");
    options = (| flags.getkey("options") |);
    object = args[1];
    if (type(context) == 'string)
        context = tosym(context);
    if (options && (type(options) == 'string))
        options = tosym(options);
    switch (context) {
        case 'look:
            if (options) {
                switch (options) {
                    case 'exit:
                        output = [((("<a xch_cmd=\"" + (object.name('noarticle))) + "\">") + name) + "</a>", vars];
                    case 'contained:
                        output = [((((("<a xch_cmd=\"look " + ((object.location()).name('noarticle))) + "'s ") + (object.name('noarticle))) + "\">") + name) + "</a>", vars];
                }
            } else {
                output = [((("<a xch_cmd=\"look " + (object.name('noarticle))) + "\">") + name) + "</a>", vars];
            }
        case 'display:
            [gateway, argname] = ["display", "target"];
        case 'exit:
            output = [((("<a xch_cmd=\"go " + (object.name())) + "\">") + name) + "</a>", vars];
    }
    if (output)
        return output;
    return [((((((((("<a href=\"" + (vars['base_url])) + "/bin/") + gateway) + "?") + argname) + "=") + tostr(object)) + "\">") + name) + "</a>", vars];
};

public method .do_table() {
    arg vars, flags, args;
    
    [args, vars] = $plain_format.do_table(vars, flags, args);
    return [("<pre>" + args) + "</pre>", vars];
};

public method .do_td() {
    arg vars, flags, args;
    
    return $plain_format.do_td(vars, flags, args);
};

public method .do_tr() {
    arg vars, flags, args;
    
    return $plain_format.do_tr(vars, flags, args);
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
    var str, len, line, out, base, port;
    
    base = "http://" + ($dns.hostname(""));
    port = $http_daemon.current_port();
    if (port != 80)
        base += ":" + port;
    vars = dict_add(vars, 'base_url, base);
    str = (> (._eval_ctext(data, vars))[1] <);
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    return str_to_buf(str + "\n");
};

public method .init() {
    return #[['width, 78]];
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

public method .strip_tags() {
    arg string;
    var mode, chunk;
    
    return map chunk in (string.global_regexp("<[^<>]+>")) to ((mode = !mode) ? chunk : "").join("");
};


