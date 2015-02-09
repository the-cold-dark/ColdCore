
new object $directories: $core;

var $directories default_page = $page_root_index;
var $directories entries = #[["home", $page_home_index], ["bin", $page_bin_index], ["~", $page_home_index], ["desktop", $dir_desktop], ["images", $page_file_index], ["login", $page_login]];
var $directories http_auth_realm = "the Cold Dark";
var $directories lock = 0;
var $dmi_data descriptions = #[];
var $root created_on = 863765302;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root defined_settings = #[["default-page", #[['get, ['get_default_page]], ['set, ['set_default_page]], ['parse, ['parse_default_page]]]], ["http-auth-realm", #[['get, ['get_http_auth_realm]], ['set, ['set_http_auth_realm]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$directories];
var $root manager = $directories;

public method .add_entry() {
    arg name, target;
    
    entries = entries.add(name, target);
};

public method .build_footer() {
    arg header, info, args;
    
    return [("<hr size=1 noshade><a href=\"/\">" + ($motd.server_name())) + "</a></body>"];
};

public method .build_header() {
    arg header, info, args, @more;
    var body, title, head;
    
    [(title ?= $motd.server_name()), (head ?= "")] = more;
    body = "<body bgcolor=\"#ffffff\" text=\"#000000\" link=\"#130191\" vlink=\"#100040\" alink=\"#4000bf\">";
    return ["<head>", ("<title>" + title) + "</title>", head, "</head>", body];
};

root method .core_directories() {
    var elem;
    
    for elem in (entries) {
        if (!valid(elem[2]))
            entries = entries.del(elem[1]);
    }
};

public method .default_page() {
    return default_page;
};

public method .del_entry() {
    arg name;
    
    entries = (> entries.del(name) <);
};

public method .entries() {
    return entries;
};

public method .entry() {
    arg str;
    
    return (> entries[str] <);
};

public method .find_page() {
    arg orig_url, interface;
    var found, script_name, url, dir, page, lock, meth, obj;
    
    script_name = "";
    url = orig_url.explode("/");
    if ((| ((url[1])[1]) == "~" |))
        url = ["~", (url[1]).subrange(2), @url.subrange(2)];
    dir = $directories;
    page = $directories;
    if ((url.length()) == 2) {
        if ((| (obj = $object_lib.to_dbref(url[1])) |)) {
            page = obj;
            script_name += "/" + (url[1]);
            url = url.subrange(2);
            if ((| (meth = tosym(url[1])) |)) {
                if ((| page.find_method(meth) |)) {
                    interface.set_info('generate, meth);
                    script_name += "/" + (url[1]);
                    url = url.subrange(2);
                    found = 1;
                    if ((page.has_ancestor($page)) && (page.get_lock()))
                        lock = page;
                } else {
                    return 'pagenf;
                }
            } else {
                return 'pagenf;
            }
        }
    }
    if (!found) {
        if (dir.get_lock())
            lock = dir;
        catch ~keynf {
            while (url && (page.has_ancestor($directories))) {
                page = dir.entry(url[1]);
                script_name += "/" + (url[1]);
                url = url.subrange(2);
                if (page.get_lock())
                    lock = page;
                if (page.has_ancestor($directories))
                    dir = page;
            }
        }
        if (page.has_ancestor($directories)) {
            if ((!url) && ((orig_url.last()) != "/")) {
                return ['redirect, orig_url + "/"];
            } else {
                if (url)
                    return 'pagenf;
                page = page.default_page();
                if (page.get_lock())
                    lock = page;
            }
        }
        if (url && (| (meth = tosym(url[1])) |)) {
            if ((| page.find_method(meth) |)) {
                interface.set_info('generate, meth);
                script_name += "/" + (url[1]);
                url = url.subrange(2);
            } else {
                interface.set_info('generate, 'generate);
            }
        } else {
            interface.set_info('generate, 'generate);
        }
    }
    interface.set_info('script_name, script_name);
    interface.set_info('path_info, "/" + (url.join("/")));
    interface.set_info('directory_object, dir);
    interface.set_info('lock_object, lock);
    return page;
};

public method .get_default_page() {
    arg name, definer;
    
    return default_page;
};

public method .get_http_auth_realm() {
    arg name, definer;
    
    return http_auth_realm || ($motd.server_name());
};

public method .get_lock() {
    return lock;
};

public method .get_realm() {
    return http_auth_realm || ($motd.server_name());
};

root method .init_directories() {
    entries = #[];
    default_page = $page_root_index;
};

public method .parse_default_page() {
    arg value, @args;
    var object;
    
    catch ~objnf, ~namenf, ~invdbref {
        object = $object_lib.to_dbref(value);
        if (object.is($page))
            return object;
    } with {
        throw(~check, "default-page must be a valid descendant of $page.");
    }
    throw(~check, "default-page must be a valid descendant of $page.");
};

public method .set_default_page() {
    arg name, definer, value;
    
    default_page = value;
};

public method .set_http_auth_realm() {
    arg name, definer, value;
    
    http_auth_realm = value;
};

root method .uninit_directories() {
    lock = 0;
    entries = 0;
    default_page = 0;
};


