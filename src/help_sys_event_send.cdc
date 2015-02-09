
new object $help_sys_event_send: $help_sys_events;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Sending", "Sending"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Sending events is quite simple, from a programming point of view. There is no registration or initialization involved in creating an event--they exist as they are sent. ", <$format, ["np", [], [], 'do_np]>, "The method used to Send an Event is:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], ["relay.", <$format, ["method", [["event_handler.send_event", 1]], ["send_event"], 'do_method]>, "(", <$format, ["i", [], ["event"], 'do_i]>, ", ", <$format, ["i", [], ["@args"], 'do_i]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Used to send an event. The object ", <$format, ["tt", [], ["relay"], 'do_tt]>, " is the broadcaster of the event (usually the current object's location). Any arguments beyond the event name are sent to the receiving event handler."], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "An example sending the event ", <$format, ["tt", [], ["'combat"], 'do_tt]>, " to the current object's location:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [".location().send_event('combat, target_obj, with_weapon)"], 'do_dfn]>], #[]]>;
var $help_node links = #[];
var $root created_on = 864944385;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_event_send];
var $root manager = $help_sys_event_send;


