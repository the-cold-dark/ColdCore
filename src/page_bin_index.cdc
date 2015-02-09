
new object $page_bin_index: $page;

var $dmi_data descriptions = #[['help, #[['args, #[["node", [[$help_coldcore], [$converters, 'to_help_node, []]]]]]]], ['describe, #[['args, #[["detail", [[""], []]], ["target", [[$the_pit], [$converters, 'to_object, []]]]]]]], ['who, #[['args, #[]]]], ['display, #[['args, #[["target", [[$root], [$converters, 'to_object, []]]], ["methods", [[0], []]], ["vars", [[0], []]], ["helpctext", [[0], []]], ["desc", [[0], []]]]]]], ['object, #[['args, #[["target", [[$root], [$converters, 'to_object, []]]]]]]], ['method, #[['args, #[["target", [[['method, $user, $user, "say_cmd", 0]], [$converters, 'parse_ref, [$foundation, ['method]]]]], ["linenumbers", [[0], [$converters, 'to_boolean, []]]]]]]]];
var $page_bin_index gateways = ["describe", "who", "display", "help", "object", "method"];
var $root created_on = 863765399;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_bin_index];
var $root manager = $page_bin_index;

public method ._foof() {
    arg @args;
    
    return [];
};

public method ._list_gateways() {
    var out, line, gate;
    
    out = ["<ul>"];
    for gate in (gateways) {
        line = ((("<li><b><a href=\"/bin/" + gate) + "\">") + gate) + "</a></b>";
        out += [line];
    }
    return out + ["</ul>"];
};

