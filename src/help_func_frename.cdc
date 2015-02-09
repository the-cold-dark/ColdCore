
new object $help_func_frename: $help_funcs_file;

var $has_name name = ['prop, "frename()", "frename()"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["INTEGER frename(ANY from, STRING to)"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function renames the file specified by the argument ", <$format, ["i", [], ["from"], 'do_i]>, ", to the name specified by the argument ", <$format, ["i", [], ["to"], 'do_i]>, ". If ", <$format, ["i", [], ["from"], 'do_i]>, " is not a string or is logically false, the driver renames the file on the current object. Do not rename the file on the current object by specifying the file's name, as the driver will not know the name has changed and this may cause confusion at a later time. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["frename(\"\", \"old.txt\")", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>], #[['this, $help_func_frename]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_frename];
var $root manager = $help_func_frename;


