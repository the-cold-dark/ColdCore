
new object $page: $core;

var $dmi_data descriptions = #[];
var $page lock = 0;
var $root created_on = 863765169;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page];
var $root manager = $page;

public method .build_footer() {
    arg headers, info, args;
    
    return (> (info['directory_object]).build_footer(headers, info, args) <);
};

public method .build_header() {
    arg headers, info, args, @rest;
    
    return (> (info['directory_object]).build_header(headers, info, args, @rest) <);
};

public method .generate() {
    arg headers, info, args;
    
    return [["<html><head><title>Error</title></head><body>Error</body></html>"]];
};

public method .get_lock() {
    return lock;
};

public method .get_realm() {
    return (> (info['directory_object]).get_realm() <);
};


