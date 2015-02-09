
new object $help_cmd_set: $help_cmds;

var $has_name name = ['prop, "@set", "@set"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@set [options] [<target>:][<name>[=<value>]]"], 'do_tt]>, <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "This command is used to display and change configurable settings on objects. If <target> is left unspecified it will default to you. To view all settings on an object do not specify a setting name or value, such as either of the following two:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set", <$format, ["br", [], [], 'do_br]>, "@set here:"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The first example will show all settings on you. The second example will show all settings on ", <$format, ["i", [], ["here"], 'do_i]>, ". To change a setting include the setting name after the target followed by an equals sign and a value, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set here:realm=Taobh Thiar"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If the option ", <$format, ["tt", [], ["+definer"], 'do_tt]>, " is given, it will list all of the definers for each setting instance. If a value for definer is given it will only list instances of the settings defined by the given objref, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set +definer=$place here:"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Which will only show the settings defined on ", <$format, ["tt", [], ["here"], 'do_tt]>, " and defined by ", <$format, ["tt", [], ["place"], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, "If the option ", <$format, ["tt", [], ["+clear"], 'do_tt]>, " is given, it will ignore any value specified for the setting and will instead clear the value, reverting it to its original default."], #[['this, $help_cmd_set]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847776342;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_set];
var $root manager = $help_cmd_set;


