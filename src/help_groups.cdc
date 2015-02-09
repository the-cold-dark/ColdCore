
new object $help_groups: $help_general;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Groups", "Groups"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The group system is an all purpose classification system which can be used for a wide array of purposes. Groups can work in one of two ways: either they are simply a list of objects, and can be tested against for permissions sake, or they use a logical expression as their condition. ", <$format, ["subj", [["level", "2"]], ["Object Groups"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Object groups are heirarchial, so for an example consider the following group heirarchy:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["$group [*-mvc]\n  $staff_group [*-mvc]\n    $building_group [*fmvc]"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If a user is added to the staff group, and something tests against the building group, the staff members are included so it will evaluate true--even though they are not in the building group. ", <$format, ["subj", [["level", "2"]], ["Groups and Security"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Groups can be specified as a writer on an object, and when testing against writer permissions for that object, it will also include anybody in the group, or evaluate against the condition of the group. ", <$format, ["subj", [["level", "2"]], ["Programmer API"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "To use a group in ColdC code, simply call the method ", <$format, ["method", [["$group.includes", 1]], [".includes"], 'do_method]>, "() on the group, with a single argument of the object which is in question. ", <$format, ["subj", [["level", "2"]], ["Available Groups"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "To see a list of all available groups, use the command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@descend $group +all +only=core"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "All groups have a setting of '", <$format, ["tt", [], ["group"], 'do_tt]>, "', which is a list of objects--except for $conditional_group and its descendants, where it is a logical expression."], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $root created_on = 909403959;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_groups];
var $root manager = $help_groups;


