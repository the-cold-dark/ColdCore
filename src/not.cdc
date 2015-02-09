
new object $not: $logic_frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$not];
var $root manager = $not;
var $root trusted = [];

public method .test() {
    arg notlist, @args;
    var val;
    
    catch ~range {
        catch ~type, ~methodnf
            return !((notlist[1]).test(@args));
        with
            return !(notlist[1]);
    } with {
        return 1;
    }
};

frob method .unparse() {
    arg notlist;
    
    catch any {
        catch ~type, ~methodnf
            return "NOT " + ((notlist[1]).unparse());
        with
            return "NOT " + tostr(notlist[1]);
    } with {
        return "";
    }
};


