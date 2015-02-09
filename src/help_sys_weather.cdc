
new object $help_sys_weather: $help_weather_system;

var $has_name name = ['prop, "Weather", "Weather"];
var $has_name templates = ["Generic Weather"];
var $help_node body = <$ctext_frob, [["Weather is a container for ", <$format, ["link", [["node", "$help_sys_weather_attributes"]], ["weather attributes"], 'do_link]>, ", description and invocation message. Make sure to follow these conventions when creating a weather object:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], ["name must be an adjective (example: nice, sunny, stormy)"], 'do_li]>, <$format, ["li", [], ["invoke message is printed each time $weather sets this weather to be current in a realm"], 'do_li]>, <$format, ["li", [], ["attributes *must* be set"], 'do_li]>], 'do_ul]>], #[['this, $help_sys_weather]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["weather attributes", $help_sys_weather_attributes]];
var $help_node nolist = 0;
var $root created_on = 856455112;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_weather];
var $root manager = $help_sys_weather;
var $root trusted = [$help_node];


