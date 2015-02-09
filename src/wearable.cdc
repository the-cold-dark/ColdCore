
new object $wearable: $thing;

var $described prose = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[["remove|shed", [["remove|shed", "*", "remove|shed <this>", 'remove_cmd, #[[1, ['this, []]]]]]], ["wear", [["wear", "*", "wear <this>", 'wear_cmd, #[[1, ['this, []]]]]]]];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Generic Wearable Thing", "Generic Wearable Thing"];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 1011584085;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$wearable];
var $root manager = $wearable;
var $thing gender = $gender_neuter;
var $wearable worn = 0;

public method .shed_cmd() {
    arg cmd, cmdstr, what;
    
    (> .perms('command, caller()) <);
    if ((.location()) != sender())
        throw(~stop, ("You are not holding " + (.name())) + ".");
    if (!worn)
        throw(~stop, ("You are not wearing " + (.name())) + ".");
    clear_var('worn);
    sender().shed();
    return ("You remove " + (what.name())) + ".";
};

public method .wear_cmd() {
    arg cmdstr, cmd, what;
    
    (> .perms('command, caller()) <);
    if ((.location()) != sender())
        throw(~stop, ((("You must be holding " + (.name())) + " in order to wear ") + ((.gender()).pronoun('po))) + ".");
    if (worn)
        throw(~stop, ("You are already wearing " + (.name())) + "!");
    worn = sender().wear();
    return ("You wear " + (.name())) + ".";
};

public method .will_move() {
    arg mover, place;
    
    (> pass(mover, place) <);
    if (worn)
        throw(~worn, ((.name()).capitalize()) + " is currently being worn.");
};


