
new object $or: $logic_frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$or];
var $root manager = $or;
var $root trusted = [];

public method .test() {
    arg orlist, @args;
    var val, x;
    
    val = 0;
    for x in (orlist) {
        catch ~type, ~methodnf
            val = x.test(@args);
        with
            val = x;
        if (val)
            break;
    }
    return val;
};

frob method .unparse() {
    arg orlist;
    var str, x;
    
    str = "";
    for x in (orlist) {
        catch any
            str += (x.unparse()) + " OR ";
        with
            str += x + " OR ";
    }
    return ("(" + (str && substr(str, 1, strlen(str) - 4))) + ")";
};


