
new object $help_list_sets: $help_obj_list;

var $has_name name = ['prop, "Sets", "Sets"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [["ind", "8"]], [<$format, ["dt", [], [".", <$format, ["method", [["list.setadd", 1]], ["setadd"], 'do_method]>, "(", <$format, ["var", [], ["list"], 'do_var]>, ", ", <$format, ["var", [], ["elt"], 'do_var]>, ") ", <$format, ["i", [], ["native"], 'do_i]>], 'do_dt]>, <$format, ["dd", [], ["Adds an element to the list unless it's already contained in the list."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.setremove", 1]], ["setremove"], 'do_method]>, "(", <$format, ["var", [], ["list"], 'do_var]>, ", ", <$format, ["var", [], ["elt"], 'do_var]>, ") ", <$format, ["i", [], ["native"], 'do_i]>], 'do_dt]>, <$format, ["dd", [], ["Removes the first occurrence of the element from the list."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.union", 1]], ["union"], 'do_method]>, "(", <$format, ["var", [], ["list1"], 'do_var]>, ",", <$format, ["var", [], ["list2"], 'do_var]>, ") ", <$format, ["i", [], ["native"], 'do_i]>], 'do_dt]>, <$format, ["dd", [], ["Union of the two lists. Use ", <$format, ["method", [["list.fold", 1]], ["big_list.fold"], 'do_method]>, "($list,'union) to get a union of the family of lists."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.set_difference", 1]], ["set_difference"], 'do_method]>, "(", <$format, ["var", [], ["list"], 'do_var]>, ", ", <$format, ["var", [], ["l1"], 'do_var]>, ", ...)"], 'do_dt]>, <$format, ["dd", [], ["Removes the elements from ", <$format, ["var", [], ["l1"], 'do_var]>, ", ", <$format, ["var", [], ["l2"], 'do_var]>, " etc from the list."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.intersection", 1]], ["intersection"], 'do_method]>, "(", <$format, ["var", [], ["l1"], 'do_var]>, ", ", <$format, ["var", [], ["l2"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Returns the elements that occur on both lists. Use ", <$format, ["method", [["list.fold", 1]], ["$list.fold()"], 'do_method]>, " for more lists."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.set_contains", 1]], ["set_contains"], 'do_method]>, "(", <$format, ["var", [], ["l1"], 'do_var]>, ", ", <$format, ["var", [], ["l2"], 'do_var]>, ", ...)"], 'do_dt]>, <$format, ["dd", [], ["Returns 1 if the first argument contains all the others."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.set_equal", 1]], ["set_equal"], 'do_method]>, "(", <$format, ["var", [], ["l1"], 'do_var]>, ", ", <$format, ["var", [], ["l2"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Returns 1 if the lists are equal as sets (that is, if ", <$format, ["var", [], ["l1"], 'do_var]>, " is contained in ", <$format, ["var", [], ["l2"], 'do_var]>, " and if ", <$format, ["var", [], ["l2"], 'do_var]>, " is contained in l1)."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 850833059;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_list_sets];
var $root manager = $help_list_sets;


