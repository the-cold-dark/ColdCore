
new object $help_func_fwrite: $help_funcs_file;

var $has_name name = ['prop, "fwrite()", "fwrite()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " fwrite(", <$format, ["i", [], ["STRING|BUFFER info"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Write to an existing file bound to this object. The argument is either a buffer (if it is a binary file), or a string (if it is a text file). The return value is an integer representing an offset value of characters which were ", <$format, ["i", [], ["not"], 'do_i]>, " written out (due to an error). In normal operating conditions the return value will be zero. ", <$format, ["np", [], [], 'do_np]>, "Using fwrite() with strings will always terminate the string with a newline character (ASCII 10)."], #[['this, $help_func_fwrite]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fwrite];
var $root manager = $help_func_fwrite;


