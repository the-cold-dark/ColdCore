
new object $help_func_fchmod: $help_funcs_file;

var $has_name name = ['prop, "fchmod()", "fchmod()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " fchmod(", <$format, ["i", [], ["STRING mode"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING file"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function changes the mode of a file or directory. The mode is an octal number constructed by logically OR-ing the following values:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [["columned", 1]], [<$format, ["dt", [], ["4000"], 'do_dt]>, <$format, ["dd", [], ["set-user-ID-on-execution"], 'do_dd]>, <$format, ["dt", [], ["2000"], 'do_dt]>, <$format, ["dd", [], ["set-group-ID-on-execution"], 'do_dd]>, <$format, ["dt", [], ["1000"], 'do_dt]>, <$format, ["dd", [], ["sticky bit, see the unix manual on chmod"], 'do_dd]>, <$format, ["dt", [], ["0400"], 'do_dt]>, <$format, ["dd", [], ["read by owner"], 'do_dd]>, <$format, ["dt", [], ["0200"], 'do_dt]>, <$format, ["dd", [], ["write by owner"], 'do_dd]>, <$format, ["dt", [], ["0100"], 'do_dt]>, <$format, ["dd", [], ["execute (or search for directories) by owner"], 'do_dd]>, <$format, ["dt", [], ["0070"], 'do_dt]>, <$format, ["dd", [], ["read, write, execute/search by group"], 'do_dd]>, <$format, ["dt", [], ["0007"], 'do_dt]>, <$format, ["dd", [], ["read, write, execute/search by others"], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "The read, write, and execute/search values for group and others are en- coded as described for owner. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["fchmod(\"0644\", \"home.html\")", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "If the ", <$format, ["tt", [], ["RESTRICTIVE_FILES"], 'do_tt]>, " option has been compiled into the driver, sticky and setuid/setgid bits cannot be changed."], #[['this, $help_func_fchmod]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fchmod];
var $root manager = $help_func_fchmod;


