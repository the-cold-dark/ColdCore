
new object $ansi_format: $tagged_format;

var $ansi_format bcolors = #[["black", "40"], ["red", "41"], ["green", "42"], ["yellow", "43"], ["blue", "44"], ["magenta", "45"], ["cyan", "46"], ["white", "47"]];
var $ansi_format colors = #[["black", "30"], ["red", "31"], ["green", "32"], ["yellow", "33"], ["blue", "34"], ["magenta", "35"], ["cyan", "36"], ["white", "37"]];
var $dmi_data descriptions = #[];
var $root created_on = 863402529;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$ansi_format];
var $root manager = $ansi_format;

public method .ansi_wrap_line() {
    arg str, len, @stuff;
    var output, cutoff, firstline, prefix, plen, x, ansilist, lengthvals, counter, elem, wordlist, wordsum, flag;
    
    // Thanks Scott for letting me port this back from TEC.
    //   - Bruce
    // takes string and wraps it by words, compared to length, returns a list. 
    [(prefix ?= ""), (firstline ?= 0)] = stuff;
    output = "";
    if (firstline)
        str = prefix + str;
    plen = strlen(prefix);
    while (strlen(str) > len) {
        refresh();
        flag = "\n";
        counter = 0;
    
        // Check for ansi codes first
        ansilist = .weed_ansi(str);
    
        // If there are ansi codes, do the spiel, otherwise do a regular
        // line wrap (this can happen on a segment by segment basis)
        if (listlen(ansilist) > 1) {
            // create a word-only list w/o the ansi codes, and a letter-count
            // list both for the entire list and for the word-only list
            lengthvals = map x in (ansilist) to (strlen(x));
            wordlist = ansilist.odds();
            wordsum = map x in (wordlist) to (strlen(x)).sum();
    
            // wordsum = lengthvals.odds().sum();
            // if the letter-count for the word-only list is greater than the 
            // line length, then we'll need to hack it up, otherwise, we'll
            // just use the length of the entire line, codes and all
            if (wordsum > len) {
                // We've got too many letters. Have to find out where in
                // the word (non-ansi-code) part of the string the len is.
                // we mark its spot in the master list, but only count its
                // letter value if it's really a word. We also need to
                // remember how many letters we've gone through before
                // possibly hitting a big chunk of string (counter).
                elem = find x in (ansilist) where ((x in wordlist) && ((counter += strlen(x)) > len));
                if (elem)
                    counter -= strlen(x);
    
                // Going to establish where to cut the string. Take the
                // sum of the letter-count list up to the marker we just found
                cutoff = (lengthvals.subrange(1, elem - 1)).sum();
    
                // We already know the string is too long for a line, or we
                // wouldn't be here. If the counter is less than our line length
                // it probably means the next element was too long to add, 
                // (a big chunk of string with no codes) so we'll tack on the
                // len - our counter value.
                if (counter < len)
                    cutoff += len - counter;
                cutoff = stridx(substr(str, 1, cutoff), " ", -1);
            } else {
                cutoff = lengthvals.sum();
                flag = "";
            }
        } else {
            cutoff = stridx(substr(str, 1, len), " ", -1);
        }
    
        // The rest of this has been tweaked slightly. The main goal was to
        // get cutoff vals that this section of the code will be happy with.
        if (cutoff <= plen) {
            output += "\n" + substr(str, 1, len);
            str = prefix + substr(str, len + 1);
        } else {
            output += "\n" + substr(str, 1, cutoff);
            str = prefix + substr(str, cutoff + 1);
        }
    }
    
    // Here's the tweak and the pain in the ass I'd like solved. When the
    // length of the word value of the string matches the line length, the
    // extra "\n" at the end causes extra spacing for .atelln()
    return (output ? ((output.subrange(3)) + flag) : "") + str;
};

public method .ansi_wrap_lines() {
    arg str, len, @stuff;
    var output, cutoff, firstline, prefix, plen, x, ansilist, lengthvals, counter, elem, wordlist, wordsum, flag;
    
    // Thanks Scott for letting me port this back from TEC.
    //   - Bruce
    // takes string and wraps it by words, compared to length, returns a list. 
    [(prefix ?= ""), (firstline ?= 0)] = stuff;
    output = [];
    if (firstline)
        str = prefix + str;
    plen = strlen(prefix);
    while (strlen(str) > len) {
        refresh();
        flag = "\n";
        counter = 0;
    
        // Check for ansi codes first
        ansilist = .weed_ansi(str);
    
        // If there are ansi codes, do the spiel, otherwise do a regular
        // line wrap (this can happen on a segment by segment basis)
        if (listlen(ansilist) > 1) {
            // create a word-only list w/o the ansi codes, and a letter-count
            // list both for the entire list and for the word-only list
            lengthvals = map x in (ansilist) to (strlen(x));
            wordlist = ansilist.odds();
            wordsum = map x in (wordlist) to (strlen(x)).sum();
    
            // wordsum = lengthvals.odds().sum();
            // if the letter-count for the word-only list is greater than the 
            // line length, then we'll need to hack it up, otherwise, we'll
            // just use the length of the entire line, codes and all
            if (wordsum > len) {
                // We've got too many letters. Have to find out where in
                // the word (non-ansi-code) part of the string the len is.
                // we mark its spot in the master list, but only count its
                // letter value if it's really a word. We also need to
                // remember how many letters we've gone through before
                // possibly hitting a big chunk of string (counter).
                elem = find x in (ansilist) where ((x in wordlist) && ((counter += strlen(x)) > len));
                if (elem)
                    counter -= strlen(x);
    
                // Going to establish where to cut the string. Take the
                // sum of the letter-count list up to the marker we just found
                cutoff = (lengthvals.subrange(1, elem - 1)).sum();
    
                // We already know the string is too long for a line, or we
                // wouldn't be here. If the counter is less than our line length
                // it probably means the next element was too long to add, 
                // (a big chunk of string with no codes) so we'll tack on the
                // len - our counter value.
                if (counter < len)
                    cutoff += len - counter;
                cutoff = stridx(substr(str, 1, cutoff), " ", -1);
            } else {
                cutoff = lengthvals.sum();
                flag = "";
            }
        } else {
            cutoff = stridx(substr(str, 1, len), " ", -1);
        }
    
        // The rest of this has been tweaked slightly. The main goal was to
        // get cutoff vals that this section of the code will be happy with.
        if (cutoff <= plen) {
            output += [substr(str, 1, len)];
            str = prefix + substr(str, len + 1);
        } else {
            output += [substr(str, 1, cutoff)];
            str = prefix + substr(str, cutoff + 1);
        }
    }
    
    // Here's the tweak and the pain in the ass I'd like solved. When the
    // length of the word value of the string matches the line length, the
    // extra "\n" at the end causes extra spacing for .atelln()
    return output + [str];
};

