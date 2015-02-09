
new object $wrap_filter: $filters;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$wrap_filter];
var $root manager = $wrap_filter;

public method .filter_text() {
    arg input;
    var len, output, e, line;
    
    return $string.wrap_line(input, sender().linelen());
};


