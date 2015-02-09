
new object $introtut_speaking: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["One of the most used features of a Virtual Environment Server is communicating with other users online. There are several ways you can communicate with others, starting with the 'say' command. To experiment with speaking, enter the following:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["say Hello, I am new here."], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Not only will you (virtually) vocalize, but since you are currently in the tutorial you will also see what others will see. It should look like:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " says, \"Hello, I am new here.\"", <$format, ["br", [], [], 'do_br]>, "[ Everyone else would see: ", <$generator, ["name", [], [<$generator, ["viewer", [], [], 'gen_viewer]>], 'gen_name]>, " says, \"Hello, I am new here.\" ]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "For convenience, you can also abbreviate the say command to a single double-quote character (\"). This will provide the exact same result as the slightly longer command did before. You do not need to append another double-quote to your command since it is automatically provided. Try both forms, to see how they work."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Speaking", "Speaking"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874177642;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_speaking];
var $root manager = $introtut_speaking;
var $root settings = #[["prev-topic", $introtut_gender], ["next-topic", $introtut_nonverbal], ["map-position", 0], ["propagate", 0]];


