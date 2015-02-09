
new object $db: $misc;

var $db database = #[];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$db];
var $root manager = $db;

protected method .clean_database() {
    var elem;
    
    // clean up a  "STR"=>$obj  style database
    for elem in (database) {
        if (!valid(elem[2]))
            database = database.del(elem[1]);
    }
};

public method .database() {
    return database;
};

public method .exact_match() {
    arg key;
    var match;
    
    // get an exact match of a key, return the value
    match = (| (type(database) == 'dictionary) ? (database[key]) : ((database.match_exact(key))[2]) |);
    if (match == ~keynf)
        throw(~matchnf, ("No object by the key \"" + key) + "\" exists.");
    return match;
};

root method .init_db() {
    database = #[];
};

public method .insert() {
    arg key, value;
    
    // insert a key/value to the database
    if ((!(sender() == this())) && (!(.trusts(caller()))))
        (> .perms(sender(), 'writer) <);
    database = database.add(key, value);
};

public method .key_changed() {
    arg old_key, new_key;
    var val;
    
    // change the value of a key.
    if ((!(sender() == this())) && (!(.trusts(caller()))))
        (> .perms(sender(), 'writer) <);
    val = (> .exact_match(old_key) <);
    .remove(old_key);
    .insert(new_key, val);
};

public method .match_begin() {
    arg key;
    var matches, entry;
    
    // First check if we're using $trie frob
    if (type(database) == 'frob) {
        matches = (| (database.match_begin(key))[2] |);
        if (matches == ~keynf)
            throw(~matchnf, "No entries in the database match that key.");
        if (matches == ~ambig)
            throw(~ambig, "More than one object matches that key.");
        return matches;
    }
    
    // use match_begin of the key, return the value
    matches = [(| .exact_match(key) |)];
    if (!(matches[1])) {
        matches = [];
        for entry in (database) {
            if (match_begin(entry[1], key))
                matches = setadd(matches, entry[2]);
        }
    }
    if (matches) {
        if ((matches.length()) == 1)
            return matches[1];
        else
            throw(~ambig, "More than one object matches that key.", matches);
    } else {
        throw(~matchnf, "No entries in the database match that key.");
    }
};

public method .remove() {
    arg key;
    
    // remove a key/value from the database
    if ((!(sender() == this())) && (!(.trusts(caller()))))
        (> .perms(sender(), 'writer) <);
    database = database.del(key);
};

protected method .set_database() {
    arg newdb;
    
    // this should not be called often, its primarily for corification
    database = newdb;
};

root method .uninit_db() {
    database = 0;
};

public method .value_changed() {
    arg key, new_value;
    
    // change the value of a key.
    if ((!(sender() == this())) && (!(.trusts(caller()))))
        (> .perms(sender(), 'writer) <);
    (> .remove(key) <);
    (> .insert(key, new_value) <);
};


