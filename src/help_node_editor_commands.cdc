
new object $help_node_editor_commands: $help_sys_editor;

var $has_name name = ['prop, "Commands", "Commands"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [], [<$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["a?fter [<text>] OR _<text>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Add <text> after current line. You may also use an underscore (_) as a shortcut character. If text does not exist you will be prompted for the input."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["ap?pend <text> OR ,<text>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Add <text> after current line. You may also use a comma (,) as a shortcut character."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["copy [<range>] [to] <line>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Copy <range> of text or current line to <line>."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["d?elete [<range>]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Delete <range> or current line."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["done|quit"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Close editor without saving changes."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["fill <range> <line width>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Fill <range> of lines to fit within <line width> appropriately (either by expanding or joining)."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["help [<command>]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Basic editor help."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["i?nsert [<text>] OR '<text>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Add <text> before current line. You may also use a single-quote (') as a shortcut character. If text does not exist you will be prompted for the input."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["list [<range>] [-n?umbers]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["List <range> or all of edit buffer. The option -n?umbers may be used to not specify line numbers."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["line <line>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Change the current line to <line>. You can also use a period (.) as a shortcut character."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["move [<range>] [to] <line>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Move <range> or current line to <line>."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["save|comp?ile [as] [<ref>]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Save document, if arguments are given will save alternate copy."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["s?ub|sed <old> <new> [<range>] [<options>]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Search for <old> and replace it with <new> in <range> (defaulting to the current line). The character following the command is used as a seperator (a space in the example). This allows for the sed-like syntax: s/old/new/. The command 'sed' will use strsed() with regular expressions, the command 'sub' or 's' will use strsub() with literal matching. Options are any one of:", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "g Globally match and replace (do it multiple times)", <$format, ["p", [], [], 'do_p]>, "s Single match and replace (do it only on the first occurance)", <$format, ["p", [], [], 'do_p]>, "c Case matters when matching.", <$format, ["p", [], [], 'do_p]>, "i Case doesn't matter when matching.", <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "Option defaults for sed are: si", <$format, ["p", [], [], 'do_p]>, "Option defaults for sub are: gi"], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["send|mail <mail-recipient>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Used to send current contents of editor to a mail recipient."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["store"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Store editor--do not save changes. Editor can be resumed with @edit %0."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 840586826;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_editor_commands];
var $root manager = $help_node_editor_commands;

public method .generate_body() {
    var helps, h, cmds, c, out, syn;
    
    (sender() == $editor_parser) || (> .perms(sender()) <);
    helps = $editor_parser.command_help();
    cmds = $editor_parser.commands();
    out = "{dl:";
    for c in ((cmds.keys()).sort()) {
        refresh();
        h = helps[cmds[c]];
        syn = strsed(h[1], "Syntax: *", "");
        if ((h[2]) == "")
            h = sublist(h, 3).join("{p}");
        else
            h = sublist(h, 2).join("{p}");
        syn = strsub(syn, "[", "\[");
        syn = strsub(syn, "]", "\]");
        out += ((("{dt:{subj level=3:{tt:" + syn) + "}}}{dd:") + h) + "}";
    }
    .set_body(out + "}");
};


