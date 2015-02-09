
new object $the_pit: $place;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["A cozy atmosphere pervades this room, a small hideaway where people can come to relax and socialize. The cement walls are covered with various scribbles burn marks, and stains of unrecognizable origin."], #[]]>;
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $foundation msgs = #[["housekeeper", #[["general", <$ctext_frob, [["Dust bunnies rise from under the furniture to envelop ", <$generator, ["actor", [], [], 'gen_actor]>, "'s comatose form, leaving behind a small pile of musty lint."], #[]]>]]]];
var $has_commands local = \
  #[["zibble", [["zibble", "*", "zibble <any>", 'foo_cmd, #[[1, ['any, []]]]]]]];
var $has_name name = ['prop, "The Pit", "The Pit"];
var $location contents = [$robot];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$the_pit];
var $root manager = $the_pit;
var $root settings = #[["public-home", 0], ["map-position", 0], ["propagate", 0]];

root method .core_the_pit() {
    .set_prose("A cozy atmosphere pervades this room, a small hideaway where people can come to relax and socialize. The cement walls are covered with various scribbles burn marks, and stains of unrecognizable origin.");
};


