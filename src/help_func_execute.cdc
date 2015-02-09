
new object $help_func_execute: $help_funcs_file;

var $has_name name = ['prop, "execute()", "execute()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " execute(", <$format, ["i", [], ["STRING program"], 'do_i]>, ", ", <$format, ["i", [], ["LIST args"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER nb"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function executes the program named by ", <$format, ["i", [], ["program"], 'do_i]>, " with the arguments given in the list ", <$format, ["i", [], ["arguments"], 'do_i]>, ". Each argument must be a string. By default, calling this function will block execution of genesis until the called program returns. If the optional third argument is specified as a true value, the program is forked and executed in a non-blocking manner. The return value is the return value of the program, or, in the case of a non-blocking execution it is zero. ", <$format, ["np", [], [], 'do_np]>, "This function looks for the program in the executable directory specified upon startup by the driver. This usually defaults to ", <$format, ["tt", [], ["dbbin"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "In the future input and output for the program may be handled as if it were a file."], #[['this, $help_func_execute]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_execute];
var $root manager = $help_func_execute;


