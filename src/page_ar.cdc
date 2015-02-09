
new object $page_ar: $page;

var $dmi_data descriptions = #[['change, #[['args, #[]], ['auth, [$security_lib, 'check_userdb_with_password, []]]]]];
var $root created_on = 932229052;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_ar];
var $root manager = $page_ar;
var $root trusted_by = [$no_one];

private method ._error() {
    arg msg, @args;
    
    return ((.build_header(@args)) + msg) + (.build_footer(@args));
};

public method ._get_report() {
    arg report;
    var g;
    
    if (!report)
        return 0;
    report = toint(report);
    for g in ($argroup.children()) {
        if (dict_contains(g.requests(), report))
            return ((g.requests())[report])[1];
    }
    return 0;
};

public method ._list() {
    arg reports, full;
    var group, report, r, id, date, summary, resolved, str, out, tr, n, tot, bg;
    
    out = [];
    for group in (dict_keys(reports)) {
        refresh();
        for report in (reports[group]) {
            refresh();
            id = report[1];
            [r, resolved, date, summary] = report[2];
            date = $time.format("%d-%h-%Y", date);
            if (tot % 2)
                bg = [["bgcolor", "#dddddd"]];
            else
                bg = [];
            id = $cml_lib.fmt_href("/ar/view?r=" + id, "#" + id);
            id = $cml_lib.fmt_td(id, @bg, ["align", "right"]);
            date = (<$format, ["font", [["size", 1]], [date], 'do_font]>);
            date = $cml_lib.fmt_td(date, @bg);
            summary = $cml_lib.fmt_td(summary || ($cml_lib.fmt_br()), @bg);
            if (full) {
                n = $cml_lib.fmt_td(group.name(), @bg);
                tr = $cml_lib.fmt_tr(id, n, date, summary);
            } else {
                tr = $cml_lib.fmt_tr(id, date, summary);
            }
            tot++;
            out += [tr];
        }
    }
    out += [$cml_lib.fmt_subj(tot + " total", 3)];
    return $ctext_frob.new_with(out);
};

private method ._mailmsg() {
    arg req, from, @resolved;
    var recip, text, id, fmt, c, cmts, subj, msg;
    
    id = req.id();
    recip = [$mail_list_bugs];
    if (resolved)
        subj = (("AR #" + id) + " RESOLVED: ") + (req.summary());
    else
        subj = (("Comment on AR #" + id) + ": ") + (req.summary());
    text = ["Reported By: " + (req.submitted_by())];
    text += ["Reported On: " + ($time.format("%d-%h-%Y", req.submitted_on()))];
    text += [""];
    text += ((req.text()).mmap('wrap_lines, 70, "> ", 1)).flatten();
    cmts = req.comments();
    msg = (cmts.last())[3];
    cmts = sublist(cmts, 1, listlen(cmts) - 1);
    for c in (cmts) {
        fmt = "On " + ($time.format("%d-%h-%Y ", c[1]));
        fmt += (c[2]) + " Comments:";
        text += ["", fmt] + (((c[3]).mmap('wrap_lines, 70, "> ", 1)).flatten());
    }
    text += [""] + msg;
    $no_one.mail_as(from.namef('ref), [], subj, text, @recip);
};

public method .change() {
    arg h, i, args;
    var dbref, req, g, p, c, out, r;
    
    if (!(req = ._get_report((| args["id"] |))))
        return ._error(["<H1>Invalid Request</H1>"], h, i, args);
    if (dict_contains(args, "group")) {
        if (!(dbref = (| $object_lib.to_dbref(args["group"]) |)))
            return ._error(["<H1>Invalid Dbref</H1>"], h, i, args);
        if (!(dbref.is($argroup)))
            return ._error(["<H1>Invalid Group</H1>"], h, i, args);
        if (!(req.trusts(sender())))
            return ._error(["<H1>You are not allowed, sorry.</H1>"], h, i, args);
        req.change_group(dbref);
        return ['redirect, "/ar/view?r=" + (req.id())];
    } else if (dict_contains(args, "comment")) {
        c = args["comment"];
    
        // ugh -- need to fix
        c = strsub(c, $http.decode("%0d"), "");
        c = c.trim();
        r = (| args["resolv"] |) == "yes";
        if (r && (req.resolved_on()))
            return ._error(["<H1>Already resolved.</H1>"], h, i, args);
        if (c) {
            if (dict_contains(args, "pre"))
                c = [$cml_lib.fmt_quote(strsub(c, $http.decode("%0a"), "\n"))];
            else
                c = [strsub(c, $http.decode("%0a"), " ")];
            req.add_comment(c, sender().namef('ref));
        }
        if (r) {
            if (!(req.trusts(sender())))
                return ._error(["<H1>You are not allowed, sorry.</H1>"], h, i, args);
            req.resolve(sender());
            if ((| args["mailmsg"] |) == "yes")
                ._mailmsg(req, sender(), 1);
            return ['redirect, "/ar/list?group=" + (req.group())];
        }
        return ['redirect, "/ar/view?r=" + (req.id())];
    } else {
        return ._error(["<H1>No change specified</H1>"], h, i, args);
    }
};

public method .generate() {
    arg @args;
    
    return .list(@args);
};

public method .list() {
    arg header, info, args;
    var body, groups, g, list, reports, r, all;
    
    body = .build_header(header, info, args);
    if (dict_contains(args, "group")) {
        //// I do not see any great value in allowing all groups,
        //// but will leave the code here incase somebody whines
        // g = toint(args["group"]);
        // if (g == 0) {
        //     reports = #[];
        //     for g in (setremove($argroup.children(), $dismissed_problems)) {
        //         list = filter r in (g.requests()) where (!r[2][2]);
        //         if (list)
        //             reports = dict_add(reports, g, list);
        //     }
        //     body += ["<h1>ALL Un-Resolved Action Requests</h1>"];
        //     all = 1;
        // }
        g = (| $object_lib.to_dbref(args["group"]) |);
        if ((!g) || (!(g.is($argroup))))
            return ._error("<h1>Invalid Group</h1>");
        reports = filter r in (g.requests()) where (!((r[2])[2]));
        reports = #[[g, reports]];
        body += [("<h1>Un-Resolved " + (g.name())) + " Action Requests</h1>"];
        if (reports) {
            body = strings_to_buf(body);
            body += str_to_buf("<table border=0><tr><td>\n");
            body += $parse_lib.filter_ctext(._list(reports, all), #[['formatter, $html_format], ["viewer", $no_one]]);
            body += str_to_buf("</td></tr></table>\n");
            body += strings_to_buf(.build_footer(header, info, args));
            return body;
        }
    } else {
        groups = $argroup.children();
        body += ["<h1>Select Action Request Group</h1>", "<ul>"];
        for g in (groups)
            body += [("<li><a href=\"/ar/list?group=" + g) + "\">", (g.name()) + "</a>"];
        body += ["</ul>"];
    }
    return body + (.build_footer(header, info, args));
};

public method .view() {
    arg h, i, args;
    var body, rep, g;
    
    body = .build_header(h, i, args);
    if (!(rep = ._get_report((| args["r"] |))))
        return (body + ["<H1>Invalid Request</H1>"]) + (.build_footer(h, i, args));
    body = strings_to_buf(body);
    body += $parse_lib.filter_ctext(rep.format(1), #[['formatter, $html_format], ["viewer", $no_one]]);
    body += strings_to_buf(.build_footer(h, i, args));
    return body;
};


