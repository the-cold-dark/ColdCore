
new object $help_node_editor_invoking: $help_sys_editor;

var $has_name name = ['prop, "Invoking", "Invoking"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [], [<$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@edit"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["List all editor sessions."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@edit %<x>"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Resume background session, where <x> is the session to resume (as listed in the session list)"], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@edit object.method"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Create a new session with the specified method."], 'do_dd]>, <$format, ["dt", [], [<$format, ["subj", [["level", "3"]], [<$format, ["tt", [], ["@edit object [+t?ype=method]"], 'do_tt]>], 'do_subj]>], 'do_dt]>, <$format, ["dd", [], ["Edit data on the object. Type specifies what data (typical values: prose, text, messages or help). Without +t, a reasonable default is chosen."], 'do_dd]>], 'do_dl]>], #[['this, $help_node_editor_invoking]]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 840586820;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_node_editor_invoking];
var $root manager = $help_node_editor_invoking;


