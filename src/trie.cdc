
new object $trie: $frob;

var $root created_on = 800074237;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_trie;
var $root inited = 1;
var $root managed = [$trie];
var $root manager = $trie;

public method ._add() {
    arg trie, key, @values;
    var n, word;
    
    // This still ain't working. Current problem: values get mingled
    if (trie[1]) {
        if (key == ((trie[1])[1]))
            return trie.replace(1, [key, @values]);
        word = (trie[1])[1];
        if (word) {
            if (!(n = (word[1]) in (trie[2])))
                trie = [@trie.replace(2, (trie[2]) + (word[1])), ._add([0, ""], word.subrange(2), @(trie[1]).subrange(2))];
            else
                trie = trie.replace(n + 2, ._add(trie[n + 2], word.subrange(2), @(trie[1]).subrange(2), @values));
            trie = trie.replace(1, 0);
        }
    }
    if (((!(trie[1])) && ((trie.length()) == 2)) || (!key))
        return trie.replace(1, [key, @values]);
    if (!(n = (key[1]) in (trie[2])))
        return [@trie.replace(2, (trie[2]) + (key[1])), ._add([0, ""], key.subrange(2), @values)];
    return trie.replace(n + 2, ._add(trie[n + 2], key.subrange(2), @values));
};

public method ._del() {
    arg trie, key;
    var n, t1;
    
    if ((trie[1]) && (key == ((trie[1])[1]))) {
        trie = trie.replace(1, 0);
        if (((trie.length()) == 3) && (!((trie[3])[2])))
            trie = [((trie[3])[1]).replace(1, (trie[2]) + (((trie[3])[1])[1])), ""];
        return trie;
    }
    if (!key)
        throw(~ambig, "Trie: Can't delete more than one key.");
    if (!(n = (key[1]) in (trie[2])))
        throw(~keynf, "Trie: No such key.");
    t1 = (> ._del(trie[n + 2], key.subrange(2)) <);
    if (t1 == [0, ""])
        trie = (trie.delete(n + 2)).replace(2, ((trie[2]).subrange(1, n - 1)) + ((trie[2]).subrange(n + 1)));
    else
        trie = trie.replace(n + 2, t1);
    if (((trie.length()) == 3) && ((!(trie[1])) && (!((trie[3])[2]))))
        trie = [((trie[3])[1]).replace(1, (trie[2]) + (((trie[3])[1])[1])), ""];
    return trie;
};

public method .add() {
    arg @args;
    
    return (<$trie, (._add(@args))>);
};

public method .del() {
    arg @args;
    
    return (<$trie, (._del(@args))>);
};

public method .keys() {
    arg trie, @prefix;
    var n, i, l;
    
    [(prefix ?= "")] = prefix;
    l = (trie[1]) ? [prefix + ((trie[1])[1])] : [];
    if (trie[2]) {
        for i in [1 .. (trie[2]).length()]
            l += .keys(trie[2 + i], prefix + ((trie[2])[i]));
        refresh();
    }
    return l;
};

public method .match_begin() {
    arg trie, key;
    var n, t;
    
    if ((trie[1]) && ((key == ((trie[1])[1])) || (((trie.length()) == 2) && match_begin((trie[1])[1], key))))
        return trie[1];
    if (!key)
        throw(~ambig, "Trie: ambiguous match.");
    if (!(n = (key[1]) in (trie[2])))
        throw(~keynf, "Trie: key not found.");
    (> (t = .match_begin(trie[n + 2], key.subrange(2))) <);
    t = t.replace(1, (key[1]) + (t[1]));
    return t;
};

public method .match_exact() {
    arg trie, key;
    var n, t;
    
    if ((trie[1]) && (key == ((trie[1])[1])))
        return trie[1];
    if ((!key) || (!(n = (key[1]) in (trie[2]))))
        throw(~keynf, "Trie: key not found.");
    (> (t = .match_exact(trie[n + 2], key.subrange(2))) <);
    t = t.replace(1, (key[1]) + (t[1]));
    return t;
};

public method .new() {
    arg @ignore;
    
    return (<this(), [0, ""]>);
};

public method .to_dict() {
    arg trie, @prefix;
    var n, i, dict;
    
    // This function will only convert single-valued tries (such as were
    // probably obtained from dictionaries
    [(prefix ?= "")] = prefix;
    dict = (trie[1]) ? #[[prefix + ((trie[1])[1]), (trie[1])[2]]] : #[];
    if (trie[2]) {
        for i in [1 .. (trie[2]).length()]
            dict = dict_union(dict, .to_dict(trie[2 + i], prefix + ((trie[2])[i])));
        refresh();
    }
    return dict;
};


