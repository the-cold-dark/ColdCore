
new object $help_cml_colors: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Colors", "Colors"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "CML Color provides services to enable color on user clients supporting HTML or ANSI.", <$format, ["p", [], [], 'do_p]>, <$format, ["subj", [["level", "2"]], [<$format, ["font", [["color", "cyan"]], ["Usage"], 'do_font]>], 'do_subj]>, " ", <$format, ["font", [["color", "green"]], [<$format, ["dfn", [], ["{font color=<color> bcolor=<color>:Text to display in color.}"], 'do_dfn]>], 'do_font]>, <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["font", [["color", "blue"]], [<$format, ["quote", [], ["color:"], 'do_quote]>], 'do_font]>], 'do_dt]>, <$format, ["dd", [], [<$format, ["font", [["color", "yellow"]], ["Defines the foreground color of the text. It must be of a valid type listed in $cml_color,colors."], 'do_font]>], 'do_dd]>, <$format, ["dt", [], [<$format, ["font", [["color", "blue"]], [<$format, ["quote", [], ["bcolor:"], 'do_quote]>], 'do_font]>], 'do_dt]>, <$format, ["dd", [], [<$format, ["font", [["color", "yellow"]], ["Defines the background color, and is not supported in html."], 'do_font]>], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, <$format, ["font", [["color", "green"]], ["color and bcolor are optional, though using neither will have no affect on your text. The following examples are all valid."], 'do_font]>, " ", <$format, ["subj", [["level", "3"]], [<$format, ["font", [["color", "cyan"]], ["Examples:"], 'do_font]>], 'do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], ["{font color=red bcolor=blue:Hello world!}"], 'do_dt]>, <$format, ["dd", [], [<$format, ["font", [["color", "red"], ["bcolor", "blue"]], ["Hello world!"], 'do_font]>], 'do_dd]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dt", [], ["{font color=red:Hello world!}"], 'do_dt]>, <$format, ["dd", [], [<$format, ["font", [["color", "red"]], ["Hello world!"], 'do_font]>], 'do_dd]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dt", [], ["{font bcolor=blue:Hello world!}"], 'do_dt]>, <$format, ["dd", [], [<$format, ["font", [["bcolor", "blue"]], ["Hello world!"], 'do_font]>], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $root created_on = 864416453;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cml_colors];
var $root manager = $help_cml_colors;


