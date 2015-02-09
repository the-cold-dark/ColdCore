
new object $xor: $logic_frob;

var $logic_frob token = "^";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$xor];
var $root manager = $xor;
var $root trusted = [];

public method .test() {
    arg xorlist, @args;
    var val, x;
    
    val = 0;
    for x in (xorlist) {
        catch ~type, ~methodnf
            val = val ? (!(x.test(@args))) : (x.test(@args));
        with
            val = val ? (!x) : x;
    }
    return val;
};

frob method .unparse() {
    arg xorlist;
    var str, x;
    
    str = "";
    for x in (xorlist) {
        catch any
            str = (str + (x.unparse())) + " XOR ";
        with
            str = (str + tostr(x)) + " XOR ";
    }
    return ("(" + (str && (str.subrange(1, (str.length()) - 4)))) + ")";
};


