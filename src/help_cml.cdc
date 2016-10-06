
new object $help_cml: $help_building;

var $has_name name = ['prop, "CML|Cold Markup Language", "CML|Cold Markup Language"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "CML is used to markup text for dynamic generation and formatting. CML text is compiled to an internal abstraction called Ctext which can be easily decompiled to plain text, HTML or any other format that may be desired. Ctext is also dynamically interpreted for each interface receiving the text. This gives extreme power in the final result, and is much faster than older MUD systems which use %x replacements in strings to achieve the same result. ", <$format, ["np", [], [], 'do_np]>, "The CML syntax is made of tags embedded within the text. Tags can be formatted one of two ways depending upon if they are for dynamic text generation (Generator) or as a formatting or other directive (Formatter): ", <$format, ["dfn", [["nobound", 1]], [<$format, ["table", [["cols", "30%,50%"]], [<$format, ["tr", [], [<$format, ["td", [], ["Generator Format:"], 'do_td]>, <$format, ["td", [], ["[<name> <options>:<arguments>]"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["Directive Format:"], 'do_td]>, <$format, ["td", [], ["{<name> <options>:<arguments>}"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Specific tag names may vary depending upon the system. For more information on the specific tags for this system see help on ", <$format, ["link", [["node", "$help_cml_formatters"]], ["Formatters"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_cml_generators"]], ["Generators"], 'do_link]>, ".", <$format, ["p", [], [], 'do_p]>, "The exact behaviour of a tag may be controlled using options (sometimes called flags). Options can be in any order, and are specified in one of two ways: ", <$format, ["dfn", [["nobound", 1]], [<$format, ["table", [["cols", "20%,50%"]], [<$format, ["tr", [], [<$format, ["td", [], ["key=value"], 'do_td]>, <$format, ["td", [], ["sets the option named key to value"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["key"], 'do_td]>, <$format, ["td", [], ["sets the option named key to true (if unspecified it will be false)."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "NOTE: If you need it include more than one word as the value, you have to backslash-escape the spaces, you cannot include the value in quotes. ", <$format, ["np", [], [], 'do_np]>, "Arguments (anything following the colon) Are optional, and depend upon the tag. How Arguments Are handled depends on whether the tag is a Generator or a Formatter. A Generator will treat it's Arguments as a space separated list. A formatter will treat it's Argument as a single string, stArting at the first non-space chAracter following the colon. Arguments may contain other tags. ", <$format, ["np", [], [], 'do_np]>, "All tags with the exception of ", <$format, ["tt", [], ["quote"], 'do_tt]>, " follow this syntax. ", <$format, ["tt", [], ["quote"], 'do_tt]>, " can be used to include literal unparsed text in a document. It is similar to HTML's <pre> in that it includes any literal formatting of white space. However, it does ", <$format, ["i", [], ["NOT"], 'do_i]>, " parse any formatters or generators within it's body. ", <$format, ["tt", [], ["quote"], 'do_tt]>, " is formatted as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["{quote <text>}"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Where <text> is anything, including curly braces. Note: there is no colon following ", <$format, ["tt", [], ["quote"], 'do_tt]>, ", and there are no options for ", <$format, ["tt", [], ["quote"], 'do_tt]>, ". Further information on CML and Ctext can be found at:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], [<$format, ["link", [["node", "$help_cml_formatters"]], ["Formatters"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["About CML Formatters"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cml_generators"]], ["Generators"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["About CML Generators"], 'do_dd]>, <$format, ["dt", [], [<$format, ["link", [["node", "$help_cml_customizing"]], ["Customizing"], 'do_link]>], 'do_dt]>, <$format, ["dd", [], ["Customizing Ctext"], 'do_dd]>], 'do_dl]>], #[['links, #[["Formatters", "$help_cml_formatters"], ["Generators", "$help_cml_generators"], ["Customizing", "$help_cml_customizing"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Formatters", $help_cml_formatters], ["Generators", $help_cml_generators], ["Customizing", $help_cml_customizing]];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_cml];
var $root manager = $help_cml;


