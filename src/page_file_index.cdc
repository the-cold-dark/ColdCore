
new object $page_file_index: $page;

var $dmi_data descriptions = #[];
var $root created_on = 864282511;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_file_index];
var $root manager = $page_file_index;

public method .generate() {
    arg headers, info, args;
    var filename, stat, i;
    
    filename = "html" + (info['path_info]);
    stat = (| $file.fstat(filename) |);
    if ((!stat) || (substr(stat[1], 1, 1) == "4"))
        return [(headers['interface]).response(404, "Unable to find URL " + (info['path_info]))];
    i = (info['path_info]).rindex(".");
    (headers['interface]).set_ctype($mime_lib.mime_type((info['path_info]).subrange(i + 1)));
    (headers['interface]).respond_with_file(stat, filename);
    return 0;
};


