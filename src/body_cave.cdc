
new object $body_cave: $place;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Body Cave", "the Body Cave"];
var $location contents = [$reaper, $builder, $guest, $no_one, $programmer, $admin, $player, $storyteller, $user];
var $physical visibility = -100;
var $place darkness = 10;
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 808865147;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$body_cave];
var $root manager = $body_cave;
var $root settings = #[["public-home", 1], ["propagate", 0], ["map-position", 0]];

public method .announce() {
    arg @who_cares;
    
};

public method .will_attach() {
    arg type, @by_whom;
    
    throw(~perm, "Place is not publicly extendable.");
};


