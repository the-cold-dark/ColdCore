
new object $compiler: $utilities;

var $compiler glue_table = ["p", "br", "ul", "ol", "dl", "table", "switch", "case", "range", "default"];
var $root created_on = 837583518;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$compiler];
var $root manager = $compiler;

public method ._check_glue() {
    arg tokens, i;
    var j, bracket;
    
    // WARNING: This method can throw (it should be called with (| |)'s)
    while ((tokens[i]) == " ")
        i++;
    if ((bracket = tokens[i++]) in ["{", "["]) {
        while ((tokens[i]) == " ")
            i++;
        j = i;
        if ((tokens[i]) in glue_table)
            return [j, (bracket == "{") ? 'fmtname : 'genname];
    }
    return 0;
};

public method ._kill_spaces() {
    arg list;
    var i;
    
    return filter i in (list) where (i != " ");
};

public method ._make_tag() {
    arg token, mode, vars, name, flags, args;
    var method, class;
    
    if (mode == 'fmtname) {
        if (token != "}")
            throw(~parse, "Extra ']' encountered.");
        method = tosym("do_" + (name.strip()));
        class = $format;
    }
    if (mode == 'genname) {
        if (token != "]")
            throw(~parse, "Extra '}' encountered.");
        method = tosym("gen_" + (name.strip()));
        class = $generator;
    }
    catch ~methodnf
        return (> .(method)(vars, flags, args) <);
    with
        return (> [class.new_tag(name, flags, args), vars] <);
};

public method .compile_cml() {
    arg text;
    var vars, ret;
    
    vars = #[];
    (> (ret = .parse_string_new(vars, .tokenize(text))) <);
    return $ctext_frob.new_with(ret[1], ret[2]);
};

