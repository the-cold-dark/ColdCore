
new object $help_cmd_age: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "@age", "@age"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@age <objref>"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Displays the date <objref> was created, and how long ago that was from the current time. When getting the @age of players, it will additionally display how much time that player has been connected to the server. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Example:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@age Vampire\nVampire was created on Monday January 13 1997\nHe is 6 months, 19 days, 2 hours and 47 minutes old.\nHe has logged 4 months, 17 days, 22 hours, 7 minutes and 33 seconds online.\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 870925660;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_age];
var $root manager = $help_cmd_age;


