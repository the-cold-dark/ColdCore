
new object $code_lib: $libraries;

var $code_lib quotes = [["\"Abandon all hope, ye who enter here.\""], ["\"Pull out Wedge, your not doing any more good back there.\"", "", "- Luke Skywalker, StarWars"], ["\"God is in the details.\""], ["\"I don't practice what I preach,", "because I'm not the type of person I'm preaching too.\"", "", "- Bob Dobbs"], ["\"I haven't shaved for six years.", "I seem to be cursed with a thin beard.\"", "", "- Calvin, Age 6 (of Calvin & Hobbes)"], ["\"I may be a Dreamer, but I'm not the only one.\"", "", "- John Lennon"], ["\"C code.  C code run.  Run, Code, Run!  Please!?\"", "", "- Anonymous C hacker."], ["\"They who dream by day are cognizant of many things", "which escape those who dream only by night.\"", "", "- Edgar Allan Poe"], ["\"The good die first,", "and they whose hearts are dry as a summer dust", "burn to the socket.\"", "", "- William Wordsworth"], ["\"Banning guns to prevent murder", "is like banning word processors to prevent libel.\"", "", "- Unknown"], ["\"You will not be punished for your anger,", "you will be punished by your anger.\"", "", "- Buddha"], ["What part of:", "", "main() { printf(&unix[\"021%six0120\"],(unix)[\"have\"]+\"fun\"-0x60);}", "", "do you not understand?", "", "(taken from the 1987 Obfuscated C Code Contest)"], ["\"The goal of computer science is to build something that will", "last at least until we've finished building it.\""], ["\"Give me ambiguity or give me something else.\""], ["\"We are born naked, wet and hungry. Then things get worse.\""], ["\"Make it idiot proof and someone will make a better idiot.\""], ["\"Lottery: A tax on people who are bad at math.\""], ["\"There's too much blood in my caffeine system.\""], ["\"Artificial Intelligence usually beats real stupidity.\""], ["\"Ever notice how fast MS-Windows runs? Neither did I.\""], ["\"Very funny, Scotty. Now beam down my clothes.\""], ["\"Consciousness: that annoying time between naps.\""], ["\"The gene pool could use a little chlorine.\""], ["\"When there's a will, I want to be in it.\""], ["\"Change is inevitable, except from a vending machine.\""], ["\"MS-Windows is a virus:", "it takes over your computer and makes it run bad.\""], ["\"I have not failed 10,000 times,", "I have sucessfully found 10,000 ways that do not work.\"", "- Thomas Edison"], ["\"The difference between literature and journalism is", "that journalism is unreadable and literature is not read.\"", "", "- Oscar Wilde (1854-1900)"], ["\"The man who reads nothing at all is better educated", "than the man who reads nothing but newspapers.\"", "", "- Thomas Jefferson (1743-1826)"], ["\"In the mind of the beginner, there are many possibilities.", "In the mind of the expert there are few.\"", "", "- Shunryu Suzuki"], ["\"Time is a great teacher, but unfortunately it kills all of its pupils.\"", "", "- Hector Berlioz"], ["\"After I'm dead I'd rather have people ask", "why I have no monument, than why I have one.\"", "", "- Cato the Elder (234-249 B.C.)"], ["\"I loathe people who keep dogs. They are cowards who haven't", "got the guts to bite people themselves.\"", "", "-August Strindberg"], ["\"By the time I'd grown up, I natrually supposed that I'd be grown up.\"", "", "-Eve Babitz"], ["\"Every place has a spirit:", "it may be good, it may be bad", "it can be restful as eternity.", "This place-spirit can inhabit a book, a house, a town, a valley;", "the nature of the spirits is they remain.\"", "", "- William S. Burroughs"], ["\"I have never been lost... but I will admit to being confused for several weeks.\"", "", "- Daniel Boon"], ["Time is what keeps things from happening all at once."], ["According to my calculations the problem doesn't exist."], ["Forget about World Peace ... visualize using your turn signal."], ["Ever stop to think, and forget to start again?"], ["Diplomacy is the art of saying \"nice doggie!\"...till you can find a rock."], ["\"The sign of growing up is being able to form independent opinions,", "The sign of maturity is knowing when they are not wanted.\""], ["\"Microsoft seems hell-bent on repeating very many of the problems", "originally suffered by Unix almost 20 years ago.\"", "", "-Unknown"]];
var $root created_on = 796268969;
var $root flags = ['methods, 'variables, 'core, 'code];
var $root inited = 1;
var $root managed = [$code_lib];
var $root manager = $code_lib;

