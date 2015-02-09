
new object $page_desktop_login: $page;

var $dmi_data descriptions = #[];
var $root created_on = 864277988;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_desktop_login];
var $root manager = $page_desktop_login;

public method .content_frame() {
    arg headers, info, args;
    
    return [["<html>", "<head><title>User Desktop</title></head>", "<body bgcolor=\"#ffffff\">", "Content Frame", "</body>", "</html>"]];
};

public method .generate() {
    arg headers, info, args;
    
    return [["<html>", "<head><title>User Desktop</title></head>", "<frameset rows=\"50,*\">", "<frame name=\"nav\" src=\"/page_desktop_login/nav_frame\">", "<frame name=\"content\" src=\"/\">", "</frameset>", "<noframe>", "<body bgcolor=\"#ffffff\">", "You must support frames", "</body>", "</noframe>", "</html>"]];
};

public method .nav_frame() {
    arg headers, info, args;
    
    return [["<html>", "<head><title>User Desktop</title></head>", "<body bgcolor=\"#ffffff\">", "<a href=\"/bin/help\"  target=\"content\">Help</a> |", "<a href=\"/bin/object\" target=\"content\">Browse Objects</a> |", "<a href=\"/bin/describe\" target=\"content\">Browse VR World</a> |", "<a href=\"/bin/who\" target=\"content\">Who</a> |", "<a href=\"/desktop/web_prefs/config\" target=\"content\">Configure Preferences</a>", "</body>", "</html>"]];
};