public method .do_detail() {
    arg vars, flags, args;
    var dets, item, name;
    
    dets = (| vars['details] |) || #[];
    for item in (flags) {
        if ((type(item) == 'list) && ((item[1]) == "name")) {
            name = item[2];
            break;
        }
    }
    if (!name)
        throw(~parse, "No name for {detail}.");
    dets = dets.add(name, args);
    return [$format.new_tag("detail", flags, []), vars.add('details, dets)];
};

public method .do_dl() {
    arg vars, flags, args;
    
    return [$format.new_tag("dl", flags, ._kill_spaces(args)), vars];
};

public method .do_link() {
    arg vars, flags, args;
    var links, item, node;
    
    if (listlen(args) == 0)
        throw(~parse, "{link} requires an argument of the link name.");
    links = (| vars['links] |) || #[];
    for item in (flags) {
        if ((type(item) == 'list) && ((item[1]) == "node")) {
            node = item[2];
            break;
        }
    }
    if (!node)
        throw(~parse, "No node for {link}.");
    if (((args.length()) != 1) || (type(args[1]) != 'string))
        throw(~parse, "{link} argument must be a string");
    links = links.add(args[1], node);
    return [$format.new_tag("link", flags, args), vars.add('links, links)];
};

public method .do_method() {
    arg vars, flags, args;
    var m;
    
    if (!(m = (| ((flags.to_list())[1])[1] |)))
        throw(~parse, "{method} syntax: {method OBJ.METHOD:text}");
    if ((m[1]) != "$")
        m = "$" + m;
    m = (> $parse_lib.ref(m) <);
    if ((m[1]) != 'method)
        throw(~parse, "{method} target is not a method reference");
    m = (substr(tostr(m[2]), 2) + ".") + (m[4]);
    return [$format.new_tag("method", [m], args), vars];
};

public method .do_obj() {
    arg vars, flags, args;
    
    if (!dict_contains(flags, "context"))
        throw(~parse, "no context flag for {obj}");
    if (!dict_contains(flags, "object"))
        throw(~parse, "no object flag for {obj}");
    if (listlen(args) == 0)
        throw(~parse, "{obj} requires an arg of the name");
    flags = flags.replace("context", tosym(flags["context"]));
    return [$format.new_tag("obj", flags, args), vars];
};

public method .do_ol() {
    arg vars, flags, args;
    
    return [$format.new_tag("ol", flags, ._kill_spaces(args)), vars];
};

public method .do_switch() {
    arg vars, flags, args;
    var current, d, tag, i, m, r;
    
    if (listlen(args) == 0)
        throw(~parse, "[switch] requires arguments.");
    if (!(| flags["value"] |))
        throw(~parse, "Value flag missing.");
    d = #[];
    r = [];
    tag = (current = 0);
    
    // The last default is a dummy - it forces the parser to flush current
    for i in (args + [$generator.new_tag("default", [], [])]) {
        if ((type(i) == 'frob) && ((class(i) == $generator) && ((i.name()) in ["case", "default", "range"]))) {
            if (tag != 0) {
                if (type(tag) == 'list)
                    r += [[@tag.subrange(2), current]];
                else
                    d = d.add(tag, current);
            }
            current = [];
            switch (i.name()) {
                case "case":
                    if ((((i.args()).length()) != 1) || (type((tag = (i.args())[1])) != 'string))
                        throw(~parse, "[case:...] takes only a single string as an argument.");
                case "range":
                    if ((((i.args()).length()) != 1) || (!(| ((m = ((i.args())[1]).match_pattern("*..*")).length()) == 2 |)))
                        throw(~parse, "range tag should look like [range:lower..upper].");
                    tag = ['range, @m];
                case "default":
                    tag = 'default;
            }
        } else {
            if (tag == 0)
                throw(~parse, "Expression before [case]");
            current += [i];
        }
    }
    if (r)
        d = d.add('ranges, r);
    return [$format.new_tag("switch", flags, d), vars];
};

public method .do_table() {
    arg vars, flags, args;
    
    if (!(flags.contains("cols")))
        throw(~parse, "no 'cols' flag for {table}.");
    return [$format.new_tag("table", flags, ._kill_spaces(args)), vars];
};

public method .do_tr() {
    arg vars, flags, args;
    
    return [$format.new_tag("tr", flags, ._kill_spaces(args)), vars];
};

public method .do_ul() {
    arg vars, flags, args;
    
    return [$format.new_tag("ul", flags, ._kill_spaces(args)), vars];
};

public method .do_web() {
    arg vars, flags, args;
    
    if (!(flags.contains("src")))
        throw(~parse, "no 'src' flag for {web}");
    if (!(flags.contains("name")))
        throw(~parse, "no 'name' flag for {web}");
    return [$format.new_tag("web", flags, args), vars];
};

public method .gen_data() {
    arg vars, flags, args;
    
    if (!(flags.contains("source")))
        throw(~parse, "no source flag for [data]");
    return [$generator.new_tag("data", flags, args), vars];
};

public method .gen_random() {
    arg vars, flags, args;
    
    if (!(flags.contains("high")))
        throw(~parse, "no high flag for [random]");
    return [$generator.new_tag("random", flags, args), vars];
};

public method .gen_switch() {
    arg vars, flags, args;
    var current, d, tag, i, m, r;
    
    if (listlen(args) == 0)
        throw(~parse, "[switch] requires arguments.");
    if (!(| flags["value"] |))
        throw(~parse, "Value flag missing.");
    d = #[];
    r = [];
    tag = (current = 0);
    
    // The last default is a dummy - it forces the parser to flush current
    for i in (args + [$generator.new_tag("default", [], [])]) {
        if ((type(i) == 'frob) && ((class(i) == $generator) && ((i.name()) in ["case", "default", "range"]))) {
            if (tag != 0) {
                if (type(tag) == 'list)
                    r += [[@tag.subrange(2), current]];
                else
                    d = d.add(tag, current);
            }
            current = [];
            switch (i.name()) {
                case "case":
                    if ((((i.args()).length()) != 1) || (type((tag = (i.args())[1])) != 'string))
                        throw(~parse, "[case:...] takes only a single string as an argument.");
                case "range":
                    if ((((i.args()).length()) != 1) || (!(| ((m = ((i.args())[1]).match_pattern("*..*")).length()) == 2 |)))
                        throw(~parse, "range tag should look like [range:lower..upper].");
                    tag = ['range, @m];
                case "default":
                    tag = 'default;
            }
        } else {
            if (tag == 0)
                throw(~parse, "Expression before [case]");
            current += [i];
        }
    }
    if (r)
        d = d.add('ranges, r);
    return [$generator.new_tag("switch", flags, d), vars];
};

public method .glue_table() {
    return glue_table;
};

public method .parse_string_new() {
    arg vars, tokens;
    var mode, out, word, token, i, tmp, ret;
    
    if (!tokens)
        return [[], vars];
    mode = ['spaces, 'plain];
    i = 1;
    out = [];
    word = "";
    while (i <= (tokens.length())) {
        refresh();
        token = tokens[i++];
        switch (mode[1]) {
            case 'spaces:
                if (token != " ") {
                    i--;
                    mode = mode.subrange(2);
                }
            case 'plain:
                if (!(token in ["{", "["])) {
                    if (token == " ") {
                        // No scatter because .check can throw
                        if ((| (ret = ._check_glue(tokens, i)) |)) {
                            i = ret[1];
                            mode = [ret[2], @mode];
                            if (word)
                                out += [word];
                            word = "";
                            continue;
                        }
                    }
                    word += token.sed("\\\(.)", "%1", "g");
                } else {
                    if (word)
                        out += [word];
                    word = "";
                    mode = ['spaces, (token == "{") ? 'fmtname : 'genname, @mode];
                }
            case 'fmtname, 'genname:
                if (((mode[1]) == 'fmtname) && (token == "quote")) {
                    mode = mode.subrange(2);
                    out += [$format.new_tag("quote", [], [tokens[i++]])];
                    i++;
                } else {
                    if (token in glue_table)
                        mode = [mode[1], 'spaces, @mode.subrange(2)];
                    mode = ['spaces, 'flags, #[], token, @mode];
                }
            case 'flags:
                if (token in ["}", "]"]) {
                    ret = (> ._make_tag(token, mode[4], vars, mode[3], mode[2], []) <);
                    vars = ret[2];
                    out += [ret[1]];
                    mode = mode.subrange(5);
                } else if (token == "=") {
                    throw(~parse, "Value flag with no key.");
                } else if (token == ":") {
                    mode = ['spaces, 'args, out, mode[2], @mode.subrange(3)];
                    out = [];
                } else if ((| (tokens[i]) == "=" |)) {
                    mode = ['flagvalue, token, @mode];
                    i++;
                } else {
                    mode = mode.replace(2, (mode[2]).add(token, 1));
                }
            case 'flagvalue:
                if (token in ["}", "]", ":"]) {
                    mode = mode.subrange(3);
                    i--;
                } else if (token == " ") {
                    mode = mode.subrange(3);
                } else if (!(token in ["[", "{"])) {
                    mode = ['spaces, @(mode.subrange(3)).replace(2, (mode[4]).add(mode[2], token.sed("\\\(.)", "%1", "g")))];
                } else {
                    if (word)
                        out += [word];
                    word = "";
                    mode = ['spaces, (token == "{") ? 'fmtname : 'genname, 'flagset, @mode.subrange(2)];
                }
            case 'flagset:
                i--;
                mode = ['spaces, @(mode.subrange(3)).replace(2, (mode[4]).add(mode[2], out[out.length()]))];
                out = out.subrange(1, (out.length()) - 1);
            case 'args:
                if (token in ["}", "]"]) {
                    if (word) {
                        out += [word];
                        word = "";
                    }
                    ret = ._make_tag(token, mode[5], vars, mode[4], mode[3], out);
                    vars = ret[2];
                    out = (mode[2]) + [ret[1]];
                    mode = mode.subrange(6);
                } else if (token in ["{", "["]) {
                    if (word)
                        out += [word];
                    word = "";
                    mode = ['spaces, (token == "{") ? 'fmtname : 'genname, @mode];
                } else {
                    if (token == " ") {
                        if ((| (ret = ._check_glue(tokens, i)) |)) {
                            i = ret[1];
                            mode = [ret[2], @mode];
                            if (word)
                                out += [word];
                            word = "";
                            continue;
                        }
                    }
                    word += token.sed("\\\(.)", "%1", "g");
                }
        }
    }
    if (word)
        out += [word];
    while ((mode[1]) == 'spaces)
        mode = mode.subrange(2);
    if (mode != ['plain])
        throw(~parse, "Unclosed tag.");
    return [out, vars];
};

public method .tokenize() {
    arg text;
    var word, out, escaped, token, i, pre_count, open_form, str;
    
    // break text into a list of tokens.
    if (type(text) == 'string)
        text = [text];
    out = [];
    word = "";
    escaped = 0;
    
    // pre_count is 0, except inside pre, when it counts the {}'s
    pre_count = 0;
    open_form = 0;
    for str in (text) {
        str = str.explode(" ", 1);
        for token in (str) {
            refresh();
            if ((!token) && (!pre_count))
                continue;
            while ((i = token.match_regexp("[][{}=\:]"))) {
                refresh();
                i = (i[1])[1];
                if (escaped) {
                    escaped = 0;
                    word = (word + "\\") + (token.subrange(1, i));
                } else if (pre_count) {
                    if ((token[i]) == "{") {
                        pre_count++;
                        word += token.subrange(1, i);
                    } else if ((token[i]) == "}") {
                        pre_count--;
                        if (pre_count) {
                            word += token.subrange(1, i);
                        } else {
                            word += token.subrange(1, i - 1);
                            out = word ? (out + [word, token[i]]) : (out + [token[i]]);
                            word = "";
                        }
                    } else {
                        word += token.subrange(1, i);
                    }
                } else {
                    word += token.subrange(1, i - 1);
                    open_form = (token[i]) == "{";
                    if ((token[i]) == "\\") {
                        escaped = 1;
                    } else {
                        out = word ? (out + [word, token[i]]) : (out + [token[i]]);
                        word = "";
                    }
                }
                token = token.subrange(i + 1);
            }
            if (open_form && (token == "quote")) {
                pre_count = 1;
                open_form = 0;
                out += [token];
                token = "";
                continue;
            }
            word += token;
            if (escaped || pre_count) {
                escaped = 0;
                word += " ";
            } else {
                out = word ? (out + [word, " "]) : (out + [" "]);
                word = "";
            }
        }
        if (pre_count)
            word = word ? ((word.subrange(1, (word.length()) - 1)) + "\n") : "\n";
    }
    if (word)
        out += [word];
    if (out) {
        if ((out.last()) == " ")
            out = out.subrange(1, (out.length()) - 1);
        else
            out = out.replace(out.length(), (out.last()).subrange(((out.last()).length()) - 1));
    }
    return out;
};


