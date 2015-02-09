
new object $introtut_lines: $introductory_tutorial;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["If text on your display is scrolling off the edge of the screen,", <$format, ["br", [], [], 'do_br]>, " you will need to find a means to wrap it. The preferred method is", <$format, ["br", [], [], 'do_br]>, " to use a special client designed for connecting to Virtual Community", <$format, ["br", [], [], 'do_br]>, " Servers. We suggest using Tinyfugue, or another similar client. More", <$format, ["br", [], [], 'do_br]>, " information on available clients can be found by typing:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help clients"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Up to now in the tutorial, all lines have been pre-wrapped by the server.", <$format, ["br", [], [], 'do_br]>, " To determine if your text is wrapping or not, look at the following", <$format, ["br", [], [], 'do_br]>, " line which counts from one to fifty. ", <$format, ["np", [], [], 'do_np]>, "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 ", <$format, ["np", [], [], 'do_np]>, "If line wrapping is working for you, you should be able to see all", <$format, ["br", [], [], 'do_br]>, " numbers (although they will take two or more lines). If you only", <$format, ["br", [], [], 'do_br]>, " see one line, and it ends before 50, line wrapping is not working", <$format, ["br", [], [], 'do_br]>, " for you. If you cannot get a client to do line wrapping for you,", <$format, ["br", [], [], 'do_br]>, " you can set your content type as text/wrapped. This method is not", <$format, ["br", [], [], 'do_br]>, " suggested, as it is slower and you may have problems with some", <$format, ["br", [], [], 'do_br]>, " formatting. You can set your content type with the following command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set content-type=text/wrapped"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "All further topics will assume your client can word-wrap properly,", <$format, ["br", [], [], 'do_br]>, " or that you are using text/wrapped."], #[]]>;
var $dmi_data descriptions = #[];
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Line Wrapping", "Line Wrapping"];
var $location contents = [];
var $place entrances = [];
var $place exits = [];
var $place realm = $realm_of_creation;
var $root created_on = 874185080;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_lines];
var $root manager = $introtut_lines;
var $root settings = #[["prev-topic", $introtut_start], ["next-topic", $introtut_help], ["map-position", 0], ["propagate", 0]];


