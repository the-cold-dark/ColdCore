
new object $dictionary: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$dictionary];
var $root manager = $dictionary;

public method .add(): native;

public method .add_elem() {
    arg dict, key, elem;
    var value;
    
    // Add an element to the list value of a dictionary key
    value = (| dict[key] |);
    if ((type(value) != 'list) && (type(value) != 'error))
        throw(~type, ((("Value for key " + key) + " (") + value) + ") is not a list.");
    anticipate_assignment();
    if (value) {
        // reduce references to 'value'
        dict = dict_add(dict, key, 0);
        value += [elem];
    } else {
        value = [elem];
    }
    return dict_add(dict, key, value);
};

public method .apply() {
    arg tdict, list;
    var x;
    
    // Apply a translation-dict to a list
    for x in [1 .. list.length()] {
        catch ~keynf
            list = list.replace(x, tdict[list[x]]);
    }
    return list;
};

public method .apply_to_keys() {
    arg tdict, dict;
    var x, newdict;
    
    // Apply a t-dict to the keys of a dict
    newdict = #[];
    for x in (dict) {
        catch ~keynf
            x = x.replace(1, tdict[x[1]]);
        newdict = newdict.add(@x);
    }
    return newdict;
};

public method .apply_to_values() {
    arg tdict, dict;
    var x, newdict;
    
    // Apply a t-dict to the values of a dict
    newdict = #[];
    for x in (dict) {
        catch ~keynf
            x = x.replace(2, tdict[x[2]]);
        newdict = newdict.add(@x);
    }
    return newdict;
};

public method .contains(): native;

public method .del(): native;

public method .del_elem() {
    arg dict, key, elem;
    var value;
    
    value = (| dict[key] |);
    if ((type(value) != 'list) && (type(value) != 'error))
        throw(~type, ((("Value for key " + key) + " (") + value) + ") is not a list.");
    anticipate_assignment();
    dict = dict_add(dict, key, 0);
    value = setremove(value, elem);
    if (!value)
        return dict_del(dict, key);
    return dict_add(dict, key, value);
};

public method .invert() {
    arg dict;
    var x;
    
    // Invert a dict keys and values
    return hash x in (dict) to ([x[2], x[1]]);
};

public method .keys(): native;

public method .mmap() {
    arg list, method, @args;
    var x;
    
    // call 'method on each object, return results.
    return map x in (list) to (x.(method)(@args));
};

public method .replace() {
    arg dict, key, value;
    
    // GOING AWAY!
    anticipate_assignment();
    return dict_add(dict, key, value);
};

public method .setadd_elem() {
    arg dict, key, elem;
    var value;
    
    value = (| dict[key] |);
    if ((type(value) != 'list) && (type(value) != 'error))
        throw(~type, ((("Value for key " + key) + " (") + value) + ") is not a list.");
    anticipate_assignment();
    if (value) {
        dict = dict_add(dict, key, 0);
        value = setadd(value, elem);
    } else {
        value = [elem];
    }
    return dict_add(dict, key, value);
};

public method .to_dict() {
    arg dict;
    
    return dict;
};

public method .to_list() {
    arg dict;
    var x;
    
    // merges into an associated list.
    return map x in (dict) to (x);
};

public method .to_trie() {
    arg dict;
    var i, trie;
    
    trie = $trie.new();
    for i in (dict) {
        trie = trie.add(i[1], i[2]);
        refresh();
    }
    return trie;
};

public method .union(): native;

public method .values(): native;


