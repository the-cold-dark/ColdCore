
new object $help_coldc_hash: $help_coldc_loop_expr;

var $has_name name = ['prop, "hash", "hash"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["tt", [], ["hash"], 'do_tt]>, " expression loops a variable through a list, dictionary or integer range, evaluating an expression for each iteration. Results from each iteration must be contained within a two element list. The list is inserted as the key/value pair into a dictionary. After the loop completes the final dictionary is returned. The syntax for hash can be either of the following:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["hash x in ([1, 2, 3]) to ([toobjnum(x).name(), x])", <$format, ["br", [], [], 'do_br]>, "=> #[[\"$root\", 1], [\"Brandon\", 2], [\"Dancer\", 3]]"], 'do_dfn]>, " ", <$format, ["dfn", [], ["hash x in [1 .. 3] to (.random_pair())", <$format, ["br", [], [], 'do_br]>, "=> #[[\"Dancer\", 1], [\"Miro\", 7], [\"$root\", 1]]"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "In the above example the method ", <$format, ["tt", [], [".random_pair()"], 'do_tt]>, " returns a random two element key/value pair."], #[['this, $help_coldc_hash]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854330811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_hash];
var $root manager = $help_coldc_hash;


