
new object $help_func_size: $help_funcs_data;

var $has_name name = ['prop, "size()", "size()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " size([", <$format, ["i", [], ["ANY data"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used for sizing data. If no arguments are specified, it will return the size of the current object, including all of the methods and object variable instances defined on it. Otherwise it returns the size of the first argument. Note: specifying an objnum as the argument will return the size of the objnum, not the size of the object it represents!", <$format, ["p", [], [], 'do_p]>, "The number returned represents the size, in bytes, ", <$format, ["i", [], ["on disk"], 'do_i]>, ". Because data is packed when written to the disk database, what is returned will not be comparable to runtime memory footprints.", <$format, ["p", [], [], 'do_p]>, "Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["size(#1234)", <$format, ["br", [], [], 'do_br]>, "=> 4"], 'do_dfn]>, " ", <$format, ["dfn", [], ["size([1, 2, 3, 4])", <$format, ["br", [], [], 'do_br]>, "=> 15"], 'do_dfn]>, " ", <$format, ["dfn", [], ["size(#[['key1, 1], ['key2, \"test\"]])", <$format, ["br", [], [], 'do_br]>, "=> 45"], 'do_dfn]>, " ", <$format, ["dfn", [], ["size(<$root, #[['name, \"foo\"]]>);", <$format, ["br", [], [], 'do_br]>, "=> 37"], 'do_dfn]>, " ", <$format, ["dfn", [], ["size()", <$format, ["br", [], [], 'do_br]>, "=> 5822"], 'do_dfn]>], #[['this, $help_func_size]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384458;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_size];
var $root manager = $help_func_size;