public method ._debug_listing() {
    arg list;
    var indent, i, out, t, j;
    
    indent = "";
    out = [" Tick#  Event", " -----  -----------------------------"];
    t = 0;
    for i in (list) {
        if (type(i) == 'integer) {
            if (indent)
                indent = indent.subrange(3);
            out += [strfmt("%6r  %lreturn", i - t, indent)];
        } else {
            if (!t)
                t = i[1];
            j = strfmt("%6r  %l%l(%l)", (i[1]) - t, indent, (._show_ref(i)).replace("()", ""), (toliteral(i[5]).match_pattern("[*]"))[1]);
            out += [j];
            indent += "  ";
        }
        refresh();
    }
    return out;
};

public method ._do_method_href() {
    arg method, object, options;
    var mod_method, prefix, postfix, index;
    
    prefix = "";
    postfix = "";
    if ((method[1]) != ".") {
        index = stridx(method, ".");
        prefix = method.subrange(1, index);
        method = method.subrange(index + 1);
    } else {
        prefix = ".";
        method = method.subrange(2);
    }
    postfix = "(";
    if (options)
        options = (options.mmap('join, "=")).join("&");
    method = method.subrange(1, (method.length()) - 1);
    return (((((((((prefix + "<A HREF=\"/bin/method?target=") + object) + ".") + method) + "()") + (options ? ("&" + options) : "")) + "\">") + method) + "</A>") + postfix;
};

public method ._profile_listing() {
    arg list;
    var i, out, ref, times, sums, callers, t, tic, max, start, head;
    
    head = ["Object<definer>.method                               Tics    (%)  Total    (%)", "----------------------                               ----    ---  -----    ---"];
    times = #[];
    sums = #[];
    callers = [];
    for i in (list) {
        refresh();
        if (type(i) == 'integer) {
            if (callers) {
                [[ref, tic], @callers] = callers;
                times = times.add(ref, (((| times[ref] |) || 0) + i) - t);
                if (!(ref in callers))
                    sums = sums.add(ref, (((| sums[ref] |) || 0) + i) - tic);
            }
            t = i;
        } else {
            if (callers) {
                ref = (callers[1])[1];
                times = times.add(ref, (((| times[ref] |) || 0) + (i[1])) - t);
            }
            ref = ._show_ref(i);
            callers = [[ref, i[1]], @callers];
            t = i[1];
        }
        start ?= t;
    }
    max = 0.01 * (t - start);
    out = map i in (times.keys()) to (refresh() && [i.chop(50), times[i], (times[i]) / max, sums[i], (sums[i]) / max]);
    out = out.sort(map i in (out) to (refresh() && (-(i[2]))));
    out = map i in (out) to (strfmt("%50l%7r%6.1r%%%7r%6.1r%%", @i));
    out = head + out;
    return out;
};

public method ._show_ref() {
    arg i;
    
    return ((i[2]) != (i[3])) ? strfmt("%l<%l>.%l()", i[2], i[3], i[4]) : strfmt("%l.%l()", i[2], i[4]);
};

public method ._trace_listing() {
    arg list;
    var indent, i, out, t, j;
    
    indent = "";
    out = [" Tick#  Event", " -----  -----------------------------"];
    t = 0;
    for i in (list) {
        if (type(i) == 'integer) {
            if (indent)
                indent = indent.subrange(3);
        } else {
            if (!t)
                t = i[1];
            j = strfmt("%6r  %l%l", (i[1]) - t, indent, ._show_ref(i));
            out += [j.chop(79)];
            indent += "  ";
        }
        refresh();
    }
    return out;
};

public method ._trace_profile() {
    arg list;
    var i, out, ref, times, sums, callers, t, tic, max, start;
    
    out = ["Object<definer>.method                               Tics  (%)  Cummul. (%)"];
    times = #[];
    sums = #[];
    callers = [];
    for i in (list) {
        refresh();
        if (type(i) == 'integer) {
            if (callers) {
                [[ref, tic], @callers] = callers;
                times = times.add(ref, (((| times[ref] |) || 0) + (i[1])) - t);
                sums = sums.add(ref, (((| sums[ref] |) || 0) + (i[1])) - tic);
            }
            t = i;
        } else {
            if (callers) {
                ref = (callers[1])[1];
                times = times.add(ref, (((| sums[ref] |) || 0) + (i[1])) - t);
            }
            ref = strfmt("%l<%l>.%l", i[2], i[3], i[4]);
            callers = [[ref, i[1]], @callers];
            t = i[1];
        }
        start ?= t;
    }
    max = 0.01 * (t - start);
    out = map i in (times.keys()) to (refresh() && [i, times[i], (times[i]) / max, sums[i], (sums[i]) / max]);
    out = out.sort(out.slice(2));
    out = map i in (out) to (strfmt(i, "%50l%7r%7r%7r%7r"));
    return out;
};

public method .add_random_quote() {
    arg quote, @from;
    
    if (!($sys.is_admin(sender())))
        throw(~perm, "Sender is not an admin");
    if (type(quote) != 'string)
        throw(~type, "Quote must be given as a string.");
    quote = ("\"" + quote) + "\"";
    quote = quote.wrap_line(70);
    quote = from ? [@quote, "     - " + (from[1])] : quote;
    quotes += [quote];
};

public method .code_to_html() {
    arg code, object, options;
    var line, object_parse, results, obj_regexp, meth_regexp, chunk, word, method_parse, last_word, mode, chunk_out, meth_r2;
    
    obj_regexp = "\$[a-zA-Z0-9_]+";
    meth_regexp = "((^)|[ (!])\.[a-zA-Z0-9_]+\(";
    meth_r2 = "^(\.[a-zA-Z0-9_]+\()(.*)$";
    results = [];
    for line in (code) {
        if (match_regexp(line, "^ *//")) {
            results += [("<font color=\"#a0a0a0\">" + line) + "</font>"];
        } else {
            object_parse = line.global_regexp(obj_regexp);
            last_word = 0;
            chunk_out = "";
            while (object_parse) {
                [chunk, (word ?= 0), @object_parse] = object_parse;
                if (last_word && (method_parse = chunk.regexp(meth_r2))) {
                    chunk_out += ._do_method_href(method_parse[1], last_word, options);
                    chunk = method_parse[2];
                }
                method_parse = chunk.global_regexp(meth_regexp);
                mode = 0;
                chunk_out += map chunk in (method_parse) to ((mode = !mode) ? chunk : (._do_method_href(chunk, object, options))).join("");
                if (word) {
                    last_word = word;
                    if ((| $object_lib.to_dbref(word) |))
                        chunk_out += ((("<A HREF=\"/bin/display?target=" + ((last_word = word).subrange(2))) + "\">") + word) + "</A>";
                    else
                        chunk_out += word;
                }
            }
            results += [chunk_out + (object_parse.join(""))];
        }
    }
    return results;
};

public method .generate_debug_listing() {
    arg info, mode;
    
    return .(tosym(("_" + tostr(mode)) + "_listing"))(info);
};

public method .generate_listing() {
    arg who, @args;
    var meths, header, title, i;
    
    // called by one of the who_cmds, does all the grunge work.
    [(title ?= "Connected Users"), (meths ?= [['namef, 'doing], ['connected_time], ['idle_time], ['realm_name]]), (header ?= ["Name", "On for", "Idle", "Location"])] = args;
    header = map i in (header) to ([i, "".pad(i.length(), "-")]);
    
    // if who is empty, only print header
    if (!who)
        return [("--- " + title) + " (0) ---"];
    
    // get values using $list.mmap and format
    return ["--- %l (%l) ---".format(title, who.length()), @map i in (meths) to (who.mmap(@i)).tabulate(header, 0, 1, " ", (| sender().linelen() |) || 79), "---"];
};

public method .generate_object_listing() {
    arg objs, multi, @args;
    var line, obj, col, name, fmt, out;
    
    if (!objs) {
        out = ["** None **"];
    } else {
        col = ((| sender().linelen() |) || 79) / 10;
        fmt = ((((("%3L%" + tostr(col * 4)) + "L %") + tostr(col)) + "L %") + tostr(col)) + "R ";
        out = [strfmt(fmt, "#", "Name", "Perms", "Size") + "Manager"];
        col = col * 4;
        for obj in (objs) {
            line = strfmt(fmt, obj.(multi)(@args).length(), obj.namef('xref), $object_lib.see_perms(obj, ["", ""]), obj.size());
            name = (obj.manager()).namef('xref);
            if ((name.length()) > col)
                name = name.pad(col);
            out += [line + name];
        }
    }
    return out;
};

public method .parse_name() {
    arg name, @def;
    var article, match, flag, type, tmps, ignore;
    
    // used to parse $has_name names and name templates
    [name, flag] = (> $parse_lib.opt(name, "u?nique", "p?roper", "n?ormal", "i?gnore") <);
    name = name.join();
    
    // Parse +prop +norm +uniq and +ignore flags
    if (flag) {
        def = [@def, ["p?roper", "p", 1, ""]][1];
        flag = (| flag.last() |) || def;
        if ((flag[1]) == "i?gnore") {
            article = 'prop;
            ignore = 1;
        } else {
            switch (flag[1]) {
                case "n?ormal":
                    type = 'normal;
                case "u?nique":
                    type = 'uniq;
                case "p?roper":
                    type = 'prop;
            }
            article = type;
        }
    } else {
        article = 'prop;
    }
    [name, @tmps] = name.split(" *, *");
    
    // Check to see if the name already has articles in it.
    if (!ignore) {
        if ((match = name.regexp("^the +(.*)$"))) {
            article = 'uniq;
            name = match[1];
        } else if ((match = name.regexp("^(a|an) +(.*)$"))) {
            article = 'normal;
            name = match[2];
        }
    
        // Complain if the flag does not agree with the given article
        if (type && (article != type))
            throw(~article, (("Conflicting name types " + type) + " and ") + article);
    }
    return [[name, article], tmps];
};

public method .point_to_line() {
    arg err, left, right, lineno, line;
    var out;
    
    return [((err + ", line ") + lineno) + ":", "  " + line, strfmt("%*{-}l%*{^}l", left, "", right, "")];
};

public method .punctuation_type() {
    arg str;
    var end, offset, noses;
    
    end = str.length();
    switch (str[end]) {
        case "!":
            return "exclaim";
        case "?":
            return "ask";
        case ".":
            return "say";
        case ")":
            if (end > 1) {
                if ((end > 2) && ((str[end - 1]) == "-"))
                    offset = 2;
                else
                    offset = 1;
                switch (str[end - offset]) {
                    case ";":
                        return "wink";
                    case ":", "=":
                        return "smile";
                    case "8":
                        return "grin";
                    default:
                        return "say";
                }
            }
        case "(":
            if (end > 1) {
                if ((end > 2) && ((str[end - 1]) == "-"))
                    offset = 2;
                else
                    offset = 1;
                if ((str[end - offset]) in ["=", "8", ":"])
                    return "frown";
            }
    }
    return "say";
};

public method .quotes() {
    return quotes;
};

public method .random_password() {
    var len, out, con, vow, rare, num, c, caps, maxcaps, flag, last;
    
    len = random(5) + 7;
    out = "";
    con = "bcdfghjklmnprst";
    rare = ["q", "aa", "ee", "oo", "qu", "v", "w", "x", "z", "y"];
    vow = "aeiou";
    num = "1234567890";
    flag = random(15);
    maxcaps = random(4) + 2;
    while (strlen(out) < len) {
        switch (flag) {
            case 1:
                c = num.random();
                out += c;
                flag = random(15);
            case 2, 3:
                if (rare) {
                    c = rare.random();
                    if (random(2) == 1)
                        rare = setremove(rare, c);
                    out += c;
                    flag = random(15);
                }
            case 4 .. 8:
                c = vow.random();
                while (c == last)
                    c = vow.random();
                out += c;
                flag = random(7) + 3;
            case 9 .. 15, -1:
                c = con.random();
                while (c == last)
                    c = con.random();
                out += c;
                flag = random(10);
            case -15 .. -9:
                c = con.random();
                while (c == last)
                    c = con.random();
                out += uppercase(c);
                flag = random(10);
            case -8 .. -4:
                c = vow.random();
                while (c == last)
                    c = vow.random();
                out += uppercase(c);
                flag = random(7) + 3;
            case -3, -2:
                if (rare) {
                    c = rare.random();
                    if (random(2) == 1)
                        rare = setremove(rare, c);
                    out += uppercase(c);
                    flag = random(15);
                }
        }
        last = c;
        if ((caps < maxcaps) && (random(10) == 1)) {
            caps++;
            flag = -flag;
        }
    }
    return out;
};

public method .random_quote() {
    var which;
    
    which = random(quotes.length());
    if (which)
        return quotes[which];
    return [];
};

public method .random_word() {
    arg @args;
    var len, out, con, vow, rare, c, caps, maxcaps, flag, last, min, max, extra;
    
    [(min ?= 3), (max ?= 10), (extra ?= #[])] = args;
    len = random(max - min) + min;
    out = "";
    con = "bcdfghjklmnprst";
    rare = ["q", "aa", "ee", "oo", "qu", "v", "w", "x", "z", "y"];
    vow = "aeiou";
    if ((| extra['con] |))
        con += extra['con];
    if ((| extra['vow] |))
        vow += extra['vow];
    if ((| extra['rare] |))
        rare += extra['rare];
    flag = random(15);
    maxcaps = random(4) + 2;
    while (strlen(out) < len) {
        switch (flag) {
            case 1, 2:
                if (rare) {
                    c = rare.random();
                    if (random(2) == 1)
                        rare = setremove(rare, c);
                    out += c;
                    flag = random(15);
                }
            case 3 .. 8:
                c = vow.random();
                while (c == last)
                    c = vow.random();
                out += c;
                flag = random(7) + 3;
            case 9 .. 15:
                c = con.random();
                while (c == last)
                    c = con.random();
                out += c;
                flag = random(10);
        }
        last = c;
    }
    return out;
};

public method .valid_message_id() {
    arg str;
    
    return !match_regexp(str, "[^a-z0-9-]");
};

public method .valid_name() {
    arg name, type;
    
    if (!(type in ['prop, 'normal, 'uniq]))
        throw(~invarg, "Type must be one of: 'prop, 'normal or 'uniq");
    if ("\\" in name)
        throw(~invname, "Names cannot include backslashes.");
    if (name && ((name[1]) in ["$", "#"]))
        throw(~invname, "Names cannot begin with \"$\" or \"#\".");
    if (type(name) != 'string)
        throw(~type, "New name must be given as a string.");
    if ((type != 'prop) && (name.match_regexp("^(a|an|the) +")))
        throw(~bad_name, "Articles included in unique or normal name.");
    if (!(type in ['prop, 'normal, 'uniq]))
        throw(~invarg, "Type must be one of: 'prop, 'normal or 'uniq");
};

public method .valid_setting_id() {
    arg str;
    
    return !match_regexp(str, "[^@a-z0-9-]");
};

public method .verify_code() {
    arg code, method, warn;
    var l, line, m, warns, isadmin, msg;
    
    warns = [];
    method = ("\." + tostr(method)) + "\(";
    isadmin = sender().is($admin);
    for l in [1 .. code.length()] {
        line = code[l];
    
        // if its in a comment, ignore it
        if (match_begin(line, "//"))
            continue;
    
        // required warnings, sorry
        if ((m = line.match_regexp("[^._]anticipate_assignment\(")))
            warns += .point_to_line("WARNING: call to anticipate_assignment()", ((m[1])[1]) + 2, ((m[1])[2]) - 2, l, line);
        if ((m = line.match_regexp("(!)[a-z0-9_]+ in "))) {
            warns += ["WARNING: possible ambiguity, line " + l];
            warns += .point_to_line("WARNING: parenthesis suggested around followup expression to '!'", ((m[2])[1]) + 1, (m[2])[2], l, line);
        }
        if ((m = line.match_regexp("(if *\(|&&|\|\|) *[a-z0-9_]+ *(=)[^=]")))
            warns += .point_to_line("WARNING: parenthesis suggested around assignment expression", ((m[3])[1]) + 1, (m[3])[2], l, line);
    
        // optional warnings
        if (warn && (m = line.match_regexp(method)))
            warns += .point_to_line("WARNING: Possible Recursion", ((m[1])[1]) + 2, ((m[1])[2]) - 2, l, line);
    }
    return warns;
};


