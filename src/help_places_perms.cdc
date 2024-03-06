
new object $help_places_perms: $help_build_places;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Permissions|Builder Permissions|perms", "Permissions|Builder Permissions|perms"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Building Permissions are those which allow you to build pathways from one location to another. There are a few ways to allow people to build: adding them as a writer or trustee to a room (this only allows them to build from the current room), set the room as a public home (same as adding them as a writer), or add them as a trustee to the realm or one of the realms in the hierarchy of realms above the current room. The latter option is the most preferable for wide-spread building. ", <$format, ["np", [], [], 'do_np]>, "For example. Consider a room with the name of Broom Closet. This room is defined as a member of the $realm_of_the_inn, which is also in the $realm_of_the_city. If somebody were to be added as a trustee to the $realm_of_the_city, they would be able to build a pathway from the Broom Closet (because the city is an ancestral realm of the Broom Closet). They would also be able to write to any other place defined within the realm of the city. For more granularity, somebody could only be added to the $realm_of_the_inn, which would restrict them to building within the Inn. ", <$format, ["np", [], [], 'do_np]>, "To add a trustee type: ''", <$format, ["tt", [], ["@chown REALM +trustee=WHO"], 'do_tt]>, "'', such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@chown $realm_of_the_city +t=Levi"], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $root created_on = 1010724353;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_places_perms];
var $root manager = $help_places_perms;


