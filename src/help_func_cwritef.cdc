
new object $help_func_cwritef: $help_funcs_net;

var $has_name name = ['prop, "cwritef()", "cwritef()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " cwritef(", <$format, ["i", [], ["STRING file_path"], 'do_i]>, "[, ", <$format, ["i", [], ["INTEGER block"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function opens the file specified by ", <$format, ["i", [], ["file_path"], 'do_i]>, " and writes it's contents directly to the connection. The block size it reads and writes (defaulting to the driver defined variable in defs.h DEF_BLOCKSIZE, usually this is 512) can be changed by specifying an optional second argument. If the second is a negative one (-1) it will attempt to read the entire file at once, and write it to the connection (the old coldmud behavior). The size of the file (in bytes) is returned. If a problem arises the error ", <$format, ["tt", [], ["~file"], 'do_tt]>, " is thrown."], #[['this, $help_func_cwritef]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_cwritef];
var $root manager = $help_func_cwritef;


