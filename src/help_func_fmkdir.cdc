
new object $help_func_fmkdir: $help_funcs_file;

var $has_name name = ['prop, "fmkdir()", "fmkdir()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " fmkdir(", <$format, ["i", [], ["STRING path"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function creates the directory specified by ", <$format, ["i", [], ["path"], 'do_i]>, ". If a file or directory already exists by that designation, the error ", <$format, ["tt", [], ["~file"], 'do_tt]>, " is thrown. Otherwise the directory is created with read, write and execute permission for the owner, and no permissions for group or others (these permissions can be changed with the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_fchmod"]], ["fchmod()"], 'do_link]>], 'do_tt]>, "."], #[['this, $help_func_fmkdir]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["fchmod()", $help_func_fchmod]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fmkdir];
var $root manager = $help_func_fmkdir;


