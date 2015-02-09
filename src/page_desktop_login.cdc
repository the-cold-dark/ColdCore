
new object $page_desktop_login: $page;

var $dmi_data descriptions = #[['generate, #[['args, #[]], ['auth, [$security_lib, 'check_userdb_with_password, []]]]]];
var $root created_on = 864277988;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_desktop_login];
var $root manager = $page_desktop_login;

public method .content_frame() {
    arg headers, info, args;
    
    return ((info['directory_object]).build_header(headers, info, args, #[['title, "User Desktop"]])) + ["Content Frame", "</body>", "</html>"];
};

public method .generate() {
    arg headers, info, args;
    var page, opts, i;
    
    opts = #[['title, "User: " + ((info['run_as]).namef('name))], ['nobody, 1]];
    page = (info['directory_object]).build_header(headers, info, args, opts);
    if (dict_contains(args, "type") && ((args["type"]) == "interactive")) {
        i = "yes";
        page += ["<frameset rows=\"40,*,50%\" framespacing=\"0\" border=\"0\">"];
    } else {
        i = "no";
        page += ["<frameset rows=\"40,*\" framespacing=\"0\" border=\"0\">"];
    }
    page += [("<frame name=\"nav\" src=\"/desktop/nav?i=" + i) + "\" scrolling=no frameborder=\"0\">"];
    page += ["<frame name=\"content\" src=\"/motd/?inframe\" frameborder=\"0\">"];
    if (i)
        page += ["<frame name=\"login\" src=\"/desktop/interactive\" scrolling=no frameborder=\"0\">"];
    page += ["</frameset>", "<noframe>", "<body bgcolor=\"#ffffff\">"];
    page += ["You must support frames", "</body>", "</noframe>", "</html>"];
    return page;
};

public method .interactive() {
    arg headers, info, args;
    var page, user, cinfo;
    
    user = (| (headers['interface]).get_info('run_as) |);
    cinfo = ((info['browser_auth])[2]).join(" ");
    page = (info['directory_object]).build_header(headers, info, args);
    page += ["<style type=\"text/css\">"];
    page += ["BODY { margin-left: 0; margin-right: 0; margin-top: 0; margin-botton: 0; }"];
    page += ["</style>"];
    page += ["<applet CODEBASE=\"/file/CupOmud/\" code=\"CupOmud.class\""];
    page += ["height=100% width=100%"];
    page += ["alt=\"Sorry, you browser does not have JAVA enabled.\">"];
    page += ["<PARAM NAME=\"host\"           value=\"www.cold.org\">"];
    page += ["<PARAM NAME=\"port\"           VALUE=\"1138\">"];
    page += ["<PARAM NAME=\"sysname\"        VALUE=\"the Cold Dark\">"];
    page += ["<PARAM NAME=\"MCP\"            VALUE=\"yes\">"];
    page += ["<PARAM NAME=\"input_bgcolor\"  VALUE=\"#d0b0b0\">"];
    page += ["<PARAM NAME=\"input_fgcolor\"  VALUE=\"#000000\">"];
    page += ["<PARAM NAME=\"output_bgcolor\" VALUE=\"#e0e0e0\">"];
    page += ["<PARAM NAME=\"output_fgcolor\" VALUE=\"#000000\">"];
    page += [("<PARAM NAME=\"command\" VALUE=\"connect " + cinfo) + "\">"];
    
    // page += ["<PARAM NAME=\"command\"        VALUE=\"help\">"];
    page += ["<p>If your browser does not support JAVA, you can try a raw"];
    page += ["connection (not a preferred method):"];
    page += ["<p><a href=\"telnet://ice.cold.org:1138/\">telnet://ice.cold.org:1138</a>"];
    page += ["</applet>"];
    page += ["</body>"];
    return page;
};

public method .nav() {
    arg headers, info, args;
    var i, page, opts, user, s, e, links;
    
    user = (| (headers['interface]).get_info('run_as) |);
    opts = #[['title, "User Desktop"]];
    e = (| args["e"] |);
    i = (| args["i"] |);
    s = info['generate];
    page = (info['directory_object]).build_header(headers, info, args, opts);
    page += ["<style type=text/css>"];
    page += ["BODY { margin-left: 0; margin-right: 5; margin-top: 0; }"];
    page += ["</style>"];
    page += ["<table border=\"0\" width=\"100%\" cellspacing=0 cellpadding=0>"];
    page += ["<tr><td valign=top><img src=\"/file/tcd-title.gif\" width=245 height=40></td>"];
    page += ["<td valign=top width=\"100%\"><font size=\"-1\">"];
    page += ["<a target=\"content\" href=\"/motd/?inframe\">[o] Home</a> | "];
    links = [];
    if (e == "docs") {
        page += [("<a href=\"" + s) + "\">[-] Documentation</a> | "];
        links += ["<a target=\"content\" href=\"/bin/help\">ColdCore Help</a> | "];
        links += ["<a target=\"content\" href=\"/bin/describe?target=introtut_start\">Introductory Tutorial</a> | "];
        links += ["<a target=\"content\" href=\"/bin/help?node=help_coldc\">ColdC Manual</a>"];
    } else {
        page += [("<a href=\"" + s) + "?e=docs\">[+] Documentation</a> | "];
    }
    if (e == "browse") {
        page += [("<a href=\"" + s) + "\">[-] Browse</a> | "];
        links += ["<a target=\"content\" href=\"/bin/describe\">the VR World</a> |"];
        links += ["<a target=\"content\" href=\"/bin/object\">ColdC Objects</a> |"];
        links += ["<a target=\"content\" href=\"/bin/who\">Who is Online</a> |"];
        links += ["<a target=\"content\" href=\"/ar/\">Action Tracking</a>"];
    } else {
        page += [("<a href=\"" + s) + "?e=browse\">[+] Browse</a> | "];
    }
    if (e == "set") {
        page += [("<a href=\"" + s) + "\">[-] Settings</a>"];
        links += ["<a href=\"/set/set_list?target=me\" target=\"content\">My Settings</a> |"];
        links += ["<a href=\"/set/set_objlist\" target=\"content\">My Objects' Settings</a> |"];
        links += ["<xa href=\"/set/msg\" target=\"content\">My Messages</xa> | "];
        links += ["<xa href=\"/set/msg\" target=\"content\">My Objects' Messages</xa>"];
    } else {
        page += [("<a href=\"" + s) + "?e=set\">[+] Settings</a>"];
    }
    if (i == "yes")
        page += ["<a target=_top href=\"/desktop/?type=non-interactive\">[+] Non-Interactive Login</a>"];
    else
        page += ["<a target=_top href=\"/desktop/?type=interactive\">[+] Interactive Login</a>"];
    page += ["<br>"];
    if (links)
        page += ["&nbsp;=&gt;"] + links;
    page += ["</font></td>", ("<td align=right valign=top>(User:&nbsp;" + ((user.namef('name)).replace(" ", "&nbsp;"))) + ")</td></tr></table>"];
    page += ["</body>", "</html>"];
    return page;
};


