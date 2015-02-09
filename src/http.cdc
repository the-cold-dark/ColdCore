
new object $http: $libraries;

var $http codes = #[[200, "Ok"], [201, "Created"], [202, "Accepted"], [203, "Provisional Information"], [204, "No Content"], [300, "Multiple Choices"], [301, "Moved Permanently"], [302, "Moved Temporarily"], [303, "See Other"], [304, "Not Modified"], [400, "Bad Request"], [401, "Unauthorized"], [402, "Payment Required"], [403, "Forbidden"], [404, "Not Found"], [405, "Method Not Allowed"], [406, "None Acceptable"], [407, "Proxy Authentication Required"], [408, "Request Timeout"], [409, "Conflict"], [410, "Gone"], [500, "Internal Server Error"], [501, "Not Implemented"], [502, "Bad Gateway"], [503, "Service Unavailable"], [504, "Gateway Timeout"]];
var $http errors = #[[400, ["<head><title>400 Bad Request</title></head>", "<body>", "<center><h1>400 Bad Request</h1></center>", "%s", "</body>"]], [403, ["<head><title>403 Permission Denied</title></head>", "<body>", "<center><h1>403 Permission Denied</h1></center>", "%s", "</body>"]], [404, ["<head><title>404 Not Found</title></head>", "<center><h1>404 Not Found</h1></center>", "%s", "</body>"]]];
var $http gateways = #[["describe", "describe?target=the_pit"], ["see", "see?target=the_pit"], ["who", "who"], ["display", "display?target=http"], ["list_method", "list_method?target=%24http.list_method"], ["help", "help?node=help_coldcore"], ["object", "object?target=http"]];
var $http html_version = "text/html";
var $http http_methods = ["GET"];
var $http page_head = [];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$http];
var $root manager = $http;

public method ._show_header_objs() {
    arg objs, what;
    var o, line;
    
    if ((objs.length()) > 1) {
        line = (("<b>" + what) + "s</b>: ") + (.make_object_href(objs[1]));
        for o in (objs.subrange(2))
            line += ", " + (.make_object_href(o));
        line += "<br>";
    } else if ((objs.length()) == 1) {
        line = (("<b>" + what) + "</b>: ") + (.make_object_href(objs[1]));
    } else {
        line = ("<b>" + what) + "</b>: (none)<br>";
    }
    return line;
};

