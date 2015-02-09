
new object $help_sys_event_recv: $help_sys_events;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Receiving", "Receiving"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Events are received through the following method:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], [".event_notify(event, obj, @args)"], 'do_dt]>, <$format, ["dd", [], ["Receive an event caused by 'obj'."], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "The ", <$format, ["tt", [], ["event"], 'do_tt]>, " argument is the name of the event. The ", <$format, ["tt", [], ["obj"], 'do_tt]>, " argument is the object which caused the event, any subsequent arguments are those sent to ", <$format, ["tt", [], [".send_event()"], 'do_tt]>, ", which is explained in the section ", <$format, ["link", [["node", "help_sys_event_send"]], ["Sending Events"], 'do_link]>, "."], #[['links, #[["Sending Events", "help_sys_event_send"]]]]]>;
var $help_node links = #[["Sending Events", $help_sys_event_send]];
var $root created_on = 864944385;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_event_recv];
var $root manager = $help_sys_event_recv;


