
new object $located_location: $thing, $location;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $has_commands remote = #[];
var $has_name name = ['uniq, "Generic Located Location", "the Generic Located Location"];
var $located location = $void;
var $located obvious = 1;
var $location contents = [];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$located_location];
var $root manager = $located_location;
var $thing gender = $gender_neuter;

public method .description() {
    arg flags;
    var desc, out, c;
    
    // type is either 'on' or 'in'
    if (!(flags.contains('type)))
        return (> pass(flags) <);
    out = [];
    for c in (.contents())
        out += [c.name()];
    return (> pass(flags) <) + [((((("There is " + (out.to_english())) + " ") + (flags['type])) + " ") + (.name())) + "."];
};

public method .environment() {
    return (.contents()) + pass();
};

public method .will_arrive() {
    arg mover, old_place;
    
    (> pass(mover, old_place) <);
    if (sender() == (.location()))
        throw(~perm, ((sender().namef('ref)) + " is holding ") + (.namef('ref)));
};


