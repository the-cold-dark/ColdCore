
new object $null_parser: $user_parsers;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$null_parser];
var $root manager = $null_parser;
var $user_parsers priority = 10000;

public method .parse() {
    arg user, str, @anything_else;
    var i;
    
    for i in [1 .. str.length()] {
        if ((str[i]) != " ")
            return ['failed];
    }
    return ['ok];
};


