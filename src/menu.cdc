
new object $menu: $user_interfaces;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $menu menu = 0;
var $menu menu_choice = 0;
var $root created_on = 866642150;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$menu];
var $root manager = $menu;

public method .bar() {
    arg @text;
    var l, str;
    
    if (!text) {
        return "==============================================================================";
    } else {
        str = ("=[" + (text[1])) + "]";
        for l in [1 .. 75 - ((text[1]).length())]
            str = str + "=";
        return str;
    }
};

public method .do_menu() {
    arg @menu;
    var l, str, options, title, prompt, temp, instr, helptext, accept_any, accept_skip, accept_exit, accept_numeric, accept_return, myline, mylist, reloop;
    
    if ((menu.length()) < 3)
        throw(~menu, "Menu must consist of title, prompt text, and at least one option.");
    
    // Obtain the title and prompt text:
    title = menu[1];
    menu = menu.delete(1);
    prompt = menu[1];
    menu = menu.delete(1);
    options = [];
    .tell("");
    pause();
    .menubar(title);
    for l in [1 .. menu.length()] {
        switch (type((menu[l]) || 'blank)) {
            case 'symbol:
                switch ((menu[l]) || 'blank) {
                    case 'accept_any:
                        // Accept any input
                        accept_any = 1;
                    case 'accept_numeric:
                        // Accept numeric input
                        accept_numeric = 1;
                    case 'back:
                        // .tell(" [-] Back Up");
                        options = [@options, "-"];
                    case 'blank:
                        // Probably not needed.
                        .tell("");
                    case 'exit:
                        // .tell(" [X] Exit");
                        options = [@options, "X"];
                        accept_exit = 1;
                    case 'help:
                        // .tell(" [?] Help");
                        options = [@options, "?"];
                    case 'nothing:
                        // Nothing; not even a blank line.
                    case 'return:
                        accept_return = 1;
                    case 'skip:
                        // .tell(" [+] Skip Set");
                        options = [@options, "+"];
                        accept_skip = 1;
                }
            case 'list:
                // One of the elements is a list. Split this
                // up as we do with normal strings, columnize
                // it, store the options, then columnize it.
                mylist = [];
                for myline in (menu[l]) {
                    myline.replace("=> ", "=>");
                    temp = myline.explode("=>");
                    if ((temp.length()) == 1) {
                        // It's just a string. Print it.
                        // .tell(" "+temp[1]);
                        mylist = mylist.add((temp[1]) + " ");
                    } else {
                        // It's a menu choice and txt.
                        mylist = mylist.add(((("[" + ((temp[1]).uppercase())) + "] ") + (temp[2])) + " ");
    
                        // .tell(" ["+temp[1].uppercase()+"] "+temp[2]);
                        options = [@options, ((temp[1])[1]).uppercase()];
                    }
                }
                mylist = mylist.lcolumnize();
                for myline in (mylist)
                    .tell(" " + myline);
            case 'string:
                // Break things up into choice, text:
                (menu[l]).replace("=> ", "=>");
                temp = (menu[l]).explode("=>");
                if ((temp.length()) == 1) {
                    // It's just a string. Print it.
                    .tell(" " + (temp[1]));
                } else {
                    // It's a menu choice and txt.
                    switch (temp[1]) {
                        case "?":
                            // .tell(" ["+temp[1].uppercase()+"] Help");
                            // helptext=temp[2];
                            // options=[@options,temp[1][1].uppercase()];
                        default:
                            // Print the choice and text:
                            .tell(((" [" + ((temp[1]).uppercase())) + "] ") + (temp[2]));
                            options = [@options, ((temp[1])[1]).uppercase()];
                    }
                }
        }
    }
    .menubar();
    pause();
    reloop = 1;
    while (reloop == 1) {
        reloop = 0;
        .tell("");
        .non_terminated_tell(prompt);
        instr = tostr((> .prompt(" ") <));
        if (((instr.length()) > 1) && ((instr[1]) == "~")) {
            .tell("");
            .menuline("Command Line: " + ((instr.subrange(2)).chop(40)));
            reloop = 1;
            ((.connections())[1]).parse_line(instr.subrange(2));
            .tell("");
            .menuline();
        }
        if (instr == "abort") {
            .tell("Aborted! Exiting menu.");
            throw(~abort, "Aborted! Exiting menu.", 'notraceback);
        }
    }
    if (helptext && (instr == "?")) {
        .atell("[help!]");
        .atell(helptext);
        (> .prompt("Press Return> ") <);
    }
    
    // Yell at the user if a valid option is not selected:
    if ((!(accept_return && (instr == ""))) && ((!(accept_numeric && (instr.is_numeric()))) && ((!accept_any) && ((instr in options) == 0)))) {
        .tell("");
        .tell(("Valid options are " + ([@options, "Abort"].to_english())) + ".");
        menu_choice = 'invalid;
    }
    
    // 'skip, 'exit and such can be specified in the menu call. If these
    // are included, accept_skip, accept_exit, etc. will be set to 1. If
    // the user then selects the approprate character, 'skip, 'exit, etc.
    // will be returned instead of the character. Why? I don't know.
    if (accept_skip && (instr == "+"))
        instr = 'skip;
    if (accept_exit && (instr == "X"))
        instr = 'exit;
    if (accept_return && (instr == ""))
        instr = 'return;
    menu_choice = instr;
    return instr;
};

public method .do_menu_nice() {
    arg @args;
    var choicelist, menu, selections, title, prompt, x, choice, obj, meth, arguments, unassigned, letter;
    
    // Generate a nice menu from a list of choices; run the menu
    //  and call all appropriate methods
    // Initialize lots of things
    choicelist = "abcdefghijklmnopqrstuvwyz0123456789";
    menu = [];
    selections = #[];
    unassigned = [];
    if ((filter x in (args) where (type(x) == 'list).length()) > (choicelist.length()))
        return .do_menu_split(@args);
    
    // Get the menu's title and prompt
    title = args[1];
    prompt = args[2];
    args = args.subrange(3);
    
    // Now parse the menu choices
    for x in (args) {
        switch (type(x)) {
            case 'string:
                // If it's a string, just copy it to the menu
                menu = menu + [x];
            case 'list:
                // If it's not a string, we need to parse it
                // First, we get the choice
                choice = x[1];
    
                // Now we get the method to be called if this
                //  option is selected
                if (type(x[2]) == 'objnum) {
                    obj = x[2];
                    x = x.subrange(3);
                } else {
                    obj = sender();
                    x = x.subrange(2);
                }
                meth = x[1];
                arguments = x.subrange(2);
                choice = ((choice.replace("$", "")).replace("'", "")).replace("_", " ");
                letter = (choice.replace(" ", ""))[1];
    
                // Find the first letter of the choice. If it's already
                //  in use, add this choice to an 'unassigned' list.
                //  Otherwise, use that letter for this choice
                if (letter in choicelist) {
                    choice = (letter + "=>") + choice;
                    menu = menu + [choice];
                    choicelist = choicelist.replace(letter, "");
                    selections = selections.add(letter, [obj, meth, arguments]);
                } else {
                    unassigned = unassigned + [[choice, obj, meth, arguments]];
                }
            default:
                throw(~menu, "Bad menu parameter.");
        }
    }
    
    // Now go through the unassigned list and assign letters to all
    //  remaining choices if possible
    for choice in (unassigned) {
        letter = choicelist[1];
        menu = menu + [(letter + "=>") + (choice[1])];
        selections = selections.add(letter, [choice[2], choice[3], choice[4]]);
        choicelist = choicelist.subrange(2);
    }
    
    // Ok, do the menu
    while (choice != 'exit) {
        choice = .do_menu(title, prompt, @menu, 'exit);
        if (choice && (choice != 'exit)) {
            meth = selections[choice];
            (meth[1]).(meth[2])(@meth[3]);
        }
    }
};

public method .do_menu_split() {
    arg @args;
    var x, choicelist, numgroups, pergroup, extra, title, prompt, len, arglen, menu, groups, choice;
    
    choicelist = "abcdefghijklmnopqrstuvwyz0123456789";
    title = args[1];
    prompt = args[2];
    menu = [];
    groups = [];
    args = args.subrange(3);
    len = choicelist.length();
    arglen = args.length();
    numgroups = arglen / len;
    if ((arglen % len) != 0)
        numgroups++;
    pergroup = arglen / numgroups;
    extra = arglen % numgroups;
    for x in [1 .. numgroups] {
        menu = menu + [((tostr(x) + "=>") + (x.n_to_nth())) + " list of choices"];
        if (extra) {
            groups = groups + [args.subrange(1, pergroup + 1)];
            args = args.subrange(pergroup + 2);
            extra--;
        } else {
            groups = groups + [args.subrange(1, pergroup)];
            args = args.subrange(pergroup + 1);
        }
    }
    while (choice != 'exit) {
        choice = .do_menu(title, prompt, @menu, 'exit);
        if (choice != 'exit)
            .do_menu_nice(title, prompt, @groups[toint(choice)]);
    }
};

public method .menu() {
    return menu;
    
    // Returns the current (sub)-menu.
};

public method .menu_choice() {
    return menu_choice;
};

public method .menubar() {
    arg @text;
    var l, str;
    
    if (!text) {
        .tell("==============================================================================");
    } else {
        str = ("=[" + (text[1])) + "]";
        for l in [1 .. 75 - ((text[1]).length())]
            str = str + "=";
        .tell(str);
    }
};

public method .menuchoice() {
    arg choice, text;
    
    .tell(((" [" + choice) + "] ") + text);
};

public method .menuline() {
    arg @text;
    var l, str;
    
    if (!text) {
        .tell("------------------------------------------------------------------------------");
    } else {
        str = ("=[`[34m" + (text[1])) + "`[37m]";
        for l in [1 .. 75 - ((text[1]).length())]
            str = str + "-";
        .tell(str);
    }
};

public method .menutext() {
    arg text;
    
    if (!text)
        .tell("");
    else
        .tell(" " + text);
};

public method .set_menu() {
    arg val;
    
    menu = val;
    
    // Set the current (sub)-menu
};


