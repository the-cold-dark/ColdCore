
new object $help_coldc_methods_frob: $help_coldc_methods_access;

var $has_name name = ['prop, "Frobbed", "Frobbed"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Frobbed Method calls behave slightly different than any other access restriction. First, a frobbed method may only be called from a frob. That is, it must be called where the frob is the receiver, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["(<$object, #[]>).method()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If it is called in the normal way, it will be as if the frobbed method does not exist. For example, assume ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " is a parent of ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, ". ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " defines the method ", <$format, ["tt", [], [".name()"], 'do_tt]>, " as a standard method, but ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, " overrides it and defines it as a frobbed method. Calling ", <$format, ["tt", [], ["$obj_b.name()"], 'do_tt]>, " will actually skip the frobbed method and execute the method defined on ", <$format, ["tt", [], ["$obj_a"], 'do_tt]>, " where calling ", <$format, ["tt", [], ["(<$obj_b, #[]>).name()"], 'do_tt]>, " will execute the frobbed method defined on ", <$format, ["tt", [], ["$obj_b"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "When a Frobbed Method passes back to an overridden method it will look first for another Frobbed method, and then for a standard method. ", <$format, ["np", [], [], 'do_np]>, "If a method is defined as non-overridable, it may still be overridden by a Frobbed Method. This allows for Frob Class objects to emulate real object systems in the database, with frobs."], #[['this, $help_coldc_methods_frob]]]>;
var $help_node group = 1;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854925896;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_methods_frob];
var $root manager = $help_coldc_methods_frob;


