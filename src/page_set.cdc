
new object $page_set: $page;

var $dmi_data descriptions = #[['submit_new, #[['args, #[["www-show-descriptions", [[], []]], ["www-show-line-num", [[], []]], ["www-show-methods", [[], []]], ["www-show-variables", [[], []]]]]]]];
var $page_set descs = #[];
var $page_set prefs = #[["www-show-line-num", "Show line numbers in methods"], ["www-show-methods", "Show methods on object displays"], ["www-show-variables", "Show variables on object displays"], ["www-show-descriptions", "Show descriptions on object displays"]];
var $root created_on = 999486860;
var $root credit = ["Brandon Gillespie, 2001"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_set];
var $root manager = $page_set;

public method .config() {
    arg header, info, args;
    var text, user, value, boolean, pref;
    
    user = info['run_as];
    text = .build_header(header, info, args, #[['title, "Configure Web Preferences"]]);
    text += ["<form action=\"/desktop/web_prefs/submit_new\" method=\"post\">"];
    text += ["<table><tr><th>Preference</th><th>Yes</th><th>No</th></tr>"];
    for pref in (prefs) {
        value = user.get_setting(pref[2], $www_preferences);
        text += [((("<tr><td>" + (pref[1])) + "</td>") + (map boolean in ([1, 0]) to (((((("<td><input type=\"radio\" name=\"" + (pref[2])) + "\" value=\"") + (boolean ? "1" : "0")) + "\" ") + ((value == boolean) ? "checked" : "")) + "></td>").join(""))) + "</tr>"];
    }
    text += ["</table>"];
    text += ["<input type=submit name=\"Submit new preferences\"><input type=reset>"];
    text += ["</form>", @.build_footer(header, info, args)];
    return [text];
};

public method .set_change() {
    arg header, info, args;
    var page, setting, target, set, def, v, i, dv;
    
    (> .perms(info['run_as], sender()) <);
    set = (| args["set"] |);
    if (!set)
        return $http_interface.response(404, "Invalid Setting");
    page = .build_header(header, info, args);
    [target, setting] = split(set, ":");
    target = lookup(tosym(target));
    page += [((("<b>Changing Setting for <a href=\"set_list?target=" + target) + "\">") + (target.namef('name))) + "</a></b>"];
    page += ["<form action=\"set_change_submit\" method=POST name=n>"];
    page += ["<p><table border=0>"];
    if (dict_contains(descs, (def + ":") + setting))
        page += [("<tr><td></td><td>" + (descs[(def + ":") + setting])) + "</td></tr>"];
    def = target.setting_definer(setting);
    dv = (target.format_setting(setting, def, target.get_setting(setting, def))).html_escape();
    if (dict_contains(args, "value"))
        v = args["value"];
    else
        v = dv;
    page += ["<script language=\"Javascript\">"];
    page += ["function x_revert() {", ("document.n[\"" + set) + "\"].value ="];
    page += [("\"" + dv) + "\"; }", "</script>"];
    page += [((("<tr><td><p>@set&nbsp;<b>" + target) + ":") + setting) + "=</b></td>"];
    page += [((("<td><input name=\"" + set) + "\" value=\"") + v) + "\" size=40>"];
    page += ["</td></tr><tr><td></td><td>"];
    page += ["<b><input type=submit value=\"Change\"></b>"];
    page += [" <input type=button value=\"Revert\" onClick=\"x_revert()\">"];
    if (dict_contains(args, "msg"))
        page += [("<p><font color=\"#990000\">" + (args["msg"])) + "</font>"];
    page += ["</td></tr></table>", "</form>"];
    return page;
};

public method .set_change_submit() {
    arg header, info, args;
    var page, setting, target, set, def, v, i;
    
    (> .perms(info['run_as], sender()) <);
    if (((args.keys()).length()) > 1)
        return $http_interface.response(404, "Too Many Settings...");
    set = (args.keys())[1];
    [target, setting] = split(set, ":");
    target = lookup(tosym(target));
    def = target.setting_definer(setting);
    catch any
        sender().as_this_run(target, 'set_setting, [setting, def, args[set]]);
    with
        return ['redirect, (((("set_change?set=" + set) + "&msg=") + ($http.encode((traceback()[1])[2]))) + "&value=") + ($http.encode(args[set]))];
    return ['redirect, ("set_change?set=" + set) + "&msg=Setting+Changed"];
};

public method .set_list() {
    arg header, info, args;
    var text, opts, def, target, ts, s, v, e, g, line, sc;
    
    (> .perms(info['run_as], sender()) <);
    opts = #[['title, "Configure Web Preferences"]];
    text = .build_header(header, info, args, opts);
    target = (| args["target"] |);
    if (target == "me")
        target = sender();
    else if ((!target) || (!(target = (| $object_lib.to_dbref(target) |))))
        return $http_interface.response(404, "Object not found.");
    sc = ((info['generate]) + "?target=") + target;
    text += [((("<b><a href=\"" + sc) + "\">Settings for ") + (target.namef('name))) + "</a></b>"];
    text += [(" (@set " + target) + ":)<p>"];
    text += ["<p><i>Select setting group to see settings, or"];
    text += [("<a href=\"" + sc) + "&e=all\">expand all groups</a></i><p>"];
    text += ["<style type=\"text/css\">"];
    text += ["td { font-size: 10pt; }", "th { font-size: 10pt; }"];
    text += ["</style>"];
    text += ["<table border=0>"];
    ts = target.objname();
    e = (| args["e"] |);
    if (e == "all")
        e = -1;
    g = "none";
    for s in (sender().format_settings(target, 1)) {
        if (type(s) == 'string) {
            s = strsed(s, "[: ]+$", "");
            line = "<tr><td colspan=3>";
            if ((e == (-1)) || (e == s)) {
                line += ("<a href=\"" + sc) + "\">[-]&nbsp;";
                g = 1;
            } else {
                line += ((("<a href=\"" + sc) + "&e=") + s) + "\">[+]&nbsp;";
                g = 0;
            }
            s = lookup(tosym(substr(s, 2)));
            line += (s.namef('ref)) + ":</td></tr>";
            text += [line];
        } else if ((e == (-1)) || g) {
            [s, v] = regexp(s[1], "^([^=]+)= *(.*)$");
            s = s.trim();
            text += [((((("<tr><td width=5>&nbsp;&nbsp;&nbsp;</td><td><a href=\"set_change?set=" + ts) + ":") + s) + "\">") + s) + "</a>=</td>"];
            text += [("<td>" + v) + "</td>"];
        }
    }
    text += ["</table>"];
    return text;
};

public method .set_objlist() {
    arg header, info, args;
    var o, list, page, opts, t, user, e, n, c;
    
    (> .perms(info['run_as], sender()) <);
    user = info['run_as];
    opts = #[['title, "Configure Web Preferences"]];
    page = .build_header(header, info, args, opts);
    page += ["<style type=\"text/css\">"];
    page += ["td { font-size: 10pt; }", "th { font-size: 10pt; }"];
    page += ["</style>"];
    c = $cml_lib;
    e = (| args["e"] |);
    if (e == "m") {
        t = user.as_this_run(user, 'audit_cmd__manages, [user, 'expand, 'set]);
    } else {
        n = ("[+] Managed by " + (user.namef('ref))) + ":";
        t = [c.fmt_tr(c.fmt_td(c.fmt_href("set_objlist?e=m", n), ["colspan", "3"]))];
    }
    if (e == "w") {
        t += user.as_this_run(user, 'audit_cmd__writes, [user, 'expand, 'set]);
    } else {
        n = ("[+] Writable for " + (user.namef('ref))) + ":";
        t += [c.fmt_tr(c.fmt_td(c.fmt_href("set_objlist?e=w", n), ["colspan", "3"]))];
    }
    if (e == "t") {
        t += user.as_this_run(user, 'audit_cmd__trusted, [user, 'expand, 'set]);
    } else {
        n = ("[+] Objects which trust " + (user.namef('ref))) + ":";
        t += [c.fmt_tr(c.fmt_td(c.fmt_href("set_objlist?e=t", n), ["colspan", "3"]))];
    }
    page += [$ctext_frob.new_with([$cml_lib.fmt_table("60%,13%,27%", t)])];
    return page;
};

public method .submit_new() {
    arg header, info, args;
    var pref, user;
    
    user = info['run_as];
    for pref in (prefs.slice(2))
        user.set_www_preferences(pref, args[pref]);
    return ['redirect, @header["Referer"]];
};


