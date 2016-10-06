
new object $help_help: $help_coldcore;

var $has_name name = ['prop, "Help|@help", "Help|@help"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "This is a hypertext help system. Hypertext is a dynamic form of text, where words within a document may have special meaning, and point to other documents or portions of the document. These words are called ", <$format, ["i", [], ["hyperlinks"], 'do_i]>, ". In a windowed browser hyperlinks may be displayed differently from the regular text by colorization. Over a terminal hyperlinks are specified by enclosing them in square brackets (", <$format, ["tt", [], ["[]"], 'do_tt]>, "), such as: ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_help"]], ["Help"], 'do_link]>], 'do_tt]>, " ", <$format, ["np", [], [], 'do_np]>, "You can use the command ", <$format, ["tt", [], ["@help"], 'do_tt]>, " to navigate the ", <$generator, ["servname", [], [], 'gen_servname]>, "'s help system, when on an interactive connection. To activate a hyperlink from a page you are reading, type ", <$format, ["tt", [], ["@help"], 'do_tt]>, " and the name of the hyperlink. For instance, if the hyperlink was ", <$format, ["link", [["node", "$help_general"]], ["General"], 'do_link]>, ", typing ", <$format, ["tt", [], ["@help General"], 'do_tt]>, " would activate the link. For convenience, you can also use the command shortcut ", <$format, ["tt", [], ["?"], 'do_tt]>, " instead of ", <$format, ["tt", [], ["@help"], 'do_tt]>, ", such as: ", <$format, ["tt", [], ["?General"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "Additional Recommended Reading:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help_hierarchy"]], ["Hierarchy"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Help hierarchy (organization)"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help_options"]], ["Options"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Options and shortcuts to @help"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help_searching"]], ["Searching"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Hints on searching Help"], 'do_dd]>], 'do_dl]>], #[['links, #[["Help", "$help_help"], ["General", "$help_general"], ["Hierarchy", "$help_help_hierarchy"], ["Options", "$help_help_options"], ["Searching", "$help_help_searching"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Help", $help_help], ["General", $help_general], ["Hierarchy", $help_help_hierarchy], ["Options", $help_help_options], ["Searching", $help_help_searching]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_help];
var $root manager = $help_help;


