
new object $help_coldc_default_assign: $help_coldc_assign;

var $has_name name = ['prop, "Default", "Default"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The default assignment is used to assign a value to a variable if the current value of the variable is logically false. The default assignment operator is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["?="], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "And the syntax is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["i", [], ["variable"], 'do_i]>, " ?= ", <$format, ["i", [], ["value expression"], 'do_i]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When executed the driver tests the logical value of ", <$format, ["i", [], ["variable"], 'do_i]>, ". If it is false, it assigns the result of ", <$format, ["i", [], ["value expression"], 'do_i]>, ", otherwise it is untouched. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["len ?= 79;"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Will assign ", <$format, ["i", [], ["79"], 'do_i]>, " to ", <$format, ["i", [], ["len"], 'do_i]>, " if it is false (for instance, if it is zero). This operator is equivalent to a combination of the ", <$format, ["link", [["node", "$help_coldc_simple_assign"]], ["Simple Assignment"], 'do_link]>, " and the ", <$format, ["link", [["node", "$help_coldc_cond"]], ["if-else Conditional Expression"], 'do_link]>, ":", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["len = len ? len : 79;"], 'do_dfn]>], #[['this, $help_coldc_default_assign]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Simple Assignment", $help_coldc_simple_assign], ["if-else Conditional Expression", $help_coldc_cond]];
var $help_node nolist = 0;
var $root created_on = 857847069;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_default_assign];
var $root manager = $help_coldc_default_assign;


