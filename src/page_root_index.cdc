
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
    
    return [$motd.build_html()];
};


