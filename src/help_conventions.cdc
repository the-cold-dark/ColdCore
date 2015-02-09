
new object $help_conventions: $help_general;

var $has_name name = ['prop, "Conventions", "Conventions"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Througout these documents certain conventions are used. If a document is explaining a command to be typed, it will begin with a greater-than sign (", <$format, ["tt", [], [">"], 'do_tt]>, "), such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> command"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If a document shows the syntax for a command a few conventions are used. First, words grouped within greater-than and less-than (", <$format, ["tt", [], ["<>"], 'do_tt]>, ") signs are ", <$format, ["i", [], ["variables"], 'do_i]>, " and should be replaced with what you actually type. Second, words or ", <$format, ["i", [], ["variables"], 'do_i]>, " within square brackets (", <$format, ["tt", [], ["[]"], 'do_tt]>, ") are optional. You may also see an elipse (", <$format, ["tt", [], ["..."], 'do_tt]>, ") inside square brackets. This simply means that it will accept multiple instances of the last word or ", <$format, ["i", [], ["variable"], 'do_i]>, ". The following example shows the first ", <$format, ["i", [], ["variable"], 'do_i]>, " argument is required, and more may be added:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["Syntax: @command <arg1> [<arg2> ...]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If a document is explaining how ColdC code may be evaluated when interpreted, the first line is the ColdC code and the second line begins with a text arrow pointing to the right (", <$format, ["tt", [], ["=>"], 'do_tt]>, ") and is followed by a ColdC data value. This represents what the example would evaluate to and return. For instance, calling the function ", <$format, ["tt", [], ["ctime()"], 'do_tt]>, " could return the value ", <$format, ["tt", [], ["\"Sun Feb 25 17:06:38 1996\""], 'do_tt]>, ". The function call and resulting value would be listed using this convention as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["ctime()\n=> \"Sun Feb 25 17:06:38 1996\""], 'do_quote]>], 'do_dfn]>], #[['this, $help_conventions]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 847225687;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_conventions];
var $root manager = $help_conventions;


