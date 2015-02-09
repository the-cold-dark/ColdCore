
new object $help_cml_generators: $help_cml;

var $has_name name = ['prop, "Generators", "Generators"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "16%,84%"]], [<$format, ["tr", [], [<$format, ["td", [], ["columnize"], 'do_td]>, <$format, ["td", [], ["Generates a list of columnized strings taken from the argument list. Option ", <$format, ["tt", [], ["cols"], 'do_tt]>, " defines column information."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["def"], 'do_td]>, <$format, ["td", [], ["Requires option ", <$format, ["tt", [], ["var"], 'do_tt]>, " which is the name of a variable. Creates a new variable generator with that name, which has the value of the first argument. Will ", <$format, ["i", [], ["not"], 'do_i]>, " evaluate arguments, instead stores the unparsed first argument. Similar to ", <$format, ["tt", [], ["set"], 'do_tt]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["english"], 'do_td]>, <$format, ["td", [], ["Generates an english-formatted list from the arguments. Options can include ", <$format, ["tt", [], ["sep"], 'do_tt]>, " (element seperator, defaulting to \",\"), ", <$format, ["tt", [], ["empty"], 'do_tt]>, " (what to print if the argument list is empty, defaulting to \"nothing\"), ", <$format, ["tt", [], ["and"], 'do_tt]>, " (what to print as a seperator before the last element, defaulting to \"and\")"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["foreach"], 'do_td]>, <$format, ["td", [], ["Requires option ", <$format, ["tt", [], ["list"], 'do_tt]>, ". Will iterate over body for each element in list. Additional option ", <$format, ["tt", [], ["var"], 'do_tt]>, " may be defined for iteration variable, defaults to ", <$format, ["tt", [], ["iterator"], 'do_tt]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["join"], 'do_td]>, <$format, ["td", [], ["Joins arguments. Options can include ", <$format, ["tt", [], ["seperator"], 'do_tt]>, " which is either ", <$format, ["tt", [], ["none"], 'do_tt]>, ", ", <$format, ["tt", [], ["english"], 'do_tt]>, " or a string literal. If ", <$format, ["tt", [], ["none"], 'do_tt]>, " the list is forwarded to the caller, rather than joined to a string"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["name"], 'do_td]>, <$format, ["td", [], ["Generates the names of the objects in the arguments list. Options can include ", <$format, ["tt", [], ["seperator"], 'do_tt]>, " which is either ", <$format, ["tt", [], ["none"], 'do_tt]>, ", ", <$format, ["tt", [], ["english"], 'do_tt]>, " or a string literal. If ", <$format, ["tt", [], ["none"], 'do_tt]>, " is given a list is generated, otherwise a string is generated"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["pro"], 'do_td]>, <$format, ["td", [], ["Generates a pronoun. Required option is ", <$format, ["tt", [], ["obj"], 'do_tt]>, " which defines the object for the pronoun generation. First argument is taken as the type of pronoun to use, as defined on $gender"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["random"], 'do_td]>, <$format, ["td", [], ["Returns a random number ranging from ", <$format, ["tt", [], ["low"], 'do_tt]>, " to ", <$format, ["tt", [], ["high"], 'do_tt]>, " which are given as options. Low can be omitted, one is used then instead."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["servname"], 'do_td]>, <$format, ["td", [], ["The name of the server, as is set on ", <$format, ["tt", [], ["@set $motd:server-name"], 'do_tt]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["set"], 'do_td]>, <$format, ["td", [], ["Requires option ", <$format, ["tt", [], ["var"], 'do_tt]>, " which is the name of a variable. Creates a new variable generator with that name, which has the value of the first argument. Will evaluate arguments and store results. Similar to ", <$format, ["tt", [], ["def"], 'do_tt]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["switch"], 'do_td]>, <$format, ["td", [], ["Requires option ", <$format, ["tt", [], ["value"], 'do_tt]>, " which is evaluated. The resulting value is then used to select a result. Currently switch uses every other item in the argument list as a case/value pair (use the ", <$format, ["tt", [], ["join"], 'do_tt]>, " generator for arguments with spaces). If there is a remaining odd element is is considered the default result"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["time"], 'do_td]>, <$format, ["td", [], ["Arguments are sent to the native method $time.format()"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], ["vars"], 'do_td]>, <$format, ["td", [], ["Returns the names of variables available. Option ", <$format, ["tt", [], ["separator"], 'do_tt]>, " is the same as in ", <$format, ["tt", [], ["name"], 'do_tt]>, " generator"], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, " ", <$format, ["subj", [["level", "4"]], ["Other tags"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Each cml processor can also create extra generators. Also, caller to the cml can create extra variables that are available for generators."], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 809736951;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_cml_generators];
var $root manager = $help_cml_generators;


