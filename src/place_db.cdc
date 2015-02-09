
new object $place_db: $registry;

var $db database = #[["void", $void], ["nowhere", $nowhere], ["Pit", $the_pit]];
var $registry stripped_characters = "!@#$%^&*()_+-=~`'{}[]|/?\",.<>;:";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$place_db];
var $root manager = $place_db;

root method .core_place_db() {
    var p, db;
    
    db = .database();
    for p in (db.keys()) {
        if (!valid(db[p]))
            .remove(p);
    }
};

public method .place_destroyed() {
    arg @args;
    
    // called in $place.uninit_place (incase the place is in the db)
};

public method .strip_key() {
    arg key;
    
    anticipate_assignment();
    return strsed(key, "^(the|a|an) +", "").strip();
};


