
new object $help_formatting_objects: $help_node_formatting;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Objects", "Objects"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The format used in an object node will depend upon the complexity and type of object. Look at other existing object nodes for general formatting not outlined below. Don't forget to set the objects's help-node setting, ala:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], ["@set obj:help-node=$help_obj_foof"], 'do_dfn]>, " ", <$format, ["subj", [["level", "2"]], ["Method Listings"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "When listing methods, always use a definition list (dl) with an indent of eight characters (ind=8). Specify the method reference in the definition title ({dt}), using the {method} tag. Use {var} around any arguments. The method explanation goes in the definition description ({dd}). Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["nobound", 1]], [<$format, ["quote", [], ["{dl ind=8:\n  {dt: .{method list.length:length}({var:list})}           \n  {dd: Length of the {var:list}.}   \n  ...}"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["subj", [["level", "2"]], ["Method Groups"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "If possible, group methods by behaviour or subsystem, to reduce the overall method list size."], #[]]>;
var $help_node links = #[];
var $root created_on = 870561303;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_formatting_objects];
var $root manager = $help_formatting_objects;


