
new object $help_mutex: $help_obj;

var $has_name name = ['prop, "Mutex", "Mutex"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Mutex is 'Mutual Exclusion'. Its purpose is preventing concurrent tasks from interfering with each other. A task grabbing mutex lock will suspend until all other tasks release the incompatible locks. Each lock has class and list of values. Two locks are ", <$format, ["i", [], ["incompatible"], 'do_i]>, " if:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], ["Their class have common descendant (classes themselves are considered descendants for the purpose of this definition)"], 'do_li]>, <$format, ["li", [], ["Their values have common elements."], 'do_li]>], 'do_ul]>, <$format, ["np", [], [], 'do_np]>, "Primary mutex class is $mutex (note that grabbing $mutex will cause all attempts to grab locks with similar values to suspend). Its descendants allow programmer to set up finer locks, which allow multiple tasks to deal with nondisjoint value lists concurrently. ", <$format, ["np", [], [], 'do_np]>, "$mutex has the following functions:", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], [".grab(@values)"], 'do_dt]>, <$format, ["dd", [], ["Grab the list of values on the called class."], 'do_dd]>, <$format, ["dt", [], [".release(@values)"], 'do_dt]>, <$format, ["dd", [], ["Release the list from the class."], 'do_dd]>, <$format, ["dt", [], [".release_all()"], 'do_dt]>, <$format, ["dd", [], ["Release all the locks held by the current class. Use this call from connection objects and such."], 'do_dd]>, <$format, ["dt", [], [".cleanup_dead_tasks()"], 'do_dt]>, <$format, ["dd", [], ["Remove the dead tasks from this class."], 'do_dd]>], 'do_dl]>], #[['this, $help_mutex]]]>;
var $help_node group = 1;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 858089990;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_mutex];
var $root manager = $help_mutex;


