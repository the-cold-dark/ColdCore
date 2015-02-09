
new object $registry: $db;

var $db database = #[];
var $registry invalid_names = [];
var $registry max_char_len = 0;
var $registry max_word_len = 0;
var $registry min_char_len = 0;
var $registry reserved_names = [];
var $registry stripped = 0;
var $registry stripped_characters = "";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$registry];
var $root manager = $registry;

public method .database() {
    if (!(.has_flag('variables, sender())))
        throw(~perm, "Database is not readable by sender.");
    return (> pass() <);
};

public method .exact_match() {
    arg name;
    
    // returns a direct match of the name (if there is one)
    if (!(.has_flag('variables)))
        throw(~perm, "Database is not readable by sender.");
    name = .strip_key(name);
    return (> pass(name) <);
};

public method .insert() {
    arg name, obj;
    
    // registers obj with obj.name
    if ((!(.trusts(caller()))) && ((!sender()) == this()))
        throw(~perm, "Permission denied.");
    name = .strip_key(name);
    (> pass(name, obj) <);
};

public method .key_changed() {
    arg old_name, new_name;
    
    // adjusts the database for the new name
    if ((!(.trusts(caller()))) && (sender() != this()))
        throw(~perm, "Permission denied.");
    old_name = .strip_key(old_name);
    new_name = .strip_key(new_name);
    (> pass(old_name, new_name) <);
};

public method .match_begin() {
    arg name;
    var matches, obj;
    
    // returns a direct match, or partial matches
    name = .strip_key(name);
    if (!name)
        throw(~matchnf, "No entries in the database match that key.");
    return (> pass(name) <);
};

public method .remove() {
    arg name;
    
    // removes the object from the database.
    // THIS: is what is broken with guests, should fix it.
    if ((!(.trusts(caller()))) && (sender() != this()))
        throw(~perm, "Permission denied.");
    name = .strip_key(name);
    (> pass(name) <);
};

public method .reserved_names() {
    return reserved_names || [];
};

public method .search() {
    arg name;
    var tmp;
    
    name = .strip_key(name);
    name || throw(~namenf, "No matches found.");
    tmp = (| .exact_match(name) |);
    if (tmp)
        return tmp;
    catch any {
        tmp = (> .match_begin(name) <);
    } with {
        switch (error()) {
            case ~ambig:
                rethrow(error());
            default:
                throw(~namenf, "No matches found.");
        }
    }
    return tmp;
};

public method .set_max_char_len() {
    arg value;
    
    (> .perms(sender(), 'manager) <);
    if (type(value) != 'integer)
        throw(~type, "Value is not an integer");
    max_char_len = value;
};

public method .set_max_word_len() {
    arg value;
    
    (> .perms(sender(), 'manager) <);
    if (type(value) != 'integer)
        throw(~type, "Value is not an integer");
    max_word_len = value;
};

public method .set_min_char_len() {
    arg value;
    
    (> .perms(sender(), 'manager) <);
    if (type(value) != 'integer)
        throw(~type, "Value is not an integer");
    min_char_len = value;
};

public method .strip_key() {
    arg key;
    
    anticipate_assignment();
    if (stripped)
        return key.strip();
    return key;
};

public method .valid_name() {
    arg name;
    var word, sname, matched_obj, m;
    
    // returns 1 if the name is valid
    /// if (!.has_flag('variables,sender()))
    //    throw(~perm, "Database is not readable by sender.");
    (> .perms(caller(), 'trusts) <);
    
    // check name itself first
    sname = .strip_key(name);
    if (max_word_len && (listlen(name.explode()) > max_word_len))
        throw(~invname, ("Names can only be " + max_word_len) + " words long.");
    if (min_char_len && (strlen(sname) < min_char_len))
        throw(~invname, ("Names must have at least " + min_char_len) + " alpha-numeric characters in them");
    if (max_char_len && ((name.length()) > max_char_len))
        throw(~invname, ("Names can only be " + max_char_len) + " characters long.");
    
    // see if it already exists
    if ((| (matched_obj = .exact_match(name)) |)) {
        if (matched_obj != sender())
            throw(~invname, ((("The name \"" + name) + "\" conflicts with the existing user \"") + (matched_obj.name())) + "\"");
    }
    
    // check reserved and invalid names
    if (sname in (.reserved_names()))
        throw(~invname, ("`" + name) + "' is a reserved name.");
    if (invalid_names && (m = regexp(sname, invalid_names)))
        throw(~invname, ("`" + (m[2])) + "' is not allowed as part of a name.");
};


