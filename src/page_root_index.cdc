
new object $page_root_index: $page;

var $dmi_data descriptions = #[];
var $root created_on = 863765389;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_root_index];
var $root manager = $page_root_index;

public method .generate() {
    arg headers, info, args;
    var a, r;
    
    if (dict_contains(args, "login")) {
        // setup to handle root-level 'domain' login
        if (dict_contains(info, 'run_as)) {
            r = (| args["login"] |) || "/desktop/";
            return ['redirect, r];
        } else {
            return ['auth, ['basic, $directories.get_realm()]];
        }
    }
    return ['redirect, "/motd/"];
};


