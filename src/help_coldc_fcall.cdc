
new object $help_coldc_fcall: $help_coldc_expr;

var $has_name name = ['prop, "Function Call Expression", "Function Call Expression"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Functions are driver-defined procedures which perform a certain action which ColdC is incapable of (such as opening a network connection), or which the driver can handle more efficiently. A function is called using the ", <$format, ["i", [], ["function call expression"], 'do_i]>, ", which has the following syntax:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["function"], 'do_i]>, "(", <$format, ["i", [], ["arg1"], 'do_i]>, ", ", <$format, ["i", [], ["arg2"], 'do_i]>, ", ", <$format, ["i", [], ["..."], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "In this example ", <$format, ["i", [], ["function"], 'do_i]>, " is an identifier naming the function, and ", <$format, ["i", [], ["arg1"], 'do_i]>, ", ", <$format, ["i", [], ["arg2"], 'do_i]>, " are expressions. There are no limits to the amount of arguments a function can accept. However, even if there are no arguments the parentheses must be present. Arguments are evaluated from left to right. ", <$format, ["np", [], [], 'do_np]>, "As an example, the ", <$format, ["tt", [], ["pad()"], 'do_tt]>, " function pads a string argument with spaces to a certain length. When evaluated with the string \"foo\" and a length of six characters:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["pad(\"foo\", 6)", <$format, ["br", [], [], 'do_br]>, "=> \"foo \""], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "There are driver functions available for a variety of tasks. A comprehensive explanation of the available functions is available in the section ", <$format, ["link", [["node", "$help_coldc_func"]], ["Function Reference"], 'do_link]>, "."], #[['this, $help_coldc_fcall]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Function Reference", $help_coldc_func]];
var $help_node nolist = 0;
var $root created_on = 854057965;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_fcall];
var $root manager = $help_coldc_fcall;


