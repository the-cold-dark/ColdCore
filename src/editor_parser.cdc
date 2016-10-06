
new object $editor_parser: $user_parsers;

var $editor_parser command_help = #[['insert_cmd, ["Syntax: i?nsert [<text>] OR '<text>", "", "Add <text> before current line.  You may also use a single-quote (') as a shortcut character.  If text does not exist you will be prompted for the input."]], ['after_cmd, ["Syntax: a?fter [<text>] OR _<text>", "", "Add <text> after current line.  You may also use an underscore (_) as a shortcut character.  If text does not exist you will be prompted for the input."]], ['append_cmd, ["Syntax: ap?pend <text> OR ,<text>", "", "Add <text> after current line.  You may also use a comma (,) as a shortcut character."]], ['delete_cmd, ["Syntax: d?elete [<range>]", "", "Delete <range> or current line."]], ['copy_cmd, ["Syntax: copy [<range>] [to] <line>", "", "Copy <range> of text or current line to <line>."]], ['quit_cmd, ["Syntax: done|quit", "", "Close editor without saving changes."]], ['fill_cmd, ["Syntax: fill <range> <line width>", "", "Fill <range> of lines to fit within <line width> appropriately (either by expanding or joining)."]], ['help_cmd, ["Syntax: help [<command>]", "", "Basic editor help."]], ['line_cmd, ["Syntax: line <line>", "", "Change the current line to <line>.  You can also use a period (.) as a shortcut character."]], ['move_cmd, ["Syntax: move [<range>] [to] <line>", "", "Move <range> or current line to <line>."]], ['list_cmd, ["Syntax: list [<range>] [-n?umbers]", "", "List <range> or all of edit buffer.  The option -n?umbers may be used to not specify line numbers."]], ['subst_cmd, ["Syntax: s?ub|sed <old> <new> [<range>] [<options>]", "", "Search for <old> and replace it with <new> in <range> (defaulting to the current line).  The character following the command is used as a separator (a space in the example).  This allows for the sed-like syntax: s/old/new/. The command 'sed' will use strsed() with regular expressions, the command 'sub' or 's' will use strsub() with literal matching.  Options are any one of:", "", "        g      Globally match and replace (do it multiple times)", "        s      Single match and replace (do it only on the first occurrence)", "        c      Case matters when matching.", "        i      Case doesn't matter when matching.", "", "Option defaults for sed are: si", "Option defaults for sub are: gi"]], ['save_cmd, ["Syntax: save|comp?ile [as] [<ref>]", "", "Save document, if arguments are given will save alternate copy."]], ['store_cmd, ["Syntax: store", "", "Store editor--do not save changes.  Editor can be resumed with @reedit."]], ['send_cmd, ["Syntax: send|mail <mail-recipient>", "", "Used to send current contents of editor to a mail recipient."]], ['join_cmd, ["Syntax: j?oin <range> \"<sep>\"", "", "Join <range> lines together as one line, separated by <sep> (default as space)"]]];
var $editor_parser commands = #[["ap?pend", 'append_cmd], ["a?fter", 'after_cmd], ["d?elete|e?rase", 'delete_cmd], ["done|quit", 'quit_cmd], ["h?elp", 'help_cmd], ["i?nsert", 'insert_cmd], ["line", 'line_cmd], ["l?ist|ls", 'list_cmd], ["m?ove|mv", 'move_cmd], ["save|comp?ile", 'save_cmd], ["store", 'store_cmd], ["sed|sub", 'subst_cmd], ["send|mail", 'send_cmd], ["c?opy|cp", 'copy_cmd], ["f?ill|w?rap", 'fill_cmd], ["j?oin", 'join_cmd]];
var $editor_parser shortcuts = #[["^'", 'insert_cmd], [",", 'append_cmd], ["_", 'after_cmd], [".", 'line_cmd]];
var $root created_on = 820684599;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$editor_parser];
var $root manager = $editor_parser;
var $user_parsers priority = 250;

public method .command_help() {
    return command_help;
};

public method .commands() {
    return commands;
};

public method .parse() {
    arg u, str, next_parser, @other_parsers;
    var word, cmd, argstr, c, m;
    
    while (str && ((str[1]) == " "))
        str = str.subrange(2);
    if (!str)
        return next_parser.parse(u, str, @other_parsers);
    if ((str[1]) == ">")
        return next_parser.parse(u, str.subrange(2), @other_parsers);
    
    // special cased shortcuts
    for cmd in (shortcuts) {
        if ((str[1]) in (cmd[1]))
            return ['match, u.active_editor(), cmd[2], str[1], "", substr(str, 2)];
    }
    
    // handle standard commands
    // special case 'sub|sed/...'
    if ((word = regexp(str, "^(sed|sub|s)[^a-z]"))) {
        word = word[1];
        argstr = substr(str, strlen(word) + 1);
        return ['match, u.active_editor(), 'subst_cmd, word, "sed|sub", argstr];
    } else if ((word = (| str.word(1) |))) {
        if (" " in str)
            argstr = substr(str, (" " in str) + 1);
        else
            argstr = "";
        for cmd in (commands.keys()) {
            if ((m = match_template(word, cmd)))
                return ['match, u.active_editor(), commands[cmd], word, cmd, argstr];
        }
    }
    
    // didn't match, move on
    return next_parser.parse(u, str, @other_parsers);
};


