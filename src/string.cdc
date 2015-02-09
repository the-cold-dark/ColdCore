
new object $string: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$string];
var $root manager = $string;
var $string alphabet = "abcdefghijklmnopqrstuvwxyz";
var $string base64str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
var $string non_alphanumeric = "!@#$%^&*()_+-=~`'{}[]|/?\",.<>;: ";
var $string number_names = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
var $string numbers = "0123456789";

public method .a_or_an() {
    arg string;
    
    return $english_lib.indef_article(string);
};

public method .add_indefinite() {
    arg str;
    
    anticipate_assignment();
    return ((str.a_or_an()) + " ") + str;
};

public method .alphabet() {
    return alphabet;
};

public method .capitalize(): native;

public method .center() {
    arg text, width, @args;
    var fill, sides;
    
    // args[1] <op> == what to fill the left|right side with.
    // args[2] <op> == if exists also fill the right side.
    [(fill ?= " "), (sides ?= 'left)] = args;
    if (sides == 'both)
        return strfmt(("%*{" + fill) + "}c", width, text);
    else
        return pad("", (width - strlen(text)) / 2, fill) + text;
};

public method .chop() {
    arg str, len, @end;
    
    // chops string off end.length() characters before len and appends len
    [(end ?= "...")] = end;
    if ((strlen(str) < len) || (strlen(str) < strlen(end)))
        return str;
    anticipate_assignment();
    return pad(str, len - strlen(end)) + end;
};

public method .compare(): native;

public method .crypt(): native;

public method .dbquote_explode(): native;

public method .decode64() {
    arg enc_chars;
    var i, j, k, ints, out_buf, len, num, ob;
    
    i = 1;
    out_buf = `[];
    len = enc_chars.length();
    while (i < len) {
        refresh();
        ints = [0, 0, 0, 0];
        j = 1;
        while (j <= 4) {
            if (((enc_chars[i]) in base64str) || ((enc_chars[i]) == "=")) {
                for k in [1 .. 64] {
                    refresh();
                    if (strcmp(enc_chars[i], base64str[k]) == 0) {
                        ints = replace(ints, j, (k - 1) % 64);
                        break;
                    }
                }
                j++;
            }
            i++;
        }
        out_buf = out_buf + `[(((ints[1]).shleft(2)) % 256) + ((ints[2]).shright(4)), (((ints[2]).shleft(4)) % 256) + ((ints[3]).shright(2)), (((ints[3]).shleft(6)) % 256) + (ints[4])];
    }
    return buf_to_str(out_buf);
};

public method .equals() {
    arg str1, str2;
    
    return str1 == str2;
};

public method .explode(): native;

public method .explode_delimited() {
    arg str, left, right;
    var pattern, parsed, matched, match_num, match_result;
    
    // parse str looking for anything surrounded by left and right
    // ;$string.explode_delimited("foo<bar>baz", "<", ">")  
    // => [["foo", 1, "baz"], ["bar"]]
    pattern = ((("*" + left) + "*") + right) + "*";
    parsed = [];
    matched = [];
    match_num = 0;
    anticipate_assignment();
    while (str) {
        match_result = match_pattern(str, pattern);
        if (match_result) {
            match_num++;
            parsed += [match_result[1], match_num];
            matched += [match_result[2]];
            str = match_result[3];
        } else {
            parsed += [str];
            str = "";
        }
    }
    return [parsed, matched];
};

public method .explode_english_list() {
    arg line, @opts;
    var x, output, tmp;
    
    if (!line)
        return [];
    
    // explodes an english list ("foo, bar and zoo").
    line = line.explode(",");
    output = [];
    for x in (line) {
        x = .trim(x);
        if ((| x.subrange(1, 4) |) == "and ")
            output += [.trim(x.subrange(4))];
        else
            output += [x];
    }
    
    // check the last element, if they didn't specify  'noand
    if (!('noand in opts)) {
        line = (output[output.length()]).explode();
        tmp = "";
        for x in [1 .. line.length()] {
            if ((line[x]) == "and") {
                output = output.delete(output.length());
                if (tmp)
                    output += [tmp];
                tmp = (line.subrange(x + 1)).join();
                if (tmp)
                    output += [tmp];
    
                // only bother with the first "and"
                break;
            }
            tmp = (tmp + (tmp ? " " : "")) + (line[x]);
        }
    }
    return output;
};

public method .explode_http_encoding() {
    arg args;
    var fields, field, values;
    
    fields = #[];
    for field in (args.explode("&")) {
        field = field.explode("=");
        if (listlen(field) == 1)
            field = [field[1], ""];
        fields = fields.add(@field);
    }
    return fields;
};

public method .explode_list() {
    arg str;
    
    if (("," in str) || (" and " in str))
        return str.explode_english_list();
    else
        return str.explode();
};

public method .explode_quoted() {
    arg str;
    var out, result, x, qstr;
    
    out = [];
    
    // HACK: we need to make this a native--its horribly inefficient
    qstr = ("#$#QUOTE-" + time()) + "#$#";
    str = strsub(str, "\\\"", qstr);
    while (str) {
        result = match_pattern(str, "*\"*\"*");
        if (result) {
            out += ((result[1]).explode()) + [(result[2]).trim()];
            str = result[3];
        } else {
            out += str.explode();
            str = "";
        }
    }
    for x in [1 .. listlen(out)]
        out = replace(out, x, strsub(out[x], qstr, "\""));
    return out;
};

public method .explode_template_word() {
    arg template;
    var t, x, idx, out, new;
    
    // this only explodes single word templates
    template = template.explode("|");
    out = [];
    for t in (template) {
        idx = "?" in t;
        if (idx) {
            t = t.strip("?");
            new = t.subrange(1, idx - 1);
            out += [new];
            for x in [idx .. t.length()] {
                new += t[x];
                out += [new];
            }
        } else {
            out += [t];
        }
    }
    return out;
};

public method .explode_url() {
    arg line;
    var out, args, i;
    
    i = "?" in line;
    if (i) {
        args = substr(line, i + 1);
        line = substr(line, 1, i - 1);
    }
    if (args)
        out = #[['path, explode(line, "/")], ['args, .explode_http_encoding(args)]];
    else
        out = #[['path, explode(line, "/")], ['args, #[]]];
    return out;
};

public method .find_escaped() {
    arg str, char;
    var good, start, pos, p;
    
    good = 0;
    start = 0;
    while ((!good) && (start < (str.length()))) {
        pos = (char in (str.subrange(start + 1))) + start;
        good = 1;
        if (pos > start) {
            p = pos - 1;
            while ((p > 0) && ((str[p]) == "\\")) {
                good = good ? 0 : 1;
                p = p - 1;
            }
        }
        if (good)
            return pos;
        else
            start = pos;
    }
};

public method .format(): native;

public method .global_regexp() {
    arg string, regexp;
    var result, location, left, begin_match, end_match;
    
    result = [];
    left = string;
    while (left) {
        if ((location = match_regexp(left, regexp))) {
            [begin_match, end_match] = location[1];
            result += [(begin_match == 1) ? "" : (left.subrange(1, begin_match - 1))];
            result += [left.subrange(begin_match, end_match)];
            left = left.subrange(begin_match + end_match);
        } else {
            result += [left];
            left = "";
        }
    }
    if (!((result.length()) % 2))
        result += [""];
    return result;
};

public method .html_escape(): native;

public method .index() {
    arg @args;
    
    return stridx(@args);
};

public method .is_boolean() {
    arg str;
    
    if (match_regexp(str, "^(yes|y|true|t|1)$"))
        return 1;
    if (match_regexp(str, "^(no|n|false|f|0)$"))
        return 0;
    return -1;
};

public method .is_negative() {
    arg str;
    
    if (match_regexp(str, "^(no|n|false|f|none|nobody|nowhere|0)$"))
        return 1;
    return 0;
};

public method .is_numeric() {
    arg string;
    
    return toint(string) || (| ((string.trim())[1]) == "0" |);
};

public method .is_positive() {
    arg str;
    
    if (match_regexp(str, "^(yes|y|true|t|all|everybody|anybody|everywhere|anywhere|1)$"))
        return 1;
    return 0;
};

public method .last() {
    arg str;
    
    return str[str.length()];
};

public method .left() {
    arg str, width, @fchar;
    
    // will not chop off 'str' if it is longer than width, use pad() for that.
    [(fchar ?= " ")] = fchar;
    if (strlen(str) < width)
        return str + pad("", width - (str.length()), fchar);
    return str;
};

public method .length(): native;

public method .lowercase(): native;

public method .match_begin(): native;

public method .match_pattern(): native;

public method .match_regexp(): native;

public method .match_template(): native;

public method .non_alphanumeric() {
    return non_alphanumeric;
};

public method .numbers() {
    return numbers;
};

public method .pad(): native;

public method .prefix_a_or_an() {
    arg str;
    
    anticipate_assignment();
    return (($english_lib.indef_article(str)) + " ") + str;
};

public method .random() {
    arg str;
    
    return str[random(strlen(str))];
};

public method .rangeset() {
    arg string, start, len, new;
    
    anticipate_assignment();
    return ((string.subrange(1, start - 1)) + new) + (string.subrange(start + len));
};

public method .regexp(): native;

public method .regexp_escape() {
    arg str;
    
    // anticipate_assignment();
    return strsed(str, "([[\^$|)(.*+?])", "\%1", "g");
};

public method .replace(): native;

public method .reverse() {
    arg string;
    var length, output, x;
    
    length = string.length();
    output = "";
    for x in [1 .. length]
        output += string[(length - x) + 1];
    return output;
};

public method .rformat() {
    arg first, second, @rest;
    
    // so you can mmap a list of strings through strfmt
    return strfmt(second, first, @rest);
};

public method .right() {
    arg str, width, @fchar;
    
    // will not chop off 'str' if it is longer than width (unlike pad())
    [(fchar ?= " ")] = fchar;
    if (strlen(str) < width)
        return pad(str, -width, fchar);
    return str;
};

public method .rindex() {
    arg string, index;
    
    return stridx(string, index, -1);
};

public method .sed(): native;

public method .split(): native;

public method .strip() {
    arg string, @strip;
    
    anticipate_assignment();
    if (!strip)
        return strsed(string, "[][!@#$%^&*()_+=~`'{}|/?\"\,.<>;: -]", "", "g");
    else
        return strsed(string, ("[" + (strip[1])) + "]", "", "g");
};

public method .strip_article() {
    arg str;
    
    return strsed(str, "^(an|a|the)  *", "", "g");
};

public method .strip_html() {
    arg str;
    var r, ra;
    
    while ((r = "<" in str))
        str = (str.subrange(1, r - 1)) + (str.subrange((">" in str) + 1));
    str = strsub(str, "&lt;", "<");
    str = strsub(str, "&gt;", ">");
    str = strsub(str, "&nbsp;", " ");
    str = strsub(str, "&quot;", "\"");
    str = strsub(str, "&amp;", (ra = ("/" + ($code_lib.random_word())) + "\\"));
    while ((r = "&" in str))
        str = ((str.subrange(1, r - 1)) + "*") + (str.subrange((";" in str) + 1));
    str = strsub(str, ra, "&");
    return str;
};

public method .subrange(): native;

public method .to_buffer() {
    arg string;
    
    return (> str_to_buf(string) <);
};

public method .to_bytes() {
    arg str;
    var words, num;
    
    words = str.explode();
    if (listlen(words) == 1) {
        if (!(words = regexp(words[1], "^([0-9]+)(.*)$")))
            throw(~type, "Invalid size.");
    }
    num = (> (words[1]).to_number() <);
    switch (words[2]) {
        case "b", "byte", "bytes":
            return num;
        case "k", "kb", "kbytes", "kilobytes":
            return num * 1024;
        case "m", "mb", "mbytes", "megabytes":
            return (num * 1024) * 1024;
        case "g", "gb", "gbytes", "gigabytes":
            return ((num * 1024) * 1024) * 1024;
        default:
            throw(~type, "Invalid byte size: " + (words[2]));
    }
};

public method .to_html() {
    arg line;
    
    anticipate_assignment();
    line = strsub(line, "&", "&amp;");
    line = strsub(line, "<", "&lt;");
    line = strsub(line, ">", "&gt;");
    line = strsub(line, "\"", "&quot;");
    return line;
};

public method .to_number() {
    arg str;
    
    if (str.is_numeric())
        return toint(str);
    throw(~nonum, ("\"" + str) + "\" is not a number.");
};

public method .to_symbol() {
    arg str;
    
    str = lowercase(strsed(str, "[^a-zA-Z0-9_]+", "", "g"));
    return (> tosym(str) <);
};

public method .trim(): native;

public method .unquote() {
    arg str;
    
    if (str && (((str[1]) == "\"") && ((str[str.length()]) == "\"")))
        return str.subrange(2, (str.length()) - 2);
    return str;
};

public method .uppercase(): native;

public method .valid_ident() {
    arg str;
    
    return strsed(str, "[^a-z0-9_]+", "", "g") == str;
};

public method .word(): native;

public method .wrap_line() {
    arg str, len, @stuff;
    var output, cutoff, firstline, prefix, plen;
    
    // takes string and wraps it by words, compared to length, breaks with \n
    [(prefix ?= ""), (firstline ?= 0)] = stuff;
    output = "";
    if (firstline)
        str = prefix + str;
    plen = strlen(prefix);
    while (strlen(str) > len) {
        cutoff = stridx(substr(str, 1, len), " ", -1);
        if (cutoff <= plen) {
            output += "\n" + substr(str, 1, len);
            str = prefix + substr(str, len + 1);
        } else {
            output += "\n" + substr(str, 1, cutoff - 1);
            str = prefix + substr(str, cutoff + 1);
        }
    }
    return (output ? ((output.subrange(3)) + "\n") : "") + str;
};

public method .wrap_lines() {
    arg str, len, @stuff;
    var output, cutoff, firstline, prefix, plen;
    
    // takes string and wraps it by words, compared to length, returns a list. 
    [(prefix ?= ""), (firstline ?= 0)] = stuff;
    output = [];
    if (firstline)
        str = prefix + str;
    plen = strlen(prefix);
    while (strlen(str) > len) {
        cutoff = stridx(substr(str, 1, len), " ", -1);
        if (cutoff <= plen) {
            output += [substr(str, 1, len)];
            str = prefix + substr(str, len + 1);
        } else {
            output += [substr(str, 1, cutoff - 1)];
            str = prefix + substr(str, cutoff + 1);
        }
    }
    return output + [str];
};


