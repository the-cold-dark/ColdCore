
new object $help_func_del_objname: $help_funcs_obj;

var $has_name name = ['prop, "del_objname()", "del_objname()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " del_objname()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function deletes an objname associated with the current object. When an objname is deleted the object may only be referenced with it's objnum (for more information on objnames and objnums read ", <$format, ["link", [["node", "$help_coldc_objs_ref"]], ["Referencing Objects"], 'do_link]>, "). If the current object does not have an objname, the error ", <$format, ["tt", [], ["~namenf"], 'do_tt]>, " is thrown."], #[['this, $help_func_del_objname]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["Referencing Objects", $help_coldc_objs_ref]];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_del_objname];
var $root manager = $help_func_del_objname;


