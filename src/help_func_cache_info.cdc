
new object $help_func_cache_info: $help_funcs_sys;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "cache_info()", "cache_info()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " cache_info()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This administrative function returns a visual map of the active memory cache for database objects. The list returned will have three elements, where each element is:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["Cache Width (INT)"], 'do_li]>, <$format, ["li", [], ["Cache Depth (INT)"], 'do_li]>, <$format, ["li", [], ["Cache Map (LIST)"], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "The Cache Map is a list of strings containing a single character entry for each point in the cache (where the list is ", <$format, ["i", [], ["width"], 'do_i]>, " wide, and there are ", <$format, ["i", [], ["depth"], 'do_i]>, "). The characters can be a lower or uppercase ", <$format, ["tt", [], ["i"], 'do_tt]>, " or ", <$format, ["tt", [], ["a"], 'do_tt]>, ". The character ", <$format, ["tt", [], ["a"], 'do_tt]>, " refers to active objects and the character ", <$format, ["tt", [], ["i"], 'do_tt]>, " refers to inactive objects. If it is capitalized, the object is marked dirty."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $root created_on = 879897889;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_cache_info];
var $root manager = $help_func_cache_info;


