
new object $introtut_gender: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["You, as well as every other person in ", <$generator, ["servname", [], [], 'gen_servname]>, ", has a gender. If you look at yourself, you will see a phrase about being awake; the pronouns used are determined by your gender, which is most likely the default gender of 'neuter' (no gender). ", <$format, ["np", [], [], 'do_np]>, "To see a list of possible genders, type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set gender"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "To set a gender from the list type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set gender=GENDER"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "And then look at yourself (type 'look me'). ", <$format, ["np", [], [], 'do_np]>, "You can change your gender whenever you like; right now you should use @set gender to set yourself to the gender of your choice."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Gender", "Gender"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177645;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_gender];
var $root manager = $introtut_gender;
var $root settings = #[["prev-topic", $introtut_desc], ["next-topic", $introtut_speaking], ["map-position", 0], ["propagate", 0]];