public method .do_detail() {
    arg vars, flags, args;
    
    return [("\A1;4m" + (flags.getkey("name"))) + "\A0m", vars];
};

public method .do_font() {
    arg vars, flags, args;
    var color, bcolor, code, nested, current;
    
    // allow other .do_* methods to call this with a specific code
    if (dict_contains(vars, 'ansi_code)) {
        code = vars['ansi_code];
        vars = dict_del(vars, 'ansi_code);
    } else {
        color = (| flags.getkey("color") |);
        bcolor = (| flags.getkey("bcolor") |);
        code = (color ? (| ($cml_color.get_color(color))[2] |) : "") || "";
        code += (bcolor ? (code ? (| ";" + (($cml_color.get_color(bcolor))[3]) |) : (| ($cml_color.get_color(bcolor))[3] |)) : "") || "";
    }
    if (code) {
        code = ("\A" + code) + "m";
    
        // handle existing nesting
        if (dict_contains(vars, 'ansi_color)) {
            current = vars['ansi_color];
            nested++;
        }
        vars = dict_add(vars, 'ansi_color, code);
    }
    [args, vars] = ._eval_ctext(args, vars);
    if (code) {
        if (nested) {
            args = ((("\A0m" + code) + args) + "\A0m") + current;
            vars = dict_add(vars, 'ansi_color, current);
        } else {
            args = (code + args) + "\A0m";
            vars = dict_del(vars, 'ansi_color);
        }
    }
    return [args, vars];
};

public method .do_link() {
    arg vars, flags, args;
    
    vars = dict_add(vars, 'ansi_code, "1;4");
    return .do_font(vars, flags, args);
};

public method .explode_ansi() {
    arg line;
    var m, out;
    
    out = [];
    while (line) {
        if ((m = match_regexp(line, "\\\A[^a-z]+[a-z]"))) {
            m = m[1];
            out += [substr(line, 1, (m[1]) - 1), substr(line, m[1], m[2])];
            line = substr(line, (m[1]) + (m[2]));
        } else {
            out += [line];
            break;
        }
    }
    return out;
};

public method .format() {
    arg data, vars;
    var str, len, line;
    
    str = (> (._eval_ctext(data, vars))[1] <);
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    
    // ugly and inneficient--use a client people
    // out = str_to_buf(str);
    // out = out.bufsub(`[92, 65], `[27, 91]);
    return str_to_buf(str).bufsub(`[92, 65], `[27, 91]);
};

public method .hold_rewrap_lines() {
    arg vars, str, prefix;
    var s, p, n, firstline;
    
    s = [];
    n = (vars['width]) + (prefix.length());
    for str in (str.explode("\n", 1))
        s += .wrap_lines(str, n, prefix, 1);
    return s.join("\n");
};

public method .hold_wrap_lines() {
    arg str, len, @stuff;
    var prefix, firstline, split_str, ansi_parts, output, plen, hide_len, x, tlen, cutoff, tstr;
    
    // takes string and wraps it by words, compared to length, returns a list. 
    [(prefix ?= ""), (firstline ?= 0)] = stuff;
    split_str = .explode_ansi(str);
    str = "";
    x = 1;
    tlen = 1;
    ansi_parts = [];
    while (x < (split_str.length())) {
        str += split_str[x];
        ansi_parts = ansi_parts.add([tlen, split_str[x + 1]]);
        tlen += strlen(str);
        x += 2;
    }
    if (firstline)
        str = prefix + str;
    output = [];
    plen = strlen(prefix);
    while (strlen(str) > len) {
        cutoff = stridx(substr(str, 1, len), " ", -1);
        if (cutoff <= plen) {
            tstr = substr(str, 1, len);
            str = prefix + substr(str, len + 1);
        } else {
            tstr = substr(str, 1, cutoff - 1);
            str = prefix + substr(str, cutoff + 1);
        }
        output += tstr;
    }
    return output + [str];
};

public method .rewrap_lines() {
    arg vars, str, prefix;
    var s, p, n, firstline;
    
    s = [];
    n = (vars['width]) + (prefix.length());
    for str in (str.explode("\n", 1))
        s += .ansi_wrap_lines(str, n, prefix, 1);
    return s.join("\n");
};

public method .tag_text() {
    arg str;
    var mode, token;
    
    return map token in (.weed_ansi(str)) to ((mode = !mode) ? token : "").join("");
};

public method .weed_ansi() {
    arg str;
    var out;
    
    out = str.global_regexp("[\]A[0-9A-LN-Za-ln-z;]+m");
    return out;
    return str.global_regexp("\\\A[0-9A-Ln-z;a-ln-z;]+[a-z]");
};