public method ._make_display_href() {
    arg obj, @args;
    
    args = args ? (args.join("")) : "";
    return (((("<a href=\"/bin/display?target=" + (obj.objname())) + args) + "\">") + ((obj.namef('xref)).to_html())) + "</a>";
};

public method ._make_method_href() {
    arg m, @options;
    
    if (options) {
        options = options.mmap('join, "=");
        options = options.join("&");
    }
    return (((((((((".<a href=\"/bin/method?target=%%24" + ((m[1]).objname())) + ".") + (m[2])) + "()") + (options ? ("&" + options) : "")) + "\">") + (m[2])) + "</a>(") + (m[3])) + ")";
};

public method ._make_object_href() {
    arg obj;
    
    return ((("<a href=\"/bin/object?target=" + (obj.objname())) + "\">") + ((obj.namef('xref)).to_html())) + "</a>";
};

public method ._make_show_object_href() {
    arg msg, obj, what, change, value;
    var show, x;
    
    // used by ._show_object()
    what = dict_add(what, change, value);
    show = map x in (what) to (((x[1]) + "=") + ((x[2]) ? "yes" : "no")).join("&");
    if (show)
        return ((((("[<a href=\"/bin/display?target=" + (obj.objname())) + "&") + show) + "\">") + msg) + "</a>]";
    return ((("[<a href=\"/bin/display?target=" + (obj.objname())) + "\">") + msg) + "</a>]";
};

public method ._make_string_to_display_href() {
    arg obj, @args;
    
    args = args ? (args.join("")) : "";
    return (((("<a href=\"/bin/display?target=" + obj) + args) + "\">") + obj) + "</a>";
};

public method ._show_header_objs() {
    arg objs, what;
    var o, line;
    
    if ((objs.length()) > 1) {
        line = (("<tr><td><b>" + what) + "s</b>:</td><td>") + (._make_object_href(objs[1]));
        for o in (objs.subrange(2))
            line += ", " + (._make_object_href(o));
        line += "</td></tr>";
    } else if ((objs.length()) == 1) {
        line = ((("<tr><td><b>" + what) + "</b>:</td><td>") + (._make_object_href(objs[1]))) + "</td></tr>";
    } else {
        line = ("<tr><td><b>" + what) + "</b>:</td><td>(none)</td></tr>";
    }
    return line;
};

public method ._show_methods() {
    arg obj;
    var methods, types, m, t, out;
    
    types = #[];
    for m in ((obj.methods()).sort((obj.methods()).mmap('to_string)))
        types = types.add_elem(obj.method_access(m), [m] + (obj.method_info(m)));
    
    // hard-listing the types guarantee's their order
    out = [];
    for t in (['root, 'driver, 'frob, 'public, 'protected, 'private]) {
        if (!(types.contains(t)))
            continue;
        out += [(tostr(t).capitalize()) + " methods:"];
        for m in (types[t])
            out += [strfmt("%5l %4r " + (._make_method_href([obj, m[1], m[2]])), $object_lib.parse_method_flags(m[7]), m[5])];
    }
    return out;
};

public method ._show_object() {
    arg obj, what;
    var top, middle, bottom, desc, alert, nalert, line;
    
    middle = (bottom = []);
    top = [("<h1>" + (._make_object_href(obj))) + "</h1>"];
    
    // CORENOTE: merge this with a central location (likely $directories)
    alert = ("<p><font size=\"+1\" color=\"#" + (($cml_color.get_color("red"))[1])) + "\"><b>";
    nalert = "</b></font>";
    top += ["<table>"];
    top += [("<tr><td><b>Perms</b>:</td><td>" + (((obj.flags()).prefix("+")).join())) + "</td></tr>", ("<tr><td><b>Size</b>:</td><td>" + ((obj.size()).to_english())) + " bytes (on disk)</td></tr>", ("<tr><td><b>Manager</b>:</td><td>" + (._make_object_href(obj.manager()))) + "</td></tr>", ._show_header_objs(obj.writers('literal), "Writer"), ._show_header_objs(obj.parents(), "Parent")];
    if (obj.has_ancestor($located))
        top += [("<tr><td><b>Location</b>:</td><td>" + (._make_object_href(obj.location()))) + "</td></tr>"];
    if (obj.help_node())
        top += [((("<tr><td><b>Associated Help</b>:</td><td><a href=\"/bin/help?node=" + (obj.help_node())) + "\">") + (obj.help_node())) + "</a></td></tr>"];
    top += [("<tr><td><b>Credit</b>:</td><td>" + join(obj.credit(), "<br>")) + "</td></tr>"];
    top += ["</table><p><hr size=1 noshade><p>"];
    if (obj.has_ancestor($described)) {
        if (what['desc]) {
            bottom += ["<p><b>Description</b>:<blockquote><pre>"];
            desc = obj.prose();
            switch (type(desc)) {
                case 'frob:
                    for line in (desc.uncompile())
                        bottom += line.wrap_lines(79, " ");
                case 'list:
                    bottom += desc;
                case 'string:
                    bottom += [desc];
            }
            bottom += ["</pre></blockquote>"];
            middle += [._make_show_object_href("Hide Description", obj, what, 'desc, 0)];
        } else {
            middle += [._make_show_object_href("Show Description", obj, what, 'desc, 1)];
        }
        top += ["</td></tr>"];
    }
    if (what['methods]) {
        if (!(obj.has_flag('methods, this())))
            bottom += [(alert + "** No permission to List Methods **") + nalert];
        else
            bottom += (["<p><b>Methods:</b><blockquote><pre>"] + (._show_methods(obj))) + ["</pre></blockquote>"];
        middle += [._make_show_object_href("Hide Methods", obj, what, 'methods, 0)];
    } else {
        middle += [._make_show_object_href("List Methods", obj, what, 'methods, 1)];
    }
    if (what['vars]) {
        if (!(obj.has_flag('variables, this())))
            bottom += [(alert + "** No permission to Show Variables **") + nalert];
        else
            bottom += (["<p><b>Variables:</b><blockquote><pre>"] + (._show_variables(obj))) + ["</pre></blockquote>"];
        middle += [._make_show_object_href("Hide Variables", obj, what, 'vars, 0)];
    } else {
        middle += [._make_show_object_href("Show Variables", obj, what, 'vars, 1)];
    }
    return (((top + middle) + ["<p>"]) + bottom) + ["<p>"];
};

public method ._show_variables() {
    arg obj;
    var parent, out, v, s, n;
    
    out = [];
    for parent in (obj.data()) {
        if (valid(parent[1])) {
            out += [(._make_string_to_display_href(parent[1])) + " variables:"];
            if ((parent[1]).has_flag('variables, this())) {
                for v in (parent[2]) {
                    s = $data_lib.unparse_indent_html(v[2]);
                    n = ("  " + (v[1])) + ": ";
                    s = [s[1]] + ((s.subrange(2)).prefix(" ".pad(strlen(n))));
                    out += [n].affix(s);
                }
            } else {
                out += ["  ** Permission Denied **"];
            }
        } else {
            out += [($object_lib.get_name(parent[1])) + " variables:"];
            for v in (parent[2]) {
                s = $data_lib.unparse_indent_html(v[2]);
                n = ("  " + (v[1])) + ": ";
                s = [s[1]] + ((s.subrange(2)).prefix(" ".pad(strlen(n))));
                out += [n].affix(s);
            }
        }
        refresh();
    }
    return out;
};

public method .describe() {
    arg header, info, args;
    var obj, desc, flags, detail, page, body, name, user;
    
    if ($security_lib.check_userdb_with_optional(header['interface]))
        user = (header['interface]).get_info('run_as);
    else
        user = $no_one;
    obj = (| args["target"] |);
    detail = (| args["detail"] |);
    if (detail) {
        detail = $http.decode(detail);
        name = ((obj.name()) + ": ") + detail;
        catch any
            body = (<$ctext_frob, [[(<$format, ["subj", [["level", "2"]], [detail.capitalize()], 'do_subj]>)], #[['this, obj]]]>).append(obj.get_detail(detail));
        with
            body = (header['interface]).response(404, ("No such detail '" + detail) + "'");
    } else {
        name = obj.name();
        body = obj.get_description(#[['actor, user]]);
    }
    return [[@.build_header(header, info, args), body, @.build_footer(header, info, args)]];
};

public method .display() {
    arg header, info, args;
    var out, obj, what, user;
    
    obj = (| args["target"] |);
    what = #[['desc, 0], ['methods, 0], ['vars, 0]];
    if ($security_lib.check_userdb_with_optional(header['interface]))
        user = (header['interface]).get_info('run_as);
    if (user) {
        what = dict_add(what, 'desc, (| user.get_setting("www-show-descriptions", $www_preferences) |));
        what = dict_add(what, 'methods, (| user.get_setting("www-show-methods", $www_preferences) |));
        what = dict_add(what, 'vars, (| user.get_setting("www-show-variables", $www_preferences) |));
    }
    if ((| args["vars"] |))
        what = dict_add(what, 'vars, (args["vars"]) == "yes");
    if ((| args["methods"] |))
        what = dict_add(what, 'methods, (args["methods"]) == "yes");
    if ((| args["desc"] |))
        what = dict_add(what, 'desc, (args["desc"]) == "yes");
    return [(.build_header(header, info, args, obj)) + [._show_object(obj, what), .build_footer(header, info, args)]];
};

public method .generate() {
    arg header, info, args;
    var gate;
    
    return [(header['interface]).response(300, ["Multiple Choices: "] + (._list_gateways()))];
};

public method .help() {
    arg header, info, args;
    var node, head, body, tail, tmp, n, name;
    
    node = (| args["node"] |);
    head = [@.build_header(header, info, args, "Help: " + (node.node_name())), ("<h2 align=center>" + (node.html_node_name('top))) + "</h2><hr size=1 noshade>"];
    body = node.body();
    if (node.group()) {
        tail = "<p><hr size=1 noshade><p align=center>";
        tmp = "";
        for n in (((node.parents())[1]).children()) {
            if (n.nolist())
                continue;
            name = (n.name()).word(1, "|");
            if (n == node)
                tmp += ((tmp ? "| " : "") + name) + " ";
            else if (n.holder())
                tmp += (((tmp ? "| " : "") + "<i>") + name) + "</i> ";
            else
                tmp += (((((tmp ? "| " : "") + "<a href=\"/bin/help?node=") + n) + "\">") + name) + "</a> ";
        }
        if (tmp)
            tail += tmp + "<p>";
    } else {
        tail = "<p>";
    }
    return [[@head, body, tail, @.build_footer(header, info, args)]];
};

public method .method() {
    arg header, info, args;
    var ref, str_ref, name, obj, code, def, out, line, linenumbers, user, strings, flags, trace, anc, current, m, options;
    
    ref = (| args["target"] |);
    linenumbers = (| args["linenumbers"] |);
    if (!("linenumbers" in (args['arg_list]))) {
        if ($security_lib.check_userdb_with_optional(header['interface])) {
            user = (header['interface]).get_info('run_as);
            linenumbers = (| user.get_setting("www-show-line-num", $www_preferences) |) || 0;
        }
    }
    catch any {
        name = (> tosym(ref[4]) <);
        obj = ref[3];
        def = obj.find_method(name);
        if ('native in (def.method_flags(name)))
            code = ["This method is implemented natively within the driver."];
        else
            code = (def.list_method(name)).mmap('html_escape);
        options = (("linenumbers" in (args['arg_list])) && linenumbers) ? [["linenumbers", "yes"]] : [];
        code = $code_lib.code_to_html(code, obj, options);
        if (linenumbers)
            code = code.numbered_text();
        str_ref = ((obj + ".") + name) + "()";
        out = [@.build_header(header, info, args, str_ref), ((((("<h1>Method code for " + (._make_string_to_display_href(obj, "&methods=yes"))) + ((def != obj) ? (("&lt;" + (._make_string_to_display_href(def, "&methods=yes"))) + "&gt;") : "")) + ".") + name) + "()") + "</h1>", "<blockquote>"];
        strings = linenumbers ? ["no", "off"] : ["yes", "on"];
        out += [strfmt("[<A HREF=\"/bin/method?target=%s&linenumbers=%s\">Turn %s line numbering</A>]", str_ref, @strings)];
        out += ["<hr size=1 noshade width=\"50%\" align=left><pre>"];
        out += code + ["</pre><hr size=1 noshade width=\"50%\" align=left>"];
        line = "// " + ((def.credit()).join("<br>// "));
        out += [("<font color=\"#a0a0a0\">" + line) + "</font>"];
        out += ["</blockquote>"];
        strings = (trace = []);
        current = def;
        while (current) {
            trace += [current];
            current = (| def.find_next_method(name, current) |);
        }
        if ((trace.length()) > 1) {
            out += ["<h2>Method Ancestry Override:</h2>"];
            out += ["<blockquote><pre>"];
            for anc in (trace) {
                m = anc.method_info(name);
                out += [strfmt(("%5l %4r " + (._make_string_to_display_href(anc))) + (._make_method_href([anc, name, m[1]], @options)), $object_lib.parse_method_flags(m[6]), m[4])];
            }
            out += ["</pre></blockquote>"];
        }
    } with {
        switch (error()) {
            case ~type:
                return [(header['interface]).response(400, ((("Invalid method reference " + obj) + ".") + name) + "()")];
            case ~methodnf:
                line = ((obj + ".") + name) + "()";
                return [(header['interface]).response(400, line + " not found.")];
            default:
                return [(header['interface]).response(400, (traceback()[1])[2])];
        }
    }
    return [out + (.build_footer(header, info, args))];
};

public method .object() {
    arg header, info, args;
    var out, obj, o, line, objs, m;
    
    obj = (| args["target"] |);
    out = [@.build_header(header, info, args, obj.namef('xref)), ("<h1 align=center>" + (._make_display_href(obj, "&methods=1"))) + "</h1>"];
    line = "<p align=center><b>Parent(s)</b>: " + ((| ._make_object_href((obj.parents())[1]) |) || "(none)");
    for o in ((| (obj.parents()).subrange(2) |) || [])
        line += ", " + (._make_object_href(o));
    out += [line + "</p>", "<table>"];
    objs = obj.children();
    if (obj) {
        out += ["<p align=center><b>Children:</b></p>", "<center><table  cellspacing=0 cellpadding=0>", "<tr><td width=25%><b>Name</b></td><td width=25%><b>Perms</b></td><td width=25%><b>Size</b></td><td width=25%><b>Manager</b></td></tr>"];
        for o in (objs) {
            refresh();
            m = o.manager();
            if (!valid(o))
                m = toliteral(m);
            else
                m = ._make_object_href(m);
            out += [((((((("<tr><td>" + (._make_object_href(o))) + "</td><td>") + ($object_lib.see_perms(o, ["", ""]))) + "</td><td>") + ((o.size()).to_english())) + "</td><td>") + m) + "</td></tr>"];
        }
    }
    out += ["</table><p>", join(obj.credit(), "<br>"), "</center>"];
    return [out + (.build_footer(header, info, args))];
};

public method .who() {
    arg headers, info, args;
    var who, namel, names, times, idle, realm, x, cols, out, output, line;
    
    out = (.build_header(headers, info, args, "Connected users to " + ($motd.server_name()))) + [("<center><h2>Connected users to <i>" + ($motd.server_name())) + "</i></h2></center></head><body><pre>"];
    who = $user_db.connected();
    names = who.mmap('hname);
    namel = [];
    for x in (who.mmap('name))
        namel += [x.length()];
    cols = (namel.max()) + 1;
    if (cols < 5)
        cols = 5;
    times = who.mmap('connected_time);
    cols = [cols, (times.element_maxlength()) + 1];
    if ((cols[2]) < 7)
        cols = [cols[1], 7];
    idle = who.mmap('idle_time);
    cols += [(idle.element_maxlength()) + 1];
    if ((cols[3]) < 5)
        cols = cols.replace(3, 5);
    realm = who.mmap('realm_name, "text/html");
    out += [((((("<hr size=1 noshade><b>" + ("Name".pad(cols[1]))) + " ") + ("On for".pad(cols[2]))) + " ") + ("Idle".pad(cols[3]))) + " Location", ((((("----".pad(cols[1])) + " ") + ("------".pad(cols[2]))) + " ") + ("----".pad(cols[3]))) + " --------</b>"];
    for x in [1 .. who.length()] {
        line = ((("<b>" + (names[x])) + "</b>") + ("".pad((cols[1]) - (namel[x])))) + " ";
        line = (((line + "<i>") + (times[x])) + ("".pad((cols[2]) - ((times[x]).length())))) + " ";
        line = (((line + (idle[x])) + "</i>") + ("".pad((cols[3]) - ((idle[x]).length())))) + " ";
        line += realm[x];
        out += [line];
    }
    out += ["</pre>"];
    return [out + (.build_footer(headers, info, args))];
};


