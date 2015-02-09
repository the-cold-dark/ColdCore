
new object $motd: $page;

var $motd connect_help = ["Connection Help", "===============", "", "  Connecting as a guest:  'guest <name> <email>'", "                Example:  'guest John Doe johndoe@domain.com'", "", "   Connecting as a user:  'connect <name> <password>'", "                Example:  'connect John Doe mypassword'", "", " Quitting (this screen):  '@quit'   or   'quit'", "", "Connected Users Listing:  '@who'", "", "        Creating a user:  'create <name> <password> <email@host>'", "                Example:  'create John Doe mypassword johndoe@domain.com'"];
var $motd notes = ["** Welcome to your new ColdCore, use the command 'help' to **", "** learn more about how to connect with the 'create' command **"];
var $motd server_name = "ColdCore";
var $motd server_title = "Virtual Community Server";
var $motd server_url = "http://none:1180/";
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
                    output += (notes.center_lines(79)) + [""];
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

public method .connect_help() {
    return connect_help;
};

root method .core_motd() {
    (| .del_method('generate) |);
    (| .rename_method('core_generate, 'generate) |);
    server_url = "http://none:1180/";
    server_name = "ColdCore";
    server_title = "Virtual Community Server";
    notes = ["** Welcome to your new ColdCore, use the command 'help' to **", "** learn more about how to connect with the 'create' command **"];
};

public method .generate() {
    arg @args;
    var page, l;
    
    // this is your home page, change it as you whim may direct you
    page = $directories.build_header(#[], #[], #[]);
    if ((l = $directories.get_server_name_img()))
        page += [l];
    else
        page += [("<h1>" + server_name) + "</h1>"];
    page += (["<p align=center><i><tt>"] + ($code_lib.random_quote())) + ["</tt></i>"];
    if (server_title)
        page += [("<h3>" + server_title) + "</h3>"];
    if (notes) {
        page += ["<table align=center border=0><tr><td bgcolor=\"#cccccc\">"];
        page += [(notes.prefix("<br>")).affix("<br>")];
        page += ["</td></tr></table>"];
    }
    page += ["<p><b>Things to do from here:</b>"];
    page += ["<ul>"];
    page += ["<li>Login <a href=\"/file/jlogin/index.html\">Interactively</a> or "];
    page += ["<a href=\"/desktop/\">Non-Interactively</a><br>"];
    page += ["<li>See <a href=\"/bin/who\">Who is Online</a><br>"];
    page += ["<li>Browse <a href=\"/bin/describe\">the VR World</a>,"];
    page += ["<a href=\"/bin/object\">ColdC Objects</a>"];
    page += [" or <a href=\"/ar\">Action Requests</a><br>"];
    page += ["<li>Read documentation: <a href=\"/bin/help\">Help Files</a>,"];
    page += [" <a href=\"/bin/describe?target=introtut_start\">Introductory Tutorial</a>"];
    page += [" or <a href=\"/bin/help?node=help_coldc\">the ColdC Manual</a>"];
    page += ["</ul>"];
    page += ["<p align=left>", "<table border=0>"];
    page += ["<tr><th valign=top align=left>Administrators:</th>"];
    page += [("<td>" + ((($sys.admins()).mmap('hname)).to_english())) + "</td></tr>"];
    page += ["<tr><th valign=top align=left>Current&nbsp;Users:</th>"];
    page += [("<td>" + ($user_db.total_connected())) + " (<a href=\"/bin/who\">Get List</a>)</td></tr>"];
    page += ["<tr><th valign=top align=left>Server Lag:</th>"];
    page += [("<td>" + ($lag_watcher.lag())) + " seconds.</td></tr>"];
    page += ["<tr><th valign=top align=left>Driver: </th>"];
    page += [("<td><a href=\"http://www.cold.org/Software/Genesis/\">Genesis</a> " + ($sys.server_info('driver_version))) + "</td></tr>"];
    page += ["<tr><th valign=top align=left>Core:</th>"];
    page += [("<td>" + ($sys.server_info('core_version, 'long))) + "</td></tr>"];
    page += ["</body>"];
    return page;
};

public method .get_default_css() {
    arg @args;
    
    return default_css;
};

public method .get_server_name_img() {
    arg @args;
    
    return server_name_img;
};

public method .get_server_name_setting() {
    arg @args;
    
    return server_name;
};

public method .get_server_title_setting() {
    arg @args;
    
    return server_title;
};

public method .notes() {
    return notes;
};

protected method .parse_default_css() {
    arg file;
    
    if (file) {
        //catch ~file {
        (> $file.fstat("html/" + file) <);
    
        // } with {
    }
    return file;
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

protected method .set_default_css() {
    arg name, definer, value, @args;
    
    // called by @set
    default_css = value;
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

public method .set_notes() {
    arg notes;
    
    (> .perms(sender()) <);
    if (type(notes) != 'list)
        throw(~type, "notes must be a list of strings");
    set_var('notes, notes);
};

public method .set_server_name_img() {
    arg name, definer, value, @args;
    
    server_name_img = value;
};

protected method .set_server_name_setting() {
    arg name, definer, value, @args;
    
    server_name = value;
};

protected method .set_server_title_setting() {
    arg name, definer, value, @args;
    
    server_title = value;
};


