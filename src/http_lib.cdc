
new object $http_lib: $libraries;

var $dmi_data descriptions = #[];
var $http_lib codes = #[[200, "Ok"], [201, "Created"], [202, "Accepted"], [203, "Provisional Information"], [204, "No Content"], [300, "Multiple Choices"], [301, "Moved Permanently"], [302, "Moved Temporarily"], [303, "See Other"], [304, "Not Modified"], [400, "Bad Request"], [401, "Unauthorized"], [402, "Payment Required"], [403, "Forbidden"], [404, "Not Found"], [405, "Method Not Allowed"], [406, "None Acceptable"], [407, "Proxy Authentication Required"], [408, "Request Timeout"], [409, "Conflict"], [410, "Gone"], [500, "Internal Server Error"], [501, "Not Implemented"], [502, "Bad Gateway"], [503, "Service Unavailable"], [504, "Gateway Timeout"]];
var $http_lib errors = #[[400, ["<head><title>400 Bad Request</title></head>", "<body>", "<center><h1>400 Bad Request</h1></center>", "%s", "</body>"]], [403, ["<head><title>403 Permission Denied</title></head>", "<body>", "<center><h1>403 Permission Denied</h1></center>", "%s", "</body>"]], [404, ["<head><title>404 Not Found</title></head>", "<center><h1>404 Not Found</h1></center>", "%s", "</body>"]]];
var $http_lib html_version = "text/html";
var $root created_on = 863767420;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$http_lib];
var $root manager = $http_lib;

public method .explode_http_encoding() {
    arg args;
    var fields, field, values, key, value;
    
    fields = #[];
    
    // temporary hack--we should actually be using .add_elem  --brandon
    for field in (args.explode("&")) {
        field = explode(field, "=");
        key = $http.decode(field[1]);
        if (listlen(field) > 1)
            value = $http.decode(field[2]);
        else
            value = "";
        if (dict_contains(fields, key))
            fields = dict_add(fields, key, ((fields[key]) + ", ") + value);
        else
            fields = dict_add(fields, key, value);
    }
    return fields;
};

public method .explode_http_encoding2() {
    arg args;
    var fields, field;
    
    fields = #[];
    for field in (args.explode("&")) {
        field = field.explode("=", 1);
        fields = fields.add_elem($http.decode(field[1]), $http.decode(field[2]));
    }
    return fields;
};

public method .explode_url() {
    arg line;
    var args, i;
    
    i = "?" in line;
    if (i) {
        args = substr(line, i + 1);
        line = substr(line, 1, i - 1);
    }
    if (args)
        return [#[['path, line]], .explode_http_encoding(args)];
    else
        return [#[['path, line]], #[]];
};

public method .get_code() {
    arg c;
    
    return (> codes[c] <);
};

public method .html_version() {
    return html_version;
};


