
new object $motd: $utilities;

var $motd connect_help = ["Connection Help", "===============", "", "  Connecting as a guest:  'guest <name> <email>'", "                Example:  'guest John Doe johndoe@domain.com'", "", "   Connecting as a user:  'connect <name> <password>'", "                Example:  'connect John Doe mypassword'", "", " Quitting (this screen):  '@quit'   or   'quit'", "", "Connected Users Listing:  '@who'", "", "        Creating a user:  'create <name> <password> <email@host>'", "                Example:  'connect John Doe mypassword johndoe@domain.com'"];
var $motd notes = ["", "Due to a disk failure we have reverted to an older copy of the db", "If you had a user but do not now, this is why.", "Sorry!", ""];
var $motd server_name = "ColdCore";
var $motd server_title = "Virtual Community Server";
var $motd server_url = "http://none:1180/";
var $motd welcome_notes = [];
var $root created_on = 796268969;
var $root defined_settings = #[["server-name", #[['get, ['get_server_name_setting]], ['set, ['set_server_name_setting]]]], ["server-title", #[['get, ['get_server_title_setting]], ['set, ['set_server_title_setting]]]], ["login-sequence", #[['parse, ['is_type, 'list]]]]];
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_motd;
var $root inited = 1;
var $root managed = [$motd];
var $root manager = $motd;
var $root settings = #[["login-sequence", ['default]]];

