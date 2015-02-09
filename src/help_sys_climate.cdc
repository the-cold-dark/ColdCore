
new object $help_sys_climate: $help_weather_system;

var $has_name name = ['prop, "Climate", "Climate"];
var $help_node body = <$ctext_frob, [["Instances of the climate object are used to define general weather patterns for an area. The following information is stored on each climate object:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], ["A list of season names."], 'do_li]>, <$format, ["li", [], ["A list of daylengths assigned to each season. Daylength is given as an offset, meaning that with +2, you have an early sunrise and late sunset. This number is interpreted by $world_time."], 'do_li]>, <$format, ["li", [], ["A list of weathers, each with probabilities for every season. Probabilities are not percentages, instead, only their ratios really matter."], 'do_li]>], 'do_ul]>, <$format, ["subj", [["level", "3"]], ["Climate commands"], 'do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], ["@setup <this> seasons <any> daylengths <any>"], 'do_dt]>, <$format, ["dd", [], ["Erases all the data on a climate object, sets a new season list and daylength lists. Both arguments are list of items separated by space; they must be of the same length."], 'do_dd]>, <$format, ["dt", [], ["@list-climate <this>"], 'do_dt]>, <$format, ["dd", [], ["Shows the information on climate."], 'do_dd]>, <$format, ["dt", [], ["@add-weather <this> type <descendant of $weather> prob?abilities <any>"], 'do_dt]>, <$format, ["dd", [], ["Adds a weather object to $climate; the object must be already built. Probabilities is a ' '-separated list of integers, one element for each season."], 'do_dd]>, <$format, ["dt", [], ["@del-weather <this> type <descendant of $weather>"], 'do_dt]>, <$format, ["dd", [], ["Removes weather from the climate."], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "No climate patterns should ever be defined on the base $climate object."], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 856455152;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_sys_climate];
var $root manager = $help_sys_climate;
var $root trusted = [$help_node];


