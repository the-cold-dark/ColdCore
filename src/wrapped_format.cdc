
new object $wrapped_format: $plain_format;

var $root created_on = 848777209;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$wrapped_format];
var $root manager = $wrapped_format;

public method .format() {
    arg data, vars;
    var str, len, line, out;
    
    str = (> (._eval_ctext(data, vars))[1] <);
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    
    // ugly and inneficient--use a client people
    len = (vars['receiver]).linelen();
    out = "";
    for line in (explode(str, "\n"))
        out += (line.wrap_line(len, " ")) + "\n";
    return str_to_buf(out);
};


