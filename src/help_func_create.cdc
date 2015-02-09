
new object $help_func_create: $help_funcs_obj;

var $has_name name = ['prop, "create()", "create()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["OBJNUM"], 'do_i]>, " create(", <$format, ["i", [], ["LIST parents"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function creates and returns the objnum of an object with the parents in the list ", <$format, ["i", [], ["parents"], 'do_i]>, ", which should be a list of objnums referring to existing objects. If any of the parent objnums do not refer to existing objects, then ", <$format, ["tt", [], ["create()"], 'do_tt]>, " throws the error ", <$format, ["tt", [], ["~objnf"], 'do_tt]>, "."], #[['this, $help_func_create]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_create];
var $root manager = $help_func_create;