public method .build() {
    arg @args;
    var output, out, line;
    
    output = [];
    if (!args)
        args = ['long, 'quote];
    if ((args[1]) == 'default)
        args = ['name, "", 'title, "", "", 'quote, "", 'notes, 'admins, "", 'connected, 'core_version, 'driver_version, 'help, ""];
    while (args) {
        if (type(args[1]) == 'string) {
            output += [""];
        } else {
            switch (args[1]) {
                case 'long:
                    args = ['title, 'long_name] + sublist(args, 2);
                    continue;
                case 'short:
                    args = ['title, 'name] + sublist(args, 2);
                    continue;
                case 'title:
                    output += [server_title.center(79)];
                case 'name:
                    output += [(("+ " + server_name) + " +").center(79)];
                case 'notes:
                    output += notes.center_lines(79);
                case 'quote:
                    output += ($code_lib.random_quote()).center_lines(79);
                case 'admins:
                    out = ($list.to_english($list.mmap($sys.admins(), 'name))).wrap_lines(50);
                    line = out[1];
                    output += (["Administrators: " + line] + delete(out, 1)).mmap('center, 79);
                case 'connected:
                    out = "Currently Connected users: ";
                    out += tostr(($user_db.connected()).length());
                    out = out.center(79);
                    output += [out];
                case 'version:
                    args = ['driver_version, 'core_version] + sublist(args, 2);
                    continue;
                case 'driver_version:
                    out = "Driver: " + ($sys.server_info('driver_version, 'long));
                    output += [out.center(79)];
                case 'core_version:
                    out = "Core: " + ($sys.server_info('core_version, 'long));
                    output += [out.center(79)];
                case 'help:
                    out = " ** Use 'Help' for a list of commands**";
                    output += [out.center(79)];
            }
        }
        args = delete(args, 1);
    }
    return output;
};

public method .build_html() {
    arg @args;
    var page, p;
    
    // this is your home page, change it as you whim may direct you
    p = "<p align=center>";
    page = [("<head><title>" + server_name) + "</title></head>"];
    page += ["<body bgcolor=\"#000000\" text=\"#ffefef\" link=\"#b000f0\" vlink=\"#9000c0\" alink=\"#f000f0\">"];
    page += [("<h1 align=center>" + server_name) + "</h1>"];
    page += [("<h3 align=center>" + server_title) + "</h1>"];
    page += ([p + "<tt>"] + ($code_lib.random_quote())) + ["</tt>"];
    page += [p] + notes;
    page += [(p + "Administrators: ") + ((($sys.admins()).mmap('hname)).to_english())];
    page += ["<br><a href=\"/bin/who\">Currently Connected users</a>: " + ($user_db.total_connected())];
    page += [("<br>Server Lag: " + ($lag_watcher.lag())) + " seconds."];
    page += ["<br>Driver: <b><a href=\"http://www.cold.org/Software/Genesis/\">Genesis</a></b> " + ($sys.server_info('driver_version)), ("<br>Core: <b>" + ($sys.server_info('core_version, 'long))) + "</b>"];
    
    // page += ["<p align=center><a href=\"http://" + $sys.server_info('server_hostname) + "/login/\"><b><i>Enter the Cold Dark</i></b></a>"
    page += ["<p><hr size=1 noshade width=\"50%\"><p align=center><b>"];
    page += ["<a href=\"http://www.cold.org/Software/ColdCore/newadmin.html\">New Admins Guide</a> |", "<a href=\"/bin/describe?target=introtut_start\">Tutorial</a> |", "<a href=\"http://www.cold.org/~faq/cold.html\">FAQ</a> |", "<a href=\"/bin/help?node=help_coldc\">Programmer's Manual</a> |", "<a href=\"/bin\">Gateways</a> |", "<a href=\"/bin/help\">Help System</a>"];
    page += ["</b><p><hr size=1 noshade width=\"50%\">"];
    return page;
};

public method .connect_help() {
    return connect_help;
};

root method .core_motd() {
    server_url = "http://none:1180/";
    .del_method('build_html);
    .rename_method('core_build_html, 'build_html);
    server_name = "ColdCore";
    server_title = "Virtual Community Server";
    welcome_notes = [];
};

public method .get_server_name_setting() {
    arg @args;
    
    return server_name;
};

public method .get_server_title_setting() {
    arg @args;
    
    return server_title;
};

public method .server_name() {
    return server_name;
};

public method .server_title() {
    return server_title;
};

public method .server_url() {
    return ((("http://" + ($dns.hostname(""))) + ":") + ($http_daemon.current_port())) + "/";
};

public method .set_connect_help() {
    arg text;
    
    (> .perms(sender(), 'manager) <);
    connect_help = text;
};

public method .set_motd() {
    arg what, value;
    
    (> .perms(sender()) <);
    if (!(what in (.variables())))
        throw(~motd, (toliteral(what) + " is not a valid motd variable, try one of: ") + toliteral(.variables()));
    if (!(type(value) in ['string, 'list]))
        throw(~motd, "Value must be sent as a string or a list of strings.");
    set_var(what, value);
};

protected method .set_server_name_setting() {
    arg name, definer, value, @args;
    
    server_name = value;
};

protected method .set_server_title_setting() {
    arg name, definer, value, @args;
    
    server_title = value;
};

public method .tcd_build_html() {
    arg @args;
    
    return [("<head><title>" + server_name) + "</title></head>", "<body bgcolor=\"#000000\" text=\"#ffefef\" link=\"#b000f0\" vlink=\"#9000c0\" alink=\"#f000f0\">", "<p align=center><img src=\"http://www.cold.org/images/tCD.gif\" alt=\"The Cold Dark\"></p>", ("<h3 align=center>" + server_title) + "</h3>", "<p align=center><tt>", @$code_lib.random_quote(), "</tt></p>", "<p align=center>", @notes, "</p>", ("<p align=center>Administrators: " + ((($sys.admins()).mmap('hname)).to_english())) + "<br>", ("<a href=\"/bin/who\">Currently Connected users</a>: " + tostr($user_db.total_connected())) + "<br>", ("Server Lag: " + ($lag_watcher.lag())) + " seconds.<br>", "Driver: <b><a href=\"http://www.cold.org/Software/Genesis/\">Genesis</a></b> " + ($sys.server_info('driver_version)), ("<br>Core: <b>" + ($sys.server_info('core_version, 'long))) + "</b>", ("<p align=center><a href=\"http://" + ($sys.server_info('server_hostname))) + "/login/\"><b><i>Enter the Cold Dark</i></b></a>", "<p align=center>The Cold Dark is a Virtual Environment System.  There is no game in the Cold Dark, the purpose is to create a core which expands the physicality of a Virtual Environment.  To further explore the database, follow the <a href=\"/start.html\">Database Starting Points</a> link.</p>", "<hr>", "<p align=center>", "<a href=\"/history.html\"><b>History</b></a> |", "<a href=\"/features.html\"><b>Features</b></a> |", "<a href=\"http://www.cold.org/Intro/\"><b>Introduction</b></a> |", "<a href=\"/start.html\"><b>DB Starting Points</b></a>", "</p>"];
};

public method .welcome_notes() {
    return welcome_notes;
};


