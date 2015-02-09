
new object $action_request: $misc;

var $action_request claimed_by = 0;
var $action_request claimed_on = 0;
var $action_request comments = 0;
var $action_request group = 0;
var $action_request id = 0;
var $action_request resolved_by = 0;
var $action_request resolved_on = 0;
var $action_request submit_location = 0;
var $action_request submitted_by = 0;
var $action_request submitted_on = 0;
var $action_request summary = 0;
var $action_request text = 0;
var $action_request traceback = 0;
var $dmi_data descriptions = #[];
var $root created_on = 891384403;
var $root credit = ["Created 31-Mar-1998, Brandon Gillespie"];
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core];
var $root inited = 1;
var $root managed = [$action_request];
var $root manager = $action_request;
var $root quota_exempt = 1;

public method ._fmt_hd() {
    arg v, @flags;
    var b;
    
    return (<$format, ["td", flags, [(<$format, ["b", [], [v], 'do_b]>)], 'do_td]>);
};

public method ._gen_html_cmt() {
    var c, form;
    
    c = $cml_lib;
    form = [c.fmt_input(["type", "hidden"], ["name", "id"], ["value", .id()]), c.fmt_input(["type", "hidden"], ["name", "resolv"], ["value", "no"]), c.fmt_textarea([], ["rows", "4"], ["cols", "80"], ["name", "comment"]), c.fmt_table("40%,60%", c.fmt_tr(c.fmt_td(c.fmt_input(["type", "submit"], ["value", "\"Add Comment\""]), ["align", "center"]), c.fmt_td([" Pre-formatted text: ", c.fmt_input(["type", "checkbox"], ["name", "pre"])], ["align", "right"], ["valign", "center"])), c.fmt_tr(c.fmt_td(c.fmt_b(c.fmt_input(["type", "button"], ["onClick", "\"javascript:cmtForm.resolv.value='yes'; cmtForm.submit()\""], ["value", "RESOLVE"])), ["align", "center"]), c.fmt_td([" Mail Notification: ", c.fmt_input(["type", "checkbox"], ["name", "mailmsg"], ["value", "yes"], ["checked", ""])], ["align", "right"], ["valign", "center"])))];
    return c.fmt_form(form, ["name", "cmtForm"], ["action", "change"]);
};

public method ._gen_html_sgroup() {
    var g, grp, f, v;
    
    grp = [];
    for g in ($argroup.children()) {
        v = [["value", ("\"" + g) + "\""]];
        if (g == group)
            v += [["selected", ""]];
        grp += [(<$format, ["option", v, g.name(), 'do_option]>)];
    }
    grp = [(<$format, ["select", [["name", "group"], ["onChange", "javascript:form.submit()"]], grp, 'do_select]>)];
    grp += [(<$format, ["input", [["type", "hidden"], ["name", "id"], ["value", .id()]], [], 'do_input]>)];
    grp = [(<$format, ["form", [["action", "/ar/change"]], grp, 'do_form]>)];
    return grp;
};

public method .add_comment() {
    arg cmt, @name;
    var c;
    
    //// Commenting out the perms check so people that aren't admins can at 
    //// least add comments. -- Bruce
    // (> group.perms(sender(), 'trusts) <);
    if (type(cmt) != 'list)
        throw(~type, "Comment must be a list of strings");
    if (sender() == $page_ar)
        [(name ?= sender().namef('ref))] = name;
    else
        name = sender().namef('ref);
    comments += [[time(), name, cmt]];
};

public method .change_group() {
    arg newgrp;
    
    (sender() == $page_ar) || (> group.perms(sender(), 'trusts) <);
    newgrp.add_request(this());
    group.del_request(id);
    group = newgrp;
};

public method .claim() {
    (> group.perms(sender(), 'trusts) <);
    claimed_on = time();
    claimed_by = sender();
    group.request_claimed(claimed_by);
};

public method .claimed_by() {
    return claimed_by;
};

public method .claimed_on() {
    return claimed_on;
};

public method .comments() {
    return comments;
};

public method .format() {
    arg @html_view;
    var s, out, len, pre, c, r, row, cb, cm;
    
    len = user() ? (user().linelen()) : 79;
    if (!valid(submitted_by))
        submitted_by = $no_one;
    c = $cml_lib;
    r = [["align", "right"]];
    cb = [["bgcolor", "#eeeeee"]];
    out = [c.fmt_tr(c.fmt_td(c.fmt_subj("Ticket ID:", 3), @r), c.fmt_td(c.fmt_subj("#" + id, 3)))];
    out += [c.fmt_tr(._fmt_hd("Bug Report:", @r), c.fmt_td(this()))];
    if (submit_location)
        out += [c.fmt_tr(._fmt_hd("Reported From:", @r), c.fmt_td(submit_location.namef('ref)))];
    out += [c.fmt_tr(._fmt_hd("Reported By:", @r), c.fmt_td(submitted_by.namef('ref)))];
    out += [c.fmt_tr(._fmt_hd("Reported On:", @r), c.fmt_td($time.format("%d-%h-%Y", submitted_on)))];
    if (resolved_on) {
        out += [c.fmt_tr(._fmt_hd("Resolved By:", @r), c.fmt_td(resolved_by.namef('ref)))];
        out += [c.fmt_tr(._fmt_hd("Resolved On:", @r), c.fmt_td($time.format("%d-%h-%Y", resolved_on)))];
    } else {
        out += [c.fmt_tr(._fmt_hd("Resolved:", @r), c.fmt_td("UNRESOLVED"))];
    }
    if (claimed_on) {
        out += [c.fmt_tr(._fmt_hd("Claimed By:", @r), c.fmt_td(claimed_by.namef('ref)))];
        out += [c.fmt_tr(._fmt_hd("Claimed On:", @r), c.fmt_td($time.format("%d-%h-%Y", claimed_on)))];
    } else {
        out += [c.fmt_tr(._fmt_hd("Claimed:", @r), c.fmt_td("UNCLAIMED"))];
    }
    
    // hacky
    if (html_view)
        out += [c.fmt_tr(._fmt_hd("Bug Group:", @r), c.fmt_td(._gen_html_sgroup()))];
    else
        out += [c.fmt_tr(._fmt_hd("Bug Group:", @r), c.fmt_td(group.namef('ref)))];
    out += [c.fmt_tr(._fmt_hd("Summary:", @r), c.fmt_td(summary, @cb))];
    if (traceback)
        out += [c.fmt_tr(._fmt_hd("ASSOCIATED TRACEBACK:", @r), c.fmt_td(c.fmt_quote(traceback.join("\n")), @cb))];
    if (text) {
        out += [c.fmt_tr(c.fmt_td(c.fmt_hr(), ["colspan", 2]))];
        s = [];
        for row in (text)
            s += [row, c.fmt_p()];
        out += [c.fmt_tr(c.fmt_td(s, @cb, ["colspan", 2]))];
    }
    for cm in (comments) {
        s = [c.fmt_hr(), c.fmt_b([((("On " + ($time.format("%d-%h-%Y", cm[1]))) + " ") + (cm[2])) + " Comments:"]), c.fmt_p(), cm[3]];
        out += [c.fmt_tr(c.fmt_td(s, ["colspan", 2]))];
    }
    
    // hacky
    if (html_view)
        out += [c.fmt_tr(c.fmt_td([c.fmt_hr(), ._gen_html_cmt()], ["colspan", 2]))];
    return $ctext_frob.new_with([c.fmt_table("20%,80%", @out)]);
};

public method .general_info() {
    return [this(), resolved_on, submitted_on, summary, claimed_by];
};

public method .group() {
    return group;
};

public method .id() {
    return id;
};

public method .resolve() {
    arg @who;
    
    (sender() == $page_ar) || (> group.perms(sender(), 'trusts) <);
    if (who && (sender() == $page_ar))
        who = who[1];
    else
        who = sender();
    resolved_on = time();
    resolved_by = who;
    group.request_resolved(resolved_on);
};

public method .resolved_by() {
    return resolved_by;
};

public method .resolved_on() {
    return resolved_on;
};

private method .set_request() {
    arg nid, ngroup, nsummary, ntext, ntb, nbywhom;
    
    id = nid;
    group = ngroup;
    summary = nsummary;
    text = ntext;
    if (ntb)
        traceback = ntb;
    submitted_by = nbywhom;
    submitted_on = time();
    submit_location = (| nbywhom.location() |) || 0;
    comments = [];
};

public method .submit_location() {
    return submit_location;
};

public method .submit_request() {
    arg id, summary, text, traceback, bywhom;
    var new, who, loc;
    
    if (caller() != $argroup)
        throw(~perm, "Caller is not $argroup.");
    new = .spawn();
    return new.set_request(id, sender(), summary, text, traceback, bywhom);
};

public method .submitted_by() {
    return submitted_by;
};

public method .submitted_on() {
    return submitted_on;
};

public method .summary() {
    return summary;
};

public method .text() {
    return text;
};

public method .traceback() {
    return traceback;
};

root method .uninit_action_request() {
    (| group.del_request(id) |);
};


