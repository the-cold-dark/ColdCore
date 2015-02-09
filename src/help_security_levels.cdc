
new object $help_security_levels: $help_security;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Object-Levels", "Object-Levels"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Object-Level security is what managest most of the security in the database. It is a set of four levels, where each level encompasses all of the priviledges of the previous level. All access for object-levels is on a per-object basis--allowing one or more objects a certain level of privilege to another object depending upon the level it is defined in. ", <$format, ["np", [], [], 'do_np]>, "Any object or user can manage objects, be a writer on objects and a trustee on other objects. User classes (i.e. builder, programmer, admin) are not associated with any security level, they exist simply to group commands and more powerful interfaces. The levels are: ", <$format, ["subj", [["level", "2"]], ["System Level"], 'do_subj]>, " This level is the top level, encompassing administrators and system-level objects (such as ", <$format, ["tt", [], ["$root"], 'do_tt]>, " and ", <$format, ["tt", [], ["$sys"], 'do_tt]>, "). By default Administrators do not have this level enabled (it can be enabled each session with the command ", <$format, ["link", [["node", "$help_cmd_mojo"]], ["@mojo"], 'do_link]>, "). ", <$format, ["subj", [["level", "2"]], ["Manager Level"], 'do_subj]>, " Every object has a manager. The manager has full permissions on the specific object. Quota usage is also based off the object Manager. ", <$format, ["subj", [["level", "2"]], ["Writer Level"], 'do_subj]>, " An object can have any number of writers. Writer Level permissions give full access to an object, with a few exceptions:", <$format, ["ul", [], [<$format, ["li", [], ["Writers cannot change any access permissions on an object (this includes adding other writers or changing the Manager)."], 'do_li]>, <$format, ["li", [], ["Writers cannot change the object's parents."], 'do_li]>, <$format, ["li", [], ["Writers cannot destroy the object."], 'do_li]>], 'do_ul]>, <$format, ["subj", [["level", "2"]], ["Trustee Level"], 'do_subj]>, " An object trustee is simply another object that is trusted more than random objects but less than a writer. The amount of access given depends upon the subsystem. For instance, adding a user as a trustee to a location they are not a Manager or Writer of will give them the ability to extend other rooms from it."], #[['links, #[["@mojo", "$help_cmd_mojo"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@mojo", $help_cmd_mojo]];
var $root created_on = 998881662;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_security_levels];
var $root manager = $help_security_levels;


