
new object $help_help_navigating: $help_help;

var $has_name name = ['prop, "Navigating Help", "Navigating Help"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "You may encounter conflicts of link and node names while navigating help. This may occur if you do not specify the entire link name. Make sure when you activate a link you include enough of the link name to get a precise match (you do not always need to specify the entire link name). If you are still getting a conflict you can narrow the search parameters. First, to better understand what happens when you activate a link keep in mind the following search order:", <$format, ["p", [], [], 'do_p]>, <$format, ["ol", [], [<$format, ["li", [], ["Search in current page links"], 'do_li]>, <$format, ["li", [], ["Search in current page group"], 'do_li]>, <$format, ["li", [], ["Search in current page's index"], 'do_li]>, <$format, ["li", [], ["Search in all other help indices"], 'do_li]>], 'do_ol]>, <$format, ["np", [], [], 'do_np]>, "If you are having a conflict you can prefix what you are searching for with either ", <$format, ["tt", [], ["group="], 'do_tt]>, ", ", <$format, ["tt", [], ["link="], 'do_tt]>, " or ", <$format, ["tt", [], ["index="], 'do_tt]>, " and it will search only in the respective area. For instance, if you were to type:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["?index=narf"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "It would bypass any links or group nodes to ", <$format, ["tt", [], ["narf"], 'do_tt]>, ", and only search in the current index and subsequent indices. Furthermore, if you specify a word other than the above, it will attempt to match only in the relevant index. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["?core=narf"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Would search only in the core index, assuming it existed. Furthermore, when searching a specific index if the search word you specify is simply a hash-mark ", <$format, ["tt", [], ["#"], 'do_tt]>, ", it will set the current index as the help node."], #[['this, $help_help_navigating]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 847650599;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_help_navigating];
var $root manager = $help_help_navigating;


