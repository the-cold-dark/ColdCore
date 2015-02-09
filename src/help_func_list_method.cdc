
new object $help_func_list_method: $help_funcs_meth;

var $has_name name = ['prop, "list_method()", "list_method()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " list_method(", <$format, ["i", [], ["SYMBOL name"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER indent"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER flags"], 'do_i]>, "]])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to decompile a method. It accepts a symbol, assuming it to be the name of a method. If the method is defined on the current object it is decompiled and returned as a list of strings. If the method is not found, the error ", <$format, ["tt", [], ["~methodnf"], 'do_tt]>, " is thrown. ", <$format, ["np", [], [], 'do_np]>, "The second argument ", <$format, ["i", [], ["indent"], 'do_i]>, " can be given to specify an alternate indentation to use (default is four spaces). The third argument can be specified to change the default formatting behaviour. The argument is an integer which can have three different values:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], ["1"], 'do_dt]>, <$format, ["dd", [], ["Full Parenthesis"], 'do_dd]>, <$format, ["dt", [], ["2"], 'do_dt]>, <$format, ["dd", [], ["Full Braces"], 'do_dd]>, <$format, ["dt", [], ["3"], 'do_dt]>, <$format, ["dd", [], ["Full Parenthesis and Braces"], 'do_dd]>], 'do_dl]>], #[['this, $help_func_list_method]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_list_method];
var $root manager = $help_func_list_method;


