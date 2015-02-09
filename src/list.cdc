
new object $list: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_list;
var $root inited = 1;
var $root managed = [$list];
var $root manager = $list;

public method ._vcolumnize() {
    arg list, lines, cols, width, @other;
    var outlist, line, i, j, sep;
    
    [(sep ?= " ")] = other;
    width -= sep.length();
    lines = (lines > (list.length())) ? (list.length()) : lines;
    outlist = [];
    for i in [1 .. lines] {
        line = (list[i]).pad(width);
        for j in [1 .. cols]
            (| (line = (line + sep) + ((list[i + (j * lines)]).pad(width))) |);
        outlist += [line.trim('right)];
    }
    return outlist;
};

public method .add() {
    arg list, element;
    
    return (> setadd(list, element) <);
};

public method .addkey() {
    arg l, key, val;
    var i;
    
    i = find i in [1 .. l.length()] where (((l[i])[1]) == key);
    anticipate_assignment();
    return i ? replace(l, i, [key, val]) : (l + [[key, val]]);
};

public method .affix() {
    arg l1, l2;
    var last, first;
    
    // Combines l1 and l2 by appending the first element of l2 to the last
    // of l1.
    if (type(l2) != 'list)
        l2 = [l2];
    last = (| l1.last() |) || "";
    first = (| l2[1] |) || "";
    l1 = [@l1.chop(), last + first];
    if ((l2.length()) > 1)
        l1 += l2.subrange(2);
    return l1;
};

public method .center_lines() {
    arg lines, width, @args;
    var line, fmt;
    
    fmt = ("%" + width) + "c";
    return map line in (lines) to (strfmt(fmt, line));
};

public method .chop() {
    arg list, @count;
    
    // chops the last <count> elements off the list.
    // return [] if count is longer then the list.
    count = count || 1;
    anticipate_assignment();
    return (| sublist(list, 1, listlen(list) - count) |) || [];
};

public method .columnize() {
    arg list, cols, @rest;
    var width, lines, line, separator, linelength, curcol;
    
    // turn [...] into ".   .   ."
    // rest[1]==separator; rest[2]==linelength
    [(separator ?= "   "), (linelength ?= 78)] = rest;
    width = (linelength / cols) - (separator.length());
    lines = [];
    while (list) {
        line = (list[1]).pad(width);
        list = list.subrange(2);
        for curcol in [2 .. cols] {
            if (list) {
                line = (line + separator) + ((list[1]).pad(width));
                list = list.subrange(2);
            }
        }
        lines += [line];
    }
    return lines;
};

public method .columnize2() {
    arg list, cols, @rest;
    var width, lines, line, separator, linelength, x, handled_length;
    
    // turn [...] into ".   .   ."
    // rest[1]==separator; rest[2]==linelength
    [(separator ?= "   "), (linelength ?= 78)] = rest;
    width = (linelength / cols) - (separator.length());
    lines = [];
    for x in [1 .. (list.length()) / cols] {
        line = ((list.subrange((x * cols) - 1, cols)).mmap('pad, width)).join(separator);
        lines += [line];
    }
    handled_length = x * cols;
    if ((list.length()) != handled_length)
        lines += [((list.subrange(handled_length + 1)).mmap('pad, width)).join(separator)];
    return lines;
};

public method .columnize3() {
    arg list, cols, @rest;
    var width, lines, line, separator, linelength, x, handled_length, even_length;
    
    // turn [...] into ".   .   ."
    // rest[1]==separator; rest[2]==linelength
    [(separator ?= "   "), (linelength ?= 78)] = rest;
    width = (linelength / cols) - (separator.length());
    lines = [];
    handled_length = 1;
    even_length = (list.length()) / cols;
    while (handled_length < even_length) {
        line = ((list.subrange(handled_length, cols)).mmap('pad, width)).join(separator);
        lines += [line];
        handled_length += cols;
        refresh();
    }
    if ((list.length()) >= handled_length)
        lines += [((list.subrange(handled_length)).mmap('pad, width)).join(separator)];
    return lines;
};

public method .compress() {
    arg list;
    var x;
    
    // [a,a,b,b,c,c,d,d] => [a,b,c,d]
    // removes duplicate entries in a list
    return hash x in (list) to ([x, 1]).keys();
};

public method .count() {
    arg list, elem;
    var count, i;
    
    // count of elem in list
    for i in (list) {
        if (i == elem)
            count++;
    }
    return count;
};

public method .del() {
    arg list, element;
    
    return (> setremove(list, element) <);
};

public method .delete(): native;

public method .delkey() {
    arg l, key;
    var i;
    
    i = find i in [1 .. l.length()] where (((l[i])[1]) == key);
    anticipate_assignment();
    return i ? delete(l, i) : l;
};

public method .element_maxlength() {
    arg list;
    var i, s, t;
    
    s = 0;
    for i in (list) {
        if ((t = strlen(tostr(i))) > s)
            s = t;
    }
    return s;
};

public method .flatten() {
    arg list;
    var toret, elem;
    
    // [[[x], x], x]   =>   [x, x, x]
    toret = [];
    for elem in (list) {
        if (type(elem) == 'list)
            toret += .flatten(elem);
        else
            toret += [elem];
    }
    return toret;
};

public method .fmt_tb() {
    arg tb, @args;
    
    return $parse_lib.traceback(tb, @args);
};

public method .fold() {
    arg list, object, method, @args;
    var i, out;
    
    // apply object.method to a current result and the next element, return the
    // result
    switch (list.length()) {
        case 0:
            return 0;
        case 1:
            return list[1];
    }
    out = list[1];
    for i in (sublist(list, 2, listlen(list) - 1))
        out = object.(method)(out, i, @args);
    return out;
};

public method .format() {
    arg list, format;
    
    return strfmt(format, @list);
};

public method .getkey() {
    arg l, key;
    var i, x;
    
    if (!(x = find i in [1 .. l.length()] where (((l[i])[1]) == key)))
        throw(~keynf, "Key not found.");
    return (l[x])[2];
};

public method .getkey_index() {
    arg l, key;
    var i, x;
    
    if (!(x = find i in [1 .. l.length()] where (((l[i])[1]) == key)))
        throw(~keynf, "Key not found.");
    return x;
};

public method .grep() {
    arg lines, regexp;
    var line, result, out, reg;
    
    out = [];
    for line in [1 .. lines.length()] {
        if ((reg = match_regexp(lines[line], regexp)))
            out += [[line, reg, lines[line]]];
    }
    return out;
};

public method .insert(): native;

public method .intersection() {
    arg l1, l2;
    var i;
    
    // set intersection of the arguments
    return filter i in (l1) where (i in l2);
};

public method .join(): native;

public method .last() {
    arg list;
    
    return list[listlen(list)];
};

public method .lcolumnize() {
    arg list, @args;
    var line, part, lines, max, cols, col, width, len, sep;
    
    [(len ?= (| sender().linelen() |) || 78), (sep ?= " ")] = args;
    lines = [];
    line = "";
    max = (.element_maxlength(list)) + (sep.length());
    cols = (len > max) ? (len / max) : 1;
    width = (len / cols) - (sep.length());
    col = cols;
    for part in (list) {
        col = col - 1;
        if (!col) {
            lines = lines + [line + part];
            line = "";
            col = cols;
            continue;
        }
        line = line + (part.pad(width));
    }
    if (line)
        return lines + [line];
    return lines;
};

public method .length(): native;

public method .lmap() {
    arg list, method, @args;
    var x, s;
    
    // call methods for each thing in list on sender()
    s = sender();
    return map x in (list) to (s.(method)(x, @args));
};

public method .locate() {
    arg list, value;
    var idx;
    
    return filter idx in [1 .. listlen(list)] where (value == (list[idx]));
    
    // Find the index in the list where the value of the element is the value being searched for.  Filter out the zeros so that only valid indices are returned.
    // [1, 2, 3, 4].locate(5) -> []
    // [4, 2, 3, 4].locate(4) -> [1, 4]
};

public method .make() {
    arg n, @elt;
    var i;
    
    [(elt ?= 0)] = elt;
    return map i in [1 .. n] to (elt);
};

public method .map_to_english() {
    arg list, method, @args;
    
    return .to_english(.mmap(list, method, @args));
};

public method .map_to_string() {
    arg list, method, @args;
    
    return .join(.mmap(list, method, @args));
};

public method .match_nth() {
    arg objs, str, nth;
    var obj, n;
    
    n = nth;
    for obj in (objs) {
        if (obj.match_name(str)) {
            if (!--n)
                return obj;
        }
    }
    throw(~match, ((("There are not " + ((.numbers())[nth])) + " ") + str) + "'s available.");
};

public method .match_object() {
    arg objs, str;
    var obj, found, l, f;
    
    found = [];
    for obj in (objs) {
        if ((type(obj) == 'frob) && (!valid(frob_class(obj))))
            throw(~badfrob, "Bad Thing Frob", obj);
        else if (obj.match_name(str))
            found += [obj];
    }
    if (listlen(found) == 1)
        return found[1];
    if (listlen(found) > 1) {
        if ((f = filter f in (found) where ((f.name()) == str))) {
            if (listlen(f) == 1)
                return f[1];
            found = f;
        }
        throw(~ambig, "ambiguous match", found);
    }
    throw(~objnf, "Object not found.");
};

public method .match_object2() {
    arg objs, str;
    var obj, found;
    
    found = [];
    for obj in (objs) {
        if ((type(obj) == 'frob) && (!valid(frob_class(obj))))
            (<$thing_frob, frob_value(obj)>).discard();
        else if (obj.match_name(str))
            found += [obj];
    }
    if (listlen(found) == 1)
        return found[1];
    if (listlen(found) > 1)
        throw(~ambig, "ambiguous match", found);
    throw(~objnf, "Object not found.");
};

public method .max() {
    arg list;
    
    return (| max(@list) |) || 0;
};

public method .mfilter() {
    arg list, method, @args;
    var x;
    
    // similar to .mmap, but returns a list of objects which returned a
    // true value from 'method.
    return filter x in (list) where (x.(method)(@args));
};

public method .min() {
    arg list;
    
    return (| min(@list) |) || 0;
};

public method .mmap() {
    arg list, method, @args;
    var x;
    
    // call 'method on each object, return results.
    return map x in (list) to (x.(method)(@args));
};

public method .mmap_objects() {
    arg list, method, @args;
    var x;
    
    return map x in (list) to ((type(x) == 'objnum) ? x.(method)(@args) : x);
};

public method .nonzero() {
    arg list;
    var x;
    
    return filter x in (list) where (x);
};

public method .nth_element_maxlength() {
    arg lists, element;
    var list;
    
    // Returns longest string whose index is element in one of the lists in
    // lists.
    if (type(element) != 'integer)
        throw(~type, "Second argument is not an integer");
    if (type(lists) != 'list)
        throw(~type, "First argument is not a list");
    return map list in (lists) to (tostr(list[element]).length()).max();
};

public method .numbered_text() {
    arg text;
    var line;
    
    // receives a list of strings, returns that list with line numbers
    // prepended
    return map line in [1 .. text.length()] to ("%3r: %l".format(line, text[line]));
};

public method .numbers() {
    // returns a list of numbers
    return ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
};

public method .odds() {
    arg list;
    var chunk, mode;
    
    return filter chunk in (list) where ((mode = !mode));
};

public method .omap() {
    arg list, object, method, @args;
    var obj;
    
    // calls object.method(obj, @args) for each obj in list
    return map obj in (list) to (object.(method)(obj, @args));
};

public method .prefix() {
    arg list, prefix;
    var elem;
    
    return map elem in (list) to (prefix + elem);
};

public method .random() {
    arg list;
    
    return list[random(listlen(list))];
};

public method .replace(): native;

public method .reverse() {
    arg list;
    var i, len;
    
    // .reverse(list)
    // -> list with its elements reversed
    len = (list.length()) + 1;
    return map i in [1 .. len - 1] to (list[len - i]);
};

public method .set_contains() {
    arg @args;
    var super, list, element;
    
    // True if the first list given is a superset of all subsequent lists.
    // False otherwise.  [] is a superset of [] and nothing else; anything is
    // a superset of [].  If only one list is given, return true.
    super = args ? (args[1]) : [];
    for list in (delete(args, 1)) {
        for element in (list) {
            if (!(element in super))
                return 0;
        }
    }
    return 1;
};

public method .set_difference() {
    arg @args;
    var set, list, element;
    
    // Usage:  diff(set 1, set 2, ..., set n)
    // Returns all elements of set 1 that are not in sets 2..n
    if (!args)
        return [];
    set = args[1];
    anticipate_assignment();
    for list in (delete(args, 1)) {
        for element in (list)
            set = setremove(set, element);
    }
    return set;
};

public method .set_equal() {
    arg set1, set2;
    var e, dict1, dict2;
    
    // True if the two lists given contain the same elements.
    // False otherwise.
    dict1 = hash e in (set1) to ([e, 1]);
    dict2 = hash e in (set2) to ([e, 1]);
    for e in (dict1.keys()) {
        if (!dict_contains(dict2, e))
            return 0;
    }
    for e in (dict2.keys()) {
        if (!dict_contains(dict1, e))
            return 0;
    }
    return 1;
};

public method .set_intersection() {
    arg l1, l2;
    var i, out;
    
    // set intersection if the arguments
    out = [];
    for i in (l1) {
        if (i in l2)
            out = out.setadd(i);
    }
    return out;
};

public method .setadd(): native;

public method .setremove(): native;

public method .setremove_all() {
    arg list, remove;
    var part;
    
    if (type(list) != 'list)
        throw(~type, "First argument must be a list.");
    if (type(remove) != 'list)
        throw(~type, "Second argument must be a list.");
    anticipate_assignment();
    for part in (remove)
        list = setremove(list, part);
    return list;
};

public method .slice() {
    arg big_list, element;
    var list, i;
    
    // Return elementh' element of all lists in big_list
    // No type or length checking done for speed purposes.
    // element can be a list, in which cases, a list of list is returned
    if (type(element) == 'integer)
        return map list in (big_list) to (list[element]);
    else
        return map list in (big_list) to (map i in (element) to (list[i]));
};

public method .sort(): native;

public method .subrange(): native;

public method .sum() {
    arg data;
    var ret, i;
    
    // returns a sum of each element in the list.
    if (!data)
        return 0;
    [ret, @data] = data;
    for i in (data)
        ret += i;
    return ret;
};

public method .swap() {
    arg list, a, b;
    var holder;
    
    // swap elements at indexes a and b
    if ((listlen(list) < a) || ((listlen(list) < b) || ((a < 1) || (b < 1))))
        throw(~args, "Index specifiers are outside the range of the list.");
    anticipate_assignment();
    holder = list[a];
    list = replace(list, a, list[b]);
    list = replace(list, b, holder);
    return list;
};

public method .tabulate() {
    arg list, headers, @rest;
    var i, j, t, t1, trim_cols, header_sep, colsizes, len;
    
    if (!list)
        return [];
    [(colsizes ?= 0), (trim_cols ?= 0), (header_sep ?= " "), (len ?= 79)] = rest;
    if (!headers)
        headers = .make(list.length(), []);
    if (type(headers[1]) == 'string)
        headers = map i in (headers) to ([i]);
    
    // Find the column sizes
    if (!colsizes) {
        if (trim_cols) {
            t = map i in (list) to (refresh() && ((i.element_maxlength()) + 2));
            t1 = filter i in [1 .. t.length()] where ((t[i]) > 2);
            t = map i in (t1) to (t[i]);
            list = map i in (t1) to (list[i]);
            headers = map i in (t1) to (headers[i]);
        }
        colsizes = t ? map i in [1 .. headers.length()] to (refresh() && max(t[i], ((headers[i]).element_maxlength()) + 2)) : map i in [1 .. list.length()] to (refresh() && (max((headers[i]).element_maxlength(), (list[i]).element_maxlength()) + 2));
    }
    t = map i in (colsizes) to (("%" + i) + "l").sum();
    t1 = map i in (colsizes) to (((("%" + i) + "{") + header_sep) + "}l").sum();
    
    // Now format the thing...
    return map i in (headers.transpose()) to (refresh() && (((t1.format(@i)).pad(len)).trim('right))) + map i in (list.transpose()) to (refresh() && (((t.format(@i)).pad(len)).trim('right)));
};

public method .to_buffer() {
    arg @args;
    
    return (> strings_to_buf(@args) <);
};

public method .to_dict() {
    arg list;
    var a;
    
    return hash a in (list) to (a);
};

public method .to_english() {
    arg list, @options;
    var empty, and, sep;
    
    [(empty ?= "nothing"), (and ?= " and "), (sep ?= ", ")] = options;
    switch (list.length()) {
        case 0:
            return empty;
        case 1:
            return tostr(list[1]);
    }
    return (join(list.delete(list.length()), sep) + and) + tostr(list[list.length()]);
};

public method .transpose() {
    arg list;
    
    return $math.transpose(list);
};

public method .union(): native;

public method .valid_objects() {
    arg list;
    var obj;
    
    return filter obj in (list) where (valid(obj));
};

public method .vcolumnize() {
    arg list, cols, @rest;
    var linelength, sep, width, lines, i, j, line, outlist;
    
    [(linelength ?= (| sender().linelen() |) || 78), (sep ?= " ")] = rest;
    lines = ((list.length()) / cols) + (((list.length()) % cols) ? 1 : 0);
    width = linelength / cols;
    return ._vcolumnize(list, lines, cols, width, sep);
};

public method .vcolumnize2() {
    arg list, lines, @rest;
    var linelength, sep, cols, width, i, j, line, outlist;
    
    [(linelength ?= (| sender().linelen() |) || 78), (sep ?= " ")] = rest;
    cols = ((list.length()) / lines) + (((list.length()) % lines) ? 1 : 0);
    width = linelength / cols;
    return ._vcolumnize(list, lines, cols, width, sep);
};

public method .vcolumnize3() {
    arg list, lines, @rest;
    var linelength, cols, width, i, j, line, outlist;
    
    [(linelength ?= (| sender().linelen() |) || 78)] = rest;
    cols = ((list.length()) / lines) + (((list.length()) % lines) ? 1 : 0);
    width = linelength / cols;
    outlist = [];
    for i in [1 .. lines] {
        line = "";
        for j in [0 .. cols]
            (| (line = line + ((list[i + (j * lines)]).pad(width))) |);
        outlist += [line];
    }
    return outlist;
};

public method .vcolumnize4() {
    arg list, @args;
    var linelength, sep, lines, cols, width, max;
    
    [(linelength ?= (| sender().linelen() |) || 79), (sep ?= " ")] = args;
    max = (.element_maxlength(list)) + (sep.length());
    cols = (linelength > max) ? (linelength / max) : 1;
    width = linelength / cols;
    lines = ((list.length()) / cols) + (((list.length()) % cols) ? 1 : 0);
    return ._vcolumnize(list, lines, cols, width, sep);
};


