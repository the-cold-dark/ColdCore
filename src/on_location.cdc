
new object $on_location: $thing, $location;

var $command_cache commands = 0;
var $command_cache shortcuts = 0;
var $described prose = [];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "on_location", "on_location"];
var $located location = $nowhere;
var $located obvious = 1;
var $location contents = [];
var $root created_on = 809991549;
var $root flags = ['methods, 'code, 'variables, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$on_location];
var $root manager = $on_location;
var $thing gender = $gender_neuter;

public method .description() {
    arg flags;
    var line;
    
    line = ((("You see " + ((.contents()).map_to_english('namef, 'name))) + " on ") + (.name())) + ".";
    return (> pass(flags) <) + [line];
};


