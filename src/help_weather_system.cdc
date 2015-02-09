
new object $help_weather_system: $help_obj;

var $has_name name = ['prop, "Weather System", "Weather System"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "ColdCore uses elaborate weather system, allowing the administrators to set realistic weathers and climates. The system is based on several objects, each keeping track of a facet of the weather: ", <$format, ["dfn", [["ind", "4"], ["nobound", 1]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], ["$world"], 'do_td]>, <$format, ["td", [], ["$world keeps the weather cycle, and calls the updates on realms."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_places_realms"]], ["$realm"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Children of $realm keep track of the current weather and season, as well as of VR timezones."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_sys_climate"]], ["$climate"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["$climate keeps the season names for each part of the year, and lists of weathers that may occur in that climate."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_sys_weather"]], ["$weather"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["Weather objects contain weather descriptions, messages and attributes. Attributes are the most important, since they can be used to fork room descriptions to reflect conditions in the weather."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_sys_weather_attributes"]], ["$weather_attributes"], 'do_link]>], 'do_td]>, <$format, ["td", [], ["This object is a database of all the available weather attributes."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When changing the weather, the system will pay attention to differences between weather attributes (so it'll be unlikely that a storm will start a moment after the sun shining), seasonal ratings, and inter-realm dependancies."], #[['links, #[["$realm", "$help_places_realms"], ["$climate", "$help_sys_climate"], ["$weather", "$help_sys_weather"], ["$weather_attributes", "$help_sys_weather_attributes"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_core;
var $help_node links = #[["$realm", $help_places_realms], ["$climate", $help_sys_climate], ["$weather", $help_sys_weather], ["$weather_attributes", $help_sys_weather_attributes]];
var $help_node nolist = 0;
var $root created_on = 856455167;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_weather_system];
var $root manager = $help_weather_system;
var $root trusted = [$help_node];


