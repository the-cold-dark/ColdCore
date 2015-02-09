
new object $http_interface: $connection_interface;

var $command_cache commands = 0;
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $http_interface args = #[];
var $http_interface bytes = 205;
var $http_interface cache = [];
var $http_interface ctype = 0;
var $http_interface full = 0;
var $http_interface header = 0;
var $http_interface http = "HTTP/1.0";
var $http_interface info = #[['generate, 'change], ['script_name, "/aredit/change"], ['path_info, "/"], ['directory_object, $directories], ['lock_object, 0]];
var $http_interface keep_alive = 0;
var $http_interface method = "GET";
var $http_interface sent = 0;
var $http_interface status = 404;
var $root created_on = 863766118;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$http_interface];
var $root manager = $http_interface;
var $root quota_exempt = 1;

private method ._respond() {
    arg input, user;
    var output, t;
    
    switch (type(input)) {
        case 'list:
            output = `[];
            for t in (input)
                output += ._respond(t, user);
        case 'string:
            output = str_to_buf(input) + `[10];
        case 'buffer:
            output = input;
        case 'frob:
            output = $parse_lib.filter_ctext(input, #[['formatter, $html_format], ["viewer", user]]);
        default:
            output = str_to_buf((("Error, unable to send output type: " + type(input)) + " -- ") + input);
    }
    return output;
};

protected method .close_interface() {
    arg @args;
    var c;
    
    if ((!args) && keep_alive) {
        .reset_variables();
        return;
    }
    (.connection()).close();
};

public method .connection_going_away() {
    arg @args;
    
    (> .close() <);
};

public method .expand_url() {
    arg partial_url;
    var base;
    
    base = "http://" + ($http_daemon.site_url());
    switch (partial_url[1]) {
        case "?":
            return ((base + (info['script_name])) + (info['path_info])) + partial_url;
        case "/":
            return base + partial_url;
        default:
            return partial_url;
    }
};

public method .get_info() {
    arg key;
    
    return (> info[key] <);
};

private method .handle_authorization() {
    arg desc, page;
    var r, auth, page;
    
    if ((| info['browser_auth] |) || (| desc['auth] |)) {
        r = 'forbidden;
        if ((auth = (| desc['auth] |)) && (auth != 'none))
            r = ((desc['auth])[1]).((desc['auth])[2])(this(), @(desc['auth])[3]);
        else
            r = $security_lib.check_userdb_with_password(this());
        if (r) {
            switch (type(r)) {
                case 'list:
                    if ((r[1]) == 'redirect) {
                        r = .expand_url(r[2]);
                        .respond(.response(302, "Relocated at: " + r), "Location: " + r);
                        return 0;
                    } else {
                        .respond(.response(401, "Authorization Required"), ((("WWW-Authenticate: " + (r[1])) + " realm=\"") + (r[2])) + "\"");
                        return 0;
                    }
                case 'symbol:
                    .respond(.response(403, "Access forbidden"));
                    return 0;
            }
        }
    } else if (!(page.is($page))) {
        .respond(.response(500, ("Authorization info missing (" + page) + " is not a $page)"));
        return 0;
    }
    return 1;
};

private method .handle_lock_object() {
    var r, lock;
    
    lock = (info['lock_object]).get_lock();
    r = (lock[1]).(lock[2])(this(), @lock[3]);
    if (r) {
        switch (type(r)) {
            case 'list:
                if ((r[1]) == 'redirect) {
                    r = .expand_url(r[2]);
                    .respond(.response(302, "Relocated at: " + r), "Location: " + r);
                    return 0;
                } else {
                    status = 401;
                    .respond(.response(401, "Authorization Required"), ((("WWW-Authenticate: " + (r[1])) + " realm=\"") + (r[2])) + "\"");
    
                    //           .respond(["<HEAD><TITLE>Authorization Required</TITLE></HEAD>", "<BODY>", "<H1>Authorization Required</H1>", "Browser not authentication-capable or authentication failed.", "</BODY>"], "WWW-Authenticate: " + r[1] + " realm=\"" + r[2] + "\"");
                    return 0;
                }
            case 'symbol:
                .respond(.response(403, "Access forbidden"));
                return 0;
        }
    }
    return 1;
};

public method .header() {
    arg field;
    
    return (> header[field] <);
};

public method .http_method_GET() {
    arg @nopage;
    var page, r, desc, processed_args, final_args, item, lock;
    
    status = 200;
    page = $directories.find_page(info['path], this());
    if (page == 'pagenf) {
        .respond(.response(404, "Page not found"));
        return;
    } else if ((type(page) == 'list) && ((page[1]) == 'redirect)) {
        r = .expand_url(page[2]);
        .respond(.response(302, "Relocated at: " + r), "Location: " + r);
        return;
    }
    
    // get a lock, if necessary
    if (info['lock_object]) {
        if (!(.handle_lock_object()))
            return;
    }
    
    // process args
    catch any {
        desc = (| $interface_registry.describe(page, info['generate]) |) || ((| page.describe_method(info['generate]) |) || #[]);
        if ((| desc['args] |))
            processed_args = $adapter.process_args(args, desc['args]);
        else
            processed_args = args;
    } with {
        switch (error()) {
            case ~objnf:
                .respond(.response(500, "Object not found"));
                return;
            case ~missingarg:
                .respond(.response(500, "Missing Argument"));
                return;
            default:
                status = 500;
                .respond($parse_lib.html_traceback(traceback(), status));
                $sys.log($parse_lib.traceback(traceback()));
                return;
        }
    }
    
    // process Authentication, always auth user unless otherwise specified
    if (!(.handle_authorization(desc, page)))
        return;
    
    // generate the page
    catch any {
        if (page.is($page))
            final_args = [header, info, processed_args];
        else if ((| desc['arg_order] |))
            final_args = map item in (desc['arg_order]) to (processed_args[item]);
        else
            final_args = [];
        if ((| info['run_as] |))
            r = (info['run_as]).as_this_run(page, info['generate], final_args);
        else
            r = page.(info['generate])(@final_args);
        if (type(r) == 'list) {
            switch (r[1]) {
                case 'redirect:
                    page = .expand_url(r[2]);
                    .respond(.response(302, "Relocated at: " + page), "Location:  " + page);
                    return;
                case 'auth:
                    // do auth;
                    .respond(.response(401, "Authorization Required"), ((("WWW-Authenticate: " + ((r[2])[1])) + " realm=\"") + ((r[2])[2])) + "\" domain=\"/\"");
                    return;
                default:
                    if (type(r[1]) != 'list)
                        r = [r];
            }
        } else {
            r = [r];
        }
        if (r != [0])
            .respond(@r);
    } with {
        switch (error()) {
            case ~methodnf:
                .respond(.response(500, "Method not found: " + (info['generate])));
            default:
                status = 500;
                .respond($parse_lib.html_traceback(traceback(), status));
                $sys.log($parse_lib.traceback(traceback()));
        }
    }
    if (!sent)
        .respond(.response(500, "It should have generated a page by now"));
};

public method .http_method_HEAD() {
    var page, r, description, processed_args, final_args, item, lock;
    
    status = 200;
    page = $directories.find_page(info['path], this());
    if (page == 'pagenf) {
        status = 404;
        .respond([]);
        return;
    } else if ((type(page) == 'list) && ((page[1]) == 'redirect)) {
        r = .expand_url(page[2]);
        status = 302;
        .respond([], "Location: " + r);
        return;
    }
    if (info['lock_object]) {
        lock = (info['lock_object]).get_lock();
        r = (lock[1]).(lock[2])(this(), @lock[3]);
        if (r) {
            switch (type(r)) {
                case 'list:
                    if ((r[1]) == 'redirect) {
                        r = .expand_url(page[2]);
                        status = 302;
                        .respond([], "Location: " + r);
                        return;
                    } else {
                        status = 401;
                        .respond([], ((("WWW-Authenticate: " + (r[1])) + " realm=\"") + (r[2])) + "\"");
                        return;
                    }
                case 'symbol:
                    status = 403;
                    .respond([]);
                    return;
            }
        }
    }
    catch any {
        description = (| $interface_registry.describe(page, info['generate]) |) || ((| page.describe_method(info['generate]) |) || #[]);
        if ((| description['args] |))
            processed_args = $adapter.process_args(args, description['args]);
        else
            processed_args = #[];
    } with {
        status = 500;
        switch (error()) {
            case ~objnf:
                .respond([]);
                return;
            case ~missingarg:
                .respond([]);
                return;
            default:
                status = 500;
                .respond([]);
                $sys.log($parse_lib.traceback(traceback()));
                return;
        }
    }
    if ((| description['auth] |)) {
        if ((description['auth]) != 'none) {
            r = ((description['auth])[1]).((description['auth])[2])(this(), @(description['auth])[3]);
            if (r) {
                switch (type(r)) {
                    case 'list:
                        if ((r[1]) == 'redirect) {
                            r = .expand_url(page[2]);
                            status = 302.0.respond([], "Location: " + r);
                            return;
                        } else {
                            status = 401;
                            .respond([], ((("WWW-Authenticate: " + (r[1])) + " realm=\"") + (r[2])) + "\"");
                            return;
                        }
                    case 'symbol:
                        status = 403;
                        .respond([]);
                        return;
                }
            }
        }
    } else if (!(page.is($page))) {
        status = 500;
        .respond([]);
        return;
    }
    .respond([]);
};

protected method .http_method_POST() {
    var len, body, part;
    
    len = (| header["Content-Length"] |);
    if ((len == ~keynf) || (!len))
        (> .respond(.response(400, "No Content-Length.")) <);
    body = (.connection()).handle_POST_input(toint(len[1]));
    
    // handle this differently in normal situations
    for part in (body)
        args = dict_union(args, $http_lib.explode_http_encoding(part));
    .http_method_GET();
};

public method .info() {
    return info;
};

root method .init_http_interface() {
    .reset_variables();
};

protected method .log_request() {
    arg host;
    var line;
    
    line = (((((((((host + " - - \"") + method) + " ") + (info['URI])) + " ") + http) + "\" ") + tostr(status)) + " ") + tostr(bytes);
    if ((| header["User-Agent"] |))
        line = (line + ";; ") + ((header["User-Agent"]).join());
    $sys.log(line);
};

public method .parse_line() {
    arg line;
    var match, URI;
    
    if (!method) {
        if (!line)
            return;
        line = explode(line);
        if (listlen(line) != 3) {
            (.connection()).write(.response(400, "HTTP/0.9 not supported."));
            (.connection()).close();
            return;
        }
        if ((match = regexp(line[1], "^(GET|HEAD|POST)$"))) {
            info = #[['URI, line[2]]];
            method = match[1];
        } else {
            info = #[['URI, line[2]]];
            .respond(.response(405, ("Method: \"" + (line[1])) + "\"."));
            (.connection()).close();
            return;
        }
        http = line[3];
    } else if (line) {
        if ((match = regexp(line, "^([^:]+): *(.+)$"))) {
            if (((match[1]) == "Connection") && ((match[2]) == "Keep-Alive"))
                keep_alive = 1;
            else if ((match[1]) == "Authorization")
                .process_auth_info(match[2]);
            else
                header = header.add_elem(@match);
        }
    } else {
        // parse the URI
        match = $http_lib.explode_url(info['URI]);
        info = dict_union(info, match[1]);
        args = match[2];
        catch any {
            (> .(tosym("http_method_" + method))() <);
        } with {
            if (error() != ~stop)
                .respond($parse_lib.html_traceback(traceback(), (status = 500)));
        }
    }
};

public method .process_auth_info() {
    arg str;
    var user, pwd;
    
    str = str.explode();
    switch (str[1]) {
        case "Basic":
            [(user ?= ""), (pwd ?= "")] = ((str[2]).decode64()).explode(":");
            .set_info('browser_auth, ['basic, [user, pwd]]);
    
            // no MD5, no Digest support, blah
        default:
            $sys.log("$security_db: Unknown authorization type '" + (str[1]));
            .set_info('browser_auth, ['unknown, str]);
    }
};

protected method .reset_variables() {
    method = "";
    http = "HTTP/1.0";
    status = 200;
    bytes = 0;
    ctype = $http_lib.html_version();
    full = 1;
    header = #[['interface, sender()]];
    info = #[];
    args = #[];
};

public method .respond() {
    arg body, @rest;
    var host, out, user;
    
    if (!(sender().is($page)))
        (> .perms(sender(), 'writer) <);
    if (!(user = (| info['run_as] |)))
        user = $no_one;
    if (status >= 400)
        keep_alive = 0;
    out = ._respond(body, user);
    bytes = buflen(out);
    .send_header(@rest);
    (.connection()).write(out);
    host = (.connection()).address();
    .log_request(host);
    .close_interface();
    sent = 1;
};

public method .respond_with_file() {
    arg fstat, filename;
    var host, tzadjust, datestr, retry, havefile, c, filetb;
    
    if (!(sender().is($page)))
        (> .perms(sender(), 'writer) <);
    bytes = fstat[2];
    catch ~range {
        tzadjust = localtime()[12];
        datestr = "%a, %d %b %Y %H:%M:%S GMT";
        .send_header($time.format("Date: " + datestr, time() + tzadjust), $time.format("Last-modified: " + datestr, (fstat[4]) + tzadjust));
    } with {
        .send_header();
    }
    
    // OIF, bizarreness with cwritef skipping the first chunk of the
    // file, lets workaround it for now.
    // .connection().cwritef(filename);
    retry = 30;
    
    // lets wait up to 30 seconds or so, gah
    // later, setup a multi-file scheme where more than one is open
    // involve $cached_file...
    while (!havefile) {
        catch any {
            havefile = $web_file.fopen(filename, "-");
        } with {
            filetb = traceback();
            break;
        }
        retry--;
        if (retry < 0)
            break;
        else if (retry < 5)
            $scheduler.sleep(1);
        else
            pause();
    }
    if (havefile) {
        c = .connection();
        catch any {
            while (1) {
                pause();
                c.write_buffer((> $web_file.fread(1024) <));
            }
        }
        $web_file.fclose();
    } else {
        (.connection()).write("ERROR: unable to open file.");
        if (filetb)
            $sys.broadcast(("$web_file Error! (" + ((filetb[1])[2])) + ")");
        else
            $sys.broadcast("$web_file Bottleneck! ($web_file.close()?)");
    }
    host = (.connection()).address();
    .log_request(host);
    .close_interface();
    sent = 1;
};

public method .response() {
    arg code, message;
    var name, x, page, title;
    
    status = code;
    if (!(name = (| $http_lib.get_code(code) |)))
        return .response(500, "We had a booboo!  Invalid code: " + code);
    if (type(message) == 'string)
        message = [("<p align=center>" + message) + "</p>"];
    title = (code + " ") + name;
    page = $directories.build_header(#[], #[], #[], #[['title, title]]);
    page += [("<h1 align=center>" + title) + "</h1>", "<hr size=1 noshade>"];
    page += message;
    page += $directories.build_footer(#[], #[], #[]);
    return page;
};

protected method .send_header() {
    arg @lines;
    var code_str, content_len;
    
    if (!full)
        return;
    if (!(| (code_str = $http_lib.get_code(status)) |))
        code_str = "Unknown Code";
    if (bytes)
        content_len = ["Content-length: " + bytes];
    else
        content_len = [];
    (.connection()).write([(((http + " ") + status) + " ") + code_str, "Server: ColdWeb/2.1 (Virtual Environment)", "Connection: " + (keep_alive ? "Keep-Alive" : "close"), "Content-type: " + ctype, @content_len, @lines, ""]);
};

public method .set_ctype() {
    arg ct;
    
    ctype = ct;
};

public method .set_info() {
    arg key, data;
    
    // Security: Only $directories and $http_interface can set info
    // if you must extend, set the defining object in this list
    (> .perms(caller(), $directories, $http_interface, $security_lib) <);
    info = info.add(key, data);
};

public method .set_status() {
    arg s;
    
    (> .perms(caller(), $http_connection) <);
    status = s;
};


