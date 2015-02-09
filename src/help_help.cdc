
new object $help_help: $help_coldcore;

var $has_name name = ['prop, "Help", "Help"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "This is a hypertextual help system. Hypertext is simply a dynamic form of text, where words within a document may have special meaning, and point to other documents or portions of the document. These words are called ", <$format, ["i", [], ["hyperlinks"], 'do_i]>, ". In a windowed browser hyperlinks may be displayed differently from the regular text by colorization. Over a terminal we specify hyperlinks by enclosing them in square brackets (", <$format, ["tt", [], ["[]"], 'do_tt]>, "), such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["link", [["node", "$help_help"]], ["Help"], 'do_link]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "You can use the command ", <$format, ["tt", [], ["@help"], 'do_tt]>, " to navigate the ", <$generator, ["servname", [], [], 'gen_servname]>, "'s help system, when on an interactive connection. If this command is used with a word or group of words, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@help VR Commands"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "It will first attempt to find the word(s) as one of the hyperlinks from your current page. If it fails at this, it will attempt to lookup the word as a topic in the help indices. If this also fails, it will return a message explaining that it could not find help on that topic. ", <$format, ["np", [], [], 'do_np]>, "Therefore, to activate a hyperlink from a page you are reading, simply type ", <$format, ["tt", [], ["@help"], 'do_tt]>, " and the name of the hyperlink. For instance, if the hyperlink was ", <$format, ["link", [["node", "$help_help"]], ["Help"], 'do_link]>, ", typing ", <$format, ["tt", [], ["@help help"], 'do_tt]>, " would activate the link. For convenience, you can use the command shortcut ", <$format, ["tt", [], ["?"], 'do_tt]>, " instead of ", <$format, ["tt", [], ["@help"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "Other Help topics:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help_options"]], ["Options"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Options and shortcuts to @help"], 'do_dd]>, <$format, ["dt", [], [<$format, ["b", [], [<$format, ["link", [["node", "$help_help_navigating"]], ["Navigating"], 'do_link]>], 'do_b]>], 'do_dt]>, <$format, ["dd", [], ["Hints on navigating Help"], 'do_dd]>], 'do_dl]>], #[['this, $help_help]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Help", $help_help], ["Options", $help_help_options], ["Navigating", $help_help_navigating]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_help];
var $root manager = $help_help;


