
new object $help_func_fopen: $help_funcs_file;

var $has_name name = ['prop, "fopen()", "fopen()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " fopen(", <$format, ["i", [], ["STRING filename"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING mode"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to open a file on the current object. It is called with one or two arguments. The first argument is the name of the file to open. If the driver was compiled with the ", <$format, ["tt", [], ["RESTRICTIVE_FILES"], 'do_tt]>, " option, the filename will have restrictions (see the section on ", <$format, ["link", [["node", "$help_coldc_files"]], ["Files"], 'do_link]>, " for more information). If ", <$format, ["tt", [], ["RESTRICTIVE_FILES"], 'do_tt]>, " was compiled, all files will have the ", <$format, ["i", [], ["root"], 'do_i]>, " directory prepended to them (this directory is defined by a command line argument to ", <$format, ["a", [["href", "http://www.cold.org/Software/Genesis/"]], [<$format, ["i", [], ["Genesis"], 'do_i]>], 'do_a]>, "). If it was not compiled, but the file does not begin with a slash (\"/\"), the ", <$format, ["i", [], ["root"], 'do_i]>, " directory will still be prepended. ", <$format, ["np", [], [], 'do_np]>, "The second argument is the mode for the file. If the mode begins with \"<\" or nothing, the file is opened for reading. If the mode begins with \">\", the file is truncated to zero length or created for writing. If the mode begins with \">>\", the file is opend for appending. If the second argument is not specified, the mode of file defaults to \"<\". ", <$format, ["np", [], [], 'do_np]>, "A \"+\" may be placed before \">\" or \"<\" to specify both read and write access to the file. Ending a mode with a \"-\" sets it as a binary file, meaning that input and output to the file is through buffers, rather than ColdC strings. ", <$format, ["np", [], [], 'do_np]>, "If successful, the return value of fopen() is stat information in the format returned by ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_fstat"]], ["fstat()"], 'do_link]>], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["stat = fopen(\"log\", \">>\")"], 'do_dfn]>, " ", <$format, ["dfn", [], ["stat = fopen(\"/usr/home/test.info\", \"+>-\")"], 'do_dfn]>], #[['this, $help_func_fopen]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Files", $help_coldc_files], ["fstat()", $help_func_fstat]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fopen];
var $root manager = $help_func_fopen;


