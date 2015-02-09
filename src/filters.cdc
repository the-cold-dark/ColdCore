
new object $filters: $misc;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$filters];
var $root manager = $filters;

public method .compress() {
    arg input;
    var e, output;
    
    // only goes 1 element deep--sorry, anybody sending anything past that will
    // be shot.
    output = [];
    if (type(input) == 'list) {
        for e in (input) {
            if (type(e) == 'list)
                output += e;
            else
                output += [e];
        }
    } else {
        output = [input];
    }
    return output;
};


