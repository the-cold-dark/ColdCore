
new object $introtut_end: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["This is the end of the Introductory Tutorial. More tutorials exist, which you may want to browse. To get a full list of tutorials type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@tutorial ?"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "To enter another tutorial specify it after the ", <$format, ["tt", [], ["@tutorial"], 'do_tt]>, " command. You must exit this tutorial first, by typing 'exit'. ", <$format, ["np", [], [], 'do_np]>, "This tutorial and the core tutorial code were written by Brandon Gillespie and Neale Pickett. The tutorial was based on a concept in Jay's House MOO (JHM), as was some of the original tutorial text."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Other Tutorials", "Other Tutorials"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874251255;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_end];
var $root manager = $introtut_end;
var $root settings = #[["prev-topic", $introtut_who], ["next-topic", ""], ["map-position", 0], ["propagate", 0]];


