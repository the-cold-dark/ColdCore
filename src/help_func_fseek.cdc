
new object $help_func_fseek: $help_funcs_file;

var $has_name name = ['prop, "fseek()", "fseek()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " fseek(", <$format, ["i", [], ["INTEGER offset"], 'do_i]>, ", ", <$format, ["i", [], ["SYMBOL whence"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function changes the file position to ", <$format, ["i", [], ["offset"], 'do_i]>, ". The variable ", <$format, ["i", [], ["whence"], 'do_i]>, " is either ", <$format, ["tt", [], ["'SEEK_SET"], 'do_tt]>, ", ", <$format, ["tt", [], ["'SEEK_CUR"], 'do_tt]>, ", ", <$format, ["tt", [], ["'SEEK_END"], 'do_tt]>, ". Read the unix manual page for the function ", <$format, ["tt", [], ["fseek"], 'do_tt]>, ", for more information. ", <$format, ["np", [], [], 'do_np]>, "If the file is not both readable and writable, this function cannot be used."], #[['this, $help_func_fseek]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fseek];
var $root manager = $help_func_fseek;


