
new object $help_security: $help_general;

var $has_name name = ['prop, "Security", "Security"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "There are several facets to how security is handled in coldcore, both in code relationships and in the VR. From a coding point of view, ", <$format, ["link", [["node", "$help_security_levels"]], ["Object-Level"], 'do_link]>, " security and ", <$format, ["link", [["node", "$help_security_groups"]], ["Groups"], 'do_link]>, " are used to handle most of the security functionality. Additional mechanisms exist in some places, such as the command stipulation for some command methods which requires that the method is only called from the command parser. Most of the security checks are managed through the ", <$format, ["tt", [], [".perms()"], 'do_tt]>, " method. ", <$format, ["np", [], [], 'do_np]>, "VR Security primarily uses groups or logic locks in the form of a key (as would be used to lock a door or box). ", <$format, ["np", [], [], 'do_np]>, " See Also: ", <$format, ["link", [["node", "$help_security_levels"]], ["Object-Level"], 'do_link]>, " and ", <$format, ["link", [["node", "$help_security_groups"]], ["Groups"], 'do_link]>, " Security."], #[['links, #[["Object-Level", "$help_security_levels"], ["Groups", "$help_security_groups"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["Object-Level", $help_security_levels], ["Groups", $help_security_groups]];
var $help_node nolist = 0;
var $root created_on = 853888954;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_security];
var $root manager = $help_security;


