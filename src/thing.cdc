
new object $thing: $located;

var $described prose = [];
var $foundation defined_msgs = #[["desc-integrated", #[['branches, ["general"]]]]];
var $foundation msgs = #[["desc-integrated", #[["general", <$ctext_frob, [[], #[]]>]]]];
var $has_commands local = #[];
var $has_commands remote = #[["@boot", [["@boot", "*", "@boot <this>", 'boot_cmd, #[[1, ['this, []]]]]]]];
var $has_commands shortcuts = #[];
var $has_name name = ['normal, "thing", "a thing"];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 796268969;
var $root defined_settings = #[["home", #[['get, ['home]], ['parse, ['parse_home]]]], ["gender", #[['get, ['gender]], ['set, ['set_gender]], ['parse, ['parse_gender_setting]]]], ["lock", #[['get, ['get_lock]], ['set, ['set_lock]], ['parse, ['parse_lock]], ['format, ['format_lock]]]]];
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$thing];
var $root manager = $thing;
var $root settings = #[["home", $lost_and_found]];
var $thing gender = $gender_neuter;
var $thing lock = <$true_lock_frob, []>;

public method .boot_cmd() {
    arg cmdstr, cmd, this;
    var loc, dest, exit;
    
    loc = .location();
    if (!(| loc.perms(sender(), 'manager) |)) {
        (| .tell((((sender().name()) + " tried to boot you from ") + (loc.name())) + "!") |);
        loc.announce((((((sender().name()) + " tried to boot ") + (.name())) + " from ") + (loc.name())) + "!", sender(), this());
        return ((("Only " + ((loc.manager()).name())) + " can boot people from ") + (loc.name())) + "!";
    }
    dest = .home();
    catch any {
        sender().tell(("You boot " + (.name())) + ".");
        loc.announce((((((sender().name()) + " boots ") + (.name())) + " from ") + ((.location()).name())) + ".", this(), sender());
        if ((sender().location()) != loc)
            (sender().location()).announce((((((sender().name()) + " boots ") + (.name())) + " from ") + ((.location()).name())) + ".", this(), sender());
        (> .move_to(dest) <);
    } with {
        return (traceback()[1])[2];
    }
};

public method .directed_tell() {
    arg @args;
    
};

root method .format_lock() {
    arg value;
    var unparse;
    
    unparse = value.unparse();
    if (unparse == "yes")
        return "unlocked";
    else if (unparse == "no")
        return "locked";
    return unparse;
};

public method .gender() {
    arg @args;
    
    return gender;
};

public method .gender_context() {
    return gender.pronoun('po);
};

public method .get_lock() {
    arg name, definer;
    
    return lock || (<$true_lock_frob, []>);
};

public method .home() {
    arg @args;
    var home;
    
    home = .get_local_setting("home", $thing);
    if (home)
        return home;
    if ((.manager()).is($user))
        return .manager();
    return $lost_and_found;
};

root method .init_thing() {
    gender = $gender_neuter;
};

public method .lock() {
    return lock;
};

public method .lock_cmd() {
    arg cmdstr, cmd, this;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    lock = $false_lock_frob.new();
    return "You lock " + (.name());
};

public method .lock_with_cmd() {
    arg cmdstr, cmd, this, prep, str;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    catch ~objnf, ~parse {
        lock = $lock_frob.parse(str, sender());
        return ((((("You lock " + (.name())) + " ") + prep) + " ") + (lock.lock_name('thing))) + ".";
    } with {
        switch (error()) {
            case ~objnf:
                return "Object not found in lock string.";
            case ~parse:
                return "Invalid lock string.";
        }
    }
};

public method .parse_gender_setting() {
    arg value, @args;
    var g, gs;
    
    gs = $sys.get_valid_genders();
    g = value in (gs.mmap('name));
    if (!g)
        throw(~set, "Gender must be one of: " + ((gs.mmap('name)).to_english("", " or ")));
    return gs[g];
};

public method .parse_home() {
    arg value, @args;
    var home;
    
    home = (| .match_environment(value) |) || (> $place_db.search(value) <);
    if ((!(home.is_writable_by(user()))) && ((!(home.trusts(sender()))) && (!(home.get_setting("public-home", $place)))))
        throw(~notpublic, ("You do not have permission to make " + (home.name())) + " your home.");
    return home;
};

public method .parse_lock() {
    arg value;
    
    if (value in ["lock", "locked"])
        value = "no";
    else if (value in ["unlock", "unlocked"])
        value = "yes";
    return (> $lock_frob.parse(value, user() || this()) <);
};

protected method .set_gender() {
    arg name, definer, value;
    
    (> .perms(sender()) <);
    gender = value;
};

protected method .set_lock() {
    arg name, definer, value;
    
    if (class(value) == $true_lock_frob)
        (| clear_var('lock) |);
    else
        lock = value;
};

public method .try_lock() {
    arg mover;
    
    return lock && ((mover != $path) && (lock.try(mover)));
};

public method .unlock_cmd() {
    arg cmdstr, cmd, this;
    
    if (!(| .perms(sender()) |))
        return ((("Only " + ((.manager()).name())) + " can lock ") + (.name())) + "!";
    lock = $true_lock_frob.new();
    return "You unlock " + (.name());
};

public method .will_move() {
    arg mover, place;
    
    (> pass(mover, place) <);
    if (mover.is($housekeeper))
        return;
    if (lock && ((mover != $path) && ((mover != $location) && (!(lock.try(mover))))))
        throw(~locked, ((((.name()).capitalize()) + " is locked to ") + (lock.lock_name('thing))) + ".");
    
    //else if (!.trusts(mover))
    //    throw(~move, "You cannot move " + this());
    //
    // If this is left in (and fixed as above, used to be sender() instead of
    // mover), then nothing can move anything that doesn't trust the mover.
    // --Sean 1999.08.27
};


