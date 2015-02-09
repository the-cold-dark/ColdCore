
new object $user_db: $registry;

var $db database = <$trie, [0, "GRNpS", [0, "e", [0, "n", [0, "e", [0, "r", [0, "i", [0, "c", [0, "GBPAU", [["uestObject", $guest], ""], [["uilder", $builder], ""], [["rogrammer", $programmer], ""], [["dmin", $admin], ""], [["serObject", $user], ""]]]]]]]], [["eaper", $reaper], ""], [["oOne", $no_one], ""], [["layer", $player], ""], [["toryteller", $storyteller], ""]]>;
var $registry invalid_names = "(^| )(ass|cunt|fuck|shit|damn)( |$)";
var $registry max_char_len = 20;
var $registry min_char_len = 3;
var $registry reserved_names = ["user", "builder", "programmer", "admin", "housekeeper", "Reaper", "noone", "guest", "a", "i", "an", "your", "you'r", "me", "god"];
var $registry stripped = 1;
var $registry stripped_characters = "!@#$%^&*()_+-=~`'{}[]|/?\",.<>;: ";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$user_db];
var $root manager = $user_db;
var $root trusted = [$user];
var $user_db connected = [];
var $user_db invalid_chars = "$#@!^&%~:";

public method .clean_user_db() {
    var key, db, invalid;
    
    db = (.database()).to_dict();
    invalid = [];
    if (0) {
        // broken, not sure why, something is corrupting the trie --Brandon
        for key in (dict_keys(db)) {
            if (!valid(db[key])) {
                .remove(key);
                connected = setremove(connected, db[key]);
                invalid += [key];
            }
        }
    } else {
        for key in (dict_keys(db)) {
            if (!valid(db[key])) {
                connected = setremove(connected, db[key]);
                db = dict_del(db, key);
                invalid += [key];
            }
        }
        .set_database(db.to_trie());
    }
    return ["Invalid $user_db entries: " + (invalid.to_english())];
};

public method .connected() {
    var x;
    
    for x in (connected) {
        if ((!valid(x)) || (| !(x.connections()) |))
            connected = setremove(connected, x);
    }
    return connected;
};

root method .core_user_db(): nooverride  {
    var o;
    
    .set_database($trie.new());
    for o in (($user.descendants()) + [$user])
        .insert(o.name(), o);
};

public method .did_connect() {
    (> .perms(caller(), $user) <);
    connected = connected.setadd(sender());
};

public method .did_disconnect() {
    .perms(caller(), $user);
    connected = connected.setremove(sender());
};

public method .match() {
    arg name;
    
    return (> .search(name) <);
};

public method .reserved_names() {
    return pass() + ((($smtp.mail_aliases()).keys()).mmap('strip));
};

public method .total_connected() {
    return (.connected()).length();
};

public method .user_dbrefs() {
    var db;
    
    db = .database();
    if (type(db) != 'dictionary)
        db = db.to_dict();
    return (db.values()).compress();
};

public method .users() {
    return (.database()).keys();
};

public method .valid_name() {
    arg name;
    
    if (((name.strip(invalid_chars)).length()) < (name.length()))
        throw(~invname, ("Names cannot contain any of '" + invalid_chars) + "'.");
    return (> pass(name) <);
};


