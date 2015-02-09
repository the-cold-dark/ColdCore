
new object $and: $logic_frob;

var $logic_frob token = "&&";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$and];
var $root manager = $and;
var $root trusted = [];

public method .test() {
    arg andlist, @args;
    var val, x;
    
    val = 0;
    for x in (andlist) {
        catch ~type, ~methodnf
            val = x.test(@args);
        with
            val = x;
        if (!val)
            break;
    }
    return val;
};

frob method .unparse() {
    arg andlist;
    var str, x;
    
    str = "";
    for x in (andlist) {
        catch any
            str += (x.unparse()) + " AND ";
        with
            str += x + " AND ";
    }
    return ("(" + (str && substr(str, 1, strlen(str) - 4))) + ")";
};


