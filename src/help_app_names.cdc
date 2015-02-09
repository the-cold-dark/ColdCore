
new object $help_app_names: $help_appearance;

var $has_name name = ['prop, "Names", "Names"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "An object has three different types of names, its Object Name, VR Name and Name Templates. The Object Name is unique to each object. No other object will ever have the same Object Name as another object in the database. The Object Name is formatted as a dollar sign followed by any number of alphanumeric characters (", <$format, ["tt", [], ["a-z 0-9"], 'do_tt]>, ") or the underscore (", <$format, ["tt", [], ["'_'"], 'do_tt]>, "). Additional help on ", <$format, ["link", [["node", "$help_coldc_objs_ref"]], ["Object Names"], 'do_link]>, " can be found in the Programming Help. An example of an object name is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["$root"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The VR Name is the name the object has in its ", <$format, ["link", [["node", "$help_environment"]], ["Environment"], 'do_link]>, ". The VR Name is not unique to the object, and other objects can also have the same name. ", <$format, ["np", [], [], 'do_np]>, "VR Names are also broken into three types: Proper, Unique and Normal. The type of name will decide what articles are put with it, when formatting (You do not normally include the article in a name). Proper names have no article. Unique names use the article ", <$format, ["tt", [], ["the"], 'do_tt]>, ", and Normal names use the article ", <$format, ["tt", [], ["a"], 'do_tt]>, " or ", <$format, ["tt", [], ["an"], 'do_tt]>, ". Normally, when you set a name you can just use the article for the type of name you want. If you desire a different behaviour you can type +ignore in the name and it will override any automatic article settings. ", <$format, ["subj", [["level", "2"]], ["Name Templates"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Name Templates are additional helpful hints for the name matching system. Name Templates match differently than VR Names, so care should be given in knowing how each type of name matches before specifying a Name Template, as often times the Name Template is unecessary. ", <$format, ["np", [], [], 'do_np]>, "When the system tries to match a name to an object, it will match the beginning of any word in a name. For instance, if an object has the name ", <$format, ["tt", [], ["\"Mad Hatter\""], 'do_tt]>, " both ", <$format, ["tt", [], ["\"mad\""], 'do_tt]>, " and ", <$format, ["tt", [], ["\"hatter\""], 'do_tt]>, " would match. Furthermore, ", <$format, ["tt", [], ["\"hat\""], 'do_tt]>, " would also match, as it is the beginning of the second word. ", <$format, ["np", [], [], 'do_np]>, "To supplement matching you can add Name Templates. Name Templates use the Template Matching system. Templates are not matched like names. The most common use of templates with names would be partial matching a word. For instance, the exit ", <$format, ["tt", [], ["\"Glass Door\""], 'do_tt]>, " may have the Template ", <$format, ["tt", [], ["\"e?ast\""], 'do_tt]>, ". The Question Mark ('?') is used to specify that any character past that point is optional. For more information on Template Matching see the section ", <$format, ["link", [["node", "$help_commands_matching"]], ["Matching Conventions"], 'do_link]>, ". ", <$format, ["np", [], [], 'do_np]>, "Commands used with names are: ", <$format, ["link", [["node", "$help_cmd_rename"]], ["@rename"], 'do_link]>], #[['links, #[["Object Names", "$help_coldc_objs_ref"], ["Environment", "$help_environment"], ["Matching Conventions", "$help_commands_matching"], ["@rename", "$help_cmd_rename"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Object Names", $help_coldc_objs_ref], ["Environment", $help_environment], ["Matching Conventions", $help_commands_matching], ["@rename", $help_cmd_rename]];
var $help_node nolist = 0;
var $root created_on = 856649225;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_app_names];
var $root manager = $help_app_names;


