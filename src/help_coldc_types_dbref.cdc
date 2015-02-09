
new object $help_coldc_types_dbref: $help_coldc_types;

var $has_name name = ['prop, "Object Number|objnum|Object Name|objname|dbref", "Object Number|objnum|Object Name|objname|dbref"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, <$format, ["i", [], ["Object numbers"], 'do_i]>, " and ", <$format, ["i", [], ["object names"], 'do_i]>, " are explained in detail in the section ", <$format, ["link", [["node", "$help_coldc_objs_ref"]], ["Referencing Objects"], 'do_link]>, ". Object numbers and names are always logically true."], #[['this, $help_coldc_types_dbref]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Referencing Objects", $help_coldc_objs_ref]];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_dbref];
var $root manager = $help_coldc_types_dbref;


