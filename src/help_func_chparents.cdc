
new object $help_func_chparents: $help_funcs_obj;

var $has_name name = ['prop, "chparents()", "chparents()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " chparents(", <$format, ["i", [], ["LIST parents"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function changes the parents of the current object to the list of objnums in ", <$format, ["i", [], ["parents"], 'do_i]>, ". If any of the objnums in ", <$format, ["i", [], ["parents"], 'do_i]>, " do not refer to an existing object, then the error ", <$format, ["tt", [], ["~objnf"], 'do_tt]>, " is thrown. If any of the parents have the current object as an ancestor, or are the current object, then the error ", <$format, ["tt", [], ["~parent"], 'do_tt]>, " is thrown. If ", <$format, ["i", [], ["parents"], 'do_i]>, " is an empty list, then ", <$format, ["tt", [], ["~perm"], 'do_tt]>, " is thrown. Otherwise a ", <$format, ["tt", [], ["1"], 'do_tt]>, " is returned."], #[['this, $help_func_chparents]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_chparents];
var $root manager = $help_func_chparents;