public method ._show_methods() {
    arg obj;
    var methods, types, m, t, out;
    
    types = #[];
    for m in (obj.methods())
        types = types.add_elem(obj.method_access(m), [m] + (obj.method_info(m)));
    
    // hard-listing the types guarantee's their order
    out = [];
    for t in (['root, 'driver, 'public, 'protected, 'private]) {
        if (!(types.contains(t)))
            continue;
        out += [(tostr(t).capitalize()) + " methods:"];
        for m in (types[t])
            out += [strfmt("%5l %4r " + (.make_method_href([obj, m[1], m[2]])), $object_lib.parse_method_flags(m[7]), m[5])];
    }
    return out;
};

public method ._show_variables() {
    arg obj;
    var parent, out, v;
    
    out = [];
    for parent in (obj.data()) {
        if (valid(parent[1])) {
            out += [(parent[1]) + " variables:"];
            if ((parent[1]).has_flag('variables, this())) {
                for v in (parent[2])
                    out += [(("  " + (v[1])) + ": ") + toliteral(v[2])];
            } else {
                out += ["  ** Permission Denied **"];
            }
        } else {
            out += [($object_lib.get_name(parent[1])) + " variables:"];
            for v in (parent[2])
                out += [(("  " + (v[1])) + ": ") + toliteral(v[2])];
        }
        refresh();
    }
    return out;
};

public method .bin_describe() {
    arg path, info, header;
    var obj, desc, flags, detail, page, body, name;
    
    obj = (| (info['args])["target"] |);
    if (!obj)
        return [400, .response(400, "Must specify a target object")];
    obj = (| $object_lib.to_dbref(obj) |) || (| $user_db.search(obj) |);
    if (!obj)
        return [404, .response(404, ("Unable to find object \"" + ((info['args])["target"])) + "\"")];
    detail = (| (info['args])["detail"] |);
    if (detail) {
        detail = $http.decode(detail);
        name = ((obj.name()) + ": ") + detail;
        catch any
            body = (<$ctext_frob, [[(<$format, ["subj", [["level", "2"]], [detail.capitalize()], 'do_subj]>)], #[['this, obj]]]>).append(obj.get_detail(detail));
        with
            body = $http.response(404, ("No such detail '" + detail) + "'");
    } else {
        name = obj.name();
        body = obj.get_description(#[['actor, $no_one]]);
    }
    return [200, .build_page(body, name)];
};

public method .bin_display() {
    arg path, info, header;
    var out, obj, what, args;
    
    args = info['args];
    obj = (| args["target"] |);
    if (!obj)
        return [400, .response(400, "Must specify a target object")];
    obj = (| $object_lib.to_dbref(obj) |);
    if (!obj)
        return [404, .response(404, ("Unable to find object \"" + (args["target"])) + "\"")];
    what = [];
    if ((| args["vars"] |))
        what = setadd(what, 'vars);
    if ((| args["methods"] |))
        what = setadd(what, 'methods);
    return [200, .show_object(obj, what)];
};

public method .bin_help() {
    arg path, info, header;
    var node, head, tail, cout, list, n, out, name;
    
    node = (| (info['args])["node"] |);
    if (!node)
        node = "help_coldcore";
    catch ~namenf
        node = (> $object_lib.to_dbref(node) <);
    with
        return [404, .response(404, "Unable to find help node: " + ((info['args])["node"]))];
    head = strings_to_buf([("<head><title>Help: " + (node.node_name())) + "</title></head>", page_body, ("<h2 align=center>" + (node.html_node_name('top))) + "</h2><hr size=1 noshade>"]);
    cout = $parse_lib.filter_ctext(node.body(), #[['formatter, $html_format], ['node, tostr(node)]]);
    tail = "<p><hr size=1 noshade><p align=center>";
    if (node.group()) {
        out = "";
        for n in (((node.parents())[1]).children()) {
            if (n.nolist())
                continue;
            name = (n.name()).word(1, "|");
            if (n == node)
                out += ((out ? "| " : "") + name) + " ";
            else if (n.holder())
                out += (((out ? "| " : "") + "<i>") + name) + "</i> ";
            else
                out += (((((out ? "| " : "") + "<a href=\"/bin/help?node=") + n) + "\">") + name) + "</a> ";
        }
        if (out)
            tail += out;
    }
    tail = str_to_buf(tail + "\n");
    switch (type(cout)) {
        case 'string:
            cout = [cout];
        case 'frob:
            cout = `[];
    }
    return [200, (head + cout) + tail];
};

public method .bin_list_method() {
    arg path, info, header;
    var ref, str_ref, name, obj, code, anc, out, line, x;
    
    ref = (| (info['args])["target"] |);
    if (!ref)
        return [400, .response(400, "Must specify a target method reference")];
    catch any {
        ref = $parse_lib.ref($http.decode(ref), $foundation);
        name = (> tosym(ref[4]) <);
        obj = ref[3];
        anc = obj.find_method(name);
        code = map x in (anc.list_method(name)) to (x.html_escape());
        str_ref = ((obj + ".") + name) + "()";
        out = [("<head><title>" + str_ref) + "</title></head>", page_body, ("<center><h1>" + str_ref) + "</h1></center>", "<hr size=1 noshade><pre>", @code, "</pre>"];
    } with {
        switch (error()) {
            case ~type:
                return [400, ((("Invalid method reference " + obj) + ".") + name) + "()"];
            case ~methodnf:
                line = ((obj + ".") + name) + "()";
                return [400, .response(400, line + " not found.")];
            default:
                return [400, .response(400, (traceback()[1])[2])];
        }
    }
    return [200, out];
};

public method .bin_object() {
    arg path, info, header;
    var out, obj, o, line, objs, m;
    
    obj = (| (info['args])["target"] |);
    if (!obj)
        return [400, .response(400, "Must specify a target object")];
    obj = (| $object_lib.to_dbref(obj) |);
    if (!obj)
        return [404, .response(404, ("Unable to find object \"" + ((info['args])["target"])) + "\"")];
    out = [("<head><title>" + (obj.namef('xref))) + "</title></head>", page_body, ("<h1 align=center>" + (.make_display_href(obj, "&methods"))) + "</h1>"];
    line = "<p align=center><b>Parent(s)</b>: " + ((| .make_object_href((obj.parents())[1]) |) || "(none)");
    for o in ((| (obj.parents()).subrange(2) |) || [])
        line += ", " + (.make_object_href(o));
    out += [line + "</p>", "<pre>"];
    objs = obj.children();
    if (obj) {
        out += ["<p align=center><b>Children:</b></p>", "Name                                 Perms  Size    Manager"];
        for o in (objs) {
            m = o.manager();
            if (!valid(o))
                m = toliteral(m);
            else
                m = .make_object_href(m);
            out += [((((((((("<a href=\"/bin/object?target=" + (o.objname())) + "\">") + pad(o.namef('xref), 36)) + "</a>") + " ") + (($object_lib.see_perms(o, ["", ""])).pad(5))) + "  ") + (((o.size()).to_english()).pad(8))) + " ") + m];
        }
    }
    return [200, out + ["</pre>"]];
};

public method .bin_see() {
    arg @args;
    
    return [400, .response(400, "VRML support is pending completion, sorry!")];
};

public method .bin_who() {
    arg @args;
    var who, namel, names, times, idle, realm, x, cols, out, output, line;
    
    out = [("<head><title>Connected users to " + ($motd.server_name())) + "</title></head>", page_body, ("<center><h2>Connected users to <i>" + ($motd.server_name())) + "</i></h2></center></head><body><pre>"];
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
    return [200, out];
};

public method .build_page() {
    arg what, name;
    var out;
    
    return (((`[60, 104, 101, 97, 100, 62, 60, 116, 105, 116, 108, 101, 62] + str_to_buf(name)) + `[60, 47, 116, 105, 116, 108, 101, 62, 60, 47, 104, 101, 97, 100, 62]) + str_to_buf(page_body)) + (.process_text(what));
};

public method .decode(): native;

public method .encode(): native;

public method .gateways() {
    return gateways;
};

public method .html_version() {
    return html_version;
};

public method .http_methods() {
    return http_methods;
};

public method .list_gateways() {
    var out, line, gate;
    
    out = ["<ul>"];
    for gate in (gateways) {
        line = ((("<li><b><a href=\"/bin/" + (gate[2])) + "\">") + (gate[1])) + "</a></b>";
        out += [line];
    }
    return out + ["</ul>"];
};

public method .make_display_href() {
    arg obj, @args;
    
    args = args ? (args.join("")) : "";
    return (((("<a href=\"/bin/display?target=" + (obj.objname())) + args) + "\">") + (obj.namef('xref))) + "</a>";
};

public method .make_href() {
    arg obj, @args;
    var line, oname, method, name;
    
    oname = obj.objname();
    if (listlen(args))
        name = args[1];
    else
        name = ("<code>$" + oname) + "</code>";
    if (listlen(args) > 1)
        method = args[2];
    else
        method = "/bin/show?target=" + oname;
    return ((("<a href=\"" + method) + "\">") + name) + "</a>";
};

public method .make_method_href() {
    arg m;
    
    return ((((((("<a href=\"/bin/list_method?target=%%24" + ((m[1]).objname())) + ".") + (m[2])) + "()\">.") + (m[2])) + "(") + (m[3])) + ")</a>";
};

public method .make_obj_show_href() {
    arg obj, @name;
    var line, oname;
    
    name = name ? name : (("<code>" + obj) + "</code>");
    return ((("<a href=\"/bin/show?target=" + (obj.objname())) + "\">") + name) + "</a>";
};

public method .make_object_href() {
    arg obj;
    
    return ((("<code><a href=\"/bin/object?target=" + (obj.objname())) + "\">") + (obj.namef('xref))) + "</a></code>";
};

public method .page_body() {
    return page_body;
};

public method .page_head() {
    return page_head;
};

public method .page_tail() {
    arg @args;
    var tail;
    
    tail = ("<hr size=1 noshade><a href=\"/\"><b>" + ($motd.server_name())) + "</b></a>";
    if (args)
        return str_to_buf(tail);
    return [tail];
};

public method .process_bin_request() {
    arg @path;
    var gate, who;
    
    if (!path) {
        return ["text/html", .list_gateways()];
    } else {
        gate = path[1];
        path = path.subrange(2);
        if ("?" in gate) {
            path = [gate.subrange(("?" in gate) + 1), @path];
            gate = gate.subrange(1, ("?" in gate) - 1);
        }
        if (!(gate in (gateways.keys())))
            return ["text/html", .get_error(400, ("Unknown gateway \"" + gate) + "\".")];
        return ["text/html", .(tosym("bin_" + gate))(@path)];
    }
};

public method .process_text() {
    arg what;
    var out, l, b;
    
    switch (type(what)) {
        case 'frob:
            return $parse_lib.filter_ctext(what, #[['formatter, $html_format]]);
        case 'list:
            out = `[];
            for l in (what)
                out += .process_text(l);
            return out;
        case 'string:
            // "<br>" == `[60, 98, 114, 62]
            return str_to_buf(what) + `[60, 98, 114, 62, 13, 10];
    }
};

public method .response() {
    arg code, message;
    var name, x;
    
    if (!(name = (| codes[code] |)))
        return .response(500, "We had a booboo!  Invalid code: " + tostr(code));
    if (type(message) == 'string)
        message = [("<p align=center>" + message) + "</p>"];
    return [((("<head><title>" + tostr(code)) + " ") + name) + "</title></head>", page_body, ((("<h1 align=center>" + tostr(code)) + " ") + name) + "</h1>", "<hr size=1 noshade>", @message, @.page_tail()];
};

public method .show_object() {
    arg obj, what;
    var out;
    
    out = [("<head><title>ColdC Object Display of " + obj) + "</title></head>", page_body, ("<h1>" + obj) + "</h1>", ("<b>Perms</b>: " + (((.flags()).prefix("+")).join())) + "<br>", ("<b>Size</b>: " + ((obj.size()).to_english())) + " bytes (on disk)<br>", ("<b>Manager</b>: " + (.make_object_href(obj))) + "<br>", ._show_header_objs(obj.writers('literal), "Writer"), ._show_header_objs(obj.parents(), "Parent")];
    if (obj.has_ancestor($located))
        out += [("<b>Location</b>: " + (.make_object_href(obj.location()))) + "<br>"];
    out += ["<p><pre>"];
    if ('methods in what) {
        if (!(obj.has_flag('methods, this())))
            out += ["  ** No permission to list methods **"];
        else
            out += ._show_methods(obj);
    } else {
        out += [((((("  <h3><a href=\"/bin/display?target=" + obj) + "&") + ((['methods] + what).join("=yes&"))) + "=yes\">Display Methods on ") + obj) + "</a></h3>"];
    }
    if ('vars in what) {
        if (!(obj.has_flag('vars, this())))
            out += ["  ** No permission to show variables **"];
        else
            out += ._show_variables(obj);
    } else {
        out += [((((("  <h3><a href=\"/bin/display?target=" + obj) + "&") + ((what + ['vars]).join("=yes&"))) + "=yes\">Display Variables on ") + obj) + "</a></h3>"];
    }
    return out + ["</pre>"];
};


