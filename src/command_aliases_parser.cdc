
new object $command_aliases_parser: $user_parsers;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$command_aliases_parser];
var $root manager = $command_aliases_parser;
var $root trusted = [];
var $user_parsers priority = 750;

public method .parse() {
    arg user, str, next_parser, @other_parsers;
    var alias, match, i, result, old;
    
    for alias in (user.command_aliases()) {
        match = str.match_pattern(alias[1]);
        if (match != 0) {
            old = str;
            str = "";
            for i in (alias[2]) {
                if (type(i) == 'integer)
                    str += match[i];
                else
                    str += i;
            }
        }
    }
    result = next_parser.parse(user, str, @other_parsers);
    if (old && ((result[1]) == 'failed))
        return ['error, ("Command converted to \"" + str) + "\" but not understood."];
    return result;
};


