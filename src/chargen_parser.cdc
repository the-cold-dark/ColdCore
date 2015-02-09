
new object $chargen_parser: $user_parsers;

var $dmi_data descriptions = #[];
var $root created_on = 863732681;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$chargen_parser];
var $root manager = $chargen_parser;
var $user_parsers priority = 700;

public method .parse() {
    arg user, str, next_parser, @other_parsers;
    var m, cmd, args;
    
    str = str.trim();
    
    // direct drop-through
    if (str && ((str[1]) == ">"))
        return next_parser.parse(user, substr(str, 2), @other_parsers);
    
    // shortcut?
    if ((m = regexp(str, "^(\+|-)([0-9a-z]+) *(.*)$"))) {
        if ((m[1]) == "-")
            str = (("lower " + (m[3])) + " ") + (m[2]);
        else
            str = (("raise " + (m[3])) + " ") + (m[2]);
    }
    cmd = explode(str);
    if (cmd && ((cmd[1]) in ["help", "lower", "raise", "sheet", "done", "abort"])) {
        args = sublist(cmd, 2);
        cmd = lowercase(cmd[1]);
        return ['command, user, tosym(cmd + "_charcmd")] + args;
    }
    return next_parser.parse(user, str, @other_parsers);
};


