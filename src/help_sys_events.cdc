
new object $help_sys_events: $help_sys;

var $has_name name = ['prop, "Events", "Events"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The Event System allows objects to be notified of changes in their environment. They do this by selectively hooking into known events, such as movement and social interaction events. When the event occurs all objects which have hooked into it will be notified. ", <$format, ["np", [], [], 'do_np]>, "The Event System is actually several subsystems all handled through the same parent object--this will often cause confusion. In general, the only subsystem most people will be interested with is the Registering ability of hooks. However, all of the subsystems are: Registering, Hooking, Sending/Receiving. ", <$format, ["np", [], [], 'do_np]>, "The Registering subsystem allows an object to register an event hook along with when it should be turned on/off and when it should be updated (such as when the object is moved). The Hooking subsystem deals with whether the object receives an event or not (the object must be hooked into an event to receive it). The Sending/Receiving subsystem deals with the initial and final stages of sending and receiving events. In general, a programmer is only interested in the Registering and Sending/Receiving subsystems (as Hooking is handled automatically once an event is Registered). ", <$format, ["np", [], [], 'do_np]>, "See Also:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], [<$format, ["link", [["node", "$help_sys_event_register"]], ["Registering"], 'do_link]>, " Events"], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_sys_event_hook"]], ["Hooking"], 'do_link]>, " Events"], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_sys_event_send"]], ["Sending"], 'do_link]>, " Events"], 'do_li]>, <$format, ["li", [], [<$format, ["link", [["node", "$help_sys_event_recv"]], ["Receiving"], 'do_link]>, " Events"], 'do_li]>], 'do_ul]>], #[['links, #[["Registering", "$help_sys_event_register"], ["Hooking", "$help_sys_event_hook"], ["Sending", "$help_sys_event_send"], ["Receiving", "$help_sys_event_recv"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_subsystem;
var $help_node links = #[["Registering", $help_sys_event_register], ["Hooking", $help_sys_event_hook], ["Sending", $help_sys_event_send], ["Receiving", $help_sys_event_recv]];
var $help_node nolist = 0;
var $root created_on = 850790348;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_events];
var $root manager = $help_sys_events;


