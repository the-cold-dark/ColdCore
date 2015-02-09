
new object $help_func_fstat: $help_funcs_file;

var $has_name name = ['prop, "fstat()", "fstat()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " fstat([", <$format, ["i", [], ["STRING path"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function returns information on a file. If the file is not specified as ", <$format, ["i", [], ["path"], 'do_i]>, ", then it returns information on the open file on the current object. The information is returned as an ordered list:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["STRING octal file mode (see ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_fchmod"]], ["fchmod()"], 'do_link]>], 'do_tt]>, ")"], 'do_li]>, <$format, ["li", [], ["INTEGER file size (in bytes)"], 'do_li]>, <$format, ["li", [], ["INTEGER time when the file was last accessed"], 'do_li]>, <$format, ["li", [], ["INTEGER time when the file data was last modified"], 'do_li]>, <$format, ["li", [], ["INTEGER time when the file status was last changed"], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "For more information refer to the unix manual page on ", <$format, ["tt", [], ["stat"], 'do_tt]>, ". The octal file mode will likely include additional bit fields from what is commonly seen. These represent file attributes, such as directories, FIFO, etc. The last four bits will refer to the permissions. For instance:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["fstat(\"html\")", <$format, ["br", [], [], 'do_br]>, "=> [\"40775\", 512, 855442283, 851293545, 855435595]"], 'do_dfn]>], #[['links, #[["fchmod()", "$help_func_fchmod"]]]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["fchmod()", $help_func_fchmod]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fstat];
var $root manager = $help_func_fstat;


