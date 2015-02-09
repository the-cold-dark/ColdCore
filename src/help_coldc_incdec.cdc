
new object $help_coldc_incdec: $help_coldc_arith;

var $has_name name = ['prop, "Increment|Decrement", "Increment|Decrement"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The unary Increment (", <$format, ["tt", [], ["++"], 'do_tt]>, ") and Decrement (", <$format, ["tt", [], ["--"], 'do_tt]>, ") operators perform a dual purpose. They either add or subtract one from a numeric variable (respectively), assigning the result back to the variable. They must be used directly on a variable. All of the following are equivalent:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["i = i + 1", <$format, ["br", [], [], 'do_br]>, "i++", <$format, ["br", [], [], 'do_br]>, "i = i - 1", <$format, ["br", [], [], 'do_br]>, "i--"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The result returned from an increment or decrement expression will will depend upon what side of the variable it is placed. If the operator is on the left side of the variable, the value of the variable is modified before it is returned. If the operator is on the right side of the variable, the value of the variable is returned first and then the variable is incremented or decremented. ", <$format, ["np", [], [], 'do_np]>, "In the examples below assume ", <$format, ["tt", [], ["i"], 'do_tt]>, " is 10. Assuming this, in the first example ", <$format, ["tt", [], ["x"], 'do_tt]>, " is assigned the value ", <$format, ["tt", [], ["10"], 'do_tt]>, " where in the second example it is assigned the value ", <$format, ["tt", [], ["11"], 'do_tt]>, ".", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["x = i++", <$format, ["br", [], [], 'do_br]>, "x=++i"], 'do_tt]>], 'do_dfn]>], #[['this, $help_coldc_incdec]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854136779;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_incdec];
var $root manager = $help_coldc_incdec;


