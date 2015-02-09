
new object $channel_parser: $user_parsers;

var $root created_on = 838745026;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$channel_parser];
var $root manager = $channel_parser;
var $user_parsers priority = 5000;

public method .parse() {
    arg user, str, next_parser, @other_parsers;
    var cname, first_word, parse_list;
    
    str = str.trim();
    if (!str)
        return next_parser.parse(user, str, @other_parsers);
    parse_list = str.explode();
    first_word = parse_list[1];
    cname = user.channel_alias(first_word);
    if ((cname != "") && ((parse_list.length()) > 1))
        return ['command, user, 'broadcast, cname, str.subrange((first_word.length()) + 2)];
    return next_parser.parse(user, str, @other_parsers);
};


