
new object $help_func_pad: $help_funcs_str;

var $has_name name = ['prop, "pad()", "pad()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " pad(", <$format, ["i", [], ["STRING str"], 'do_i]>, ", ", <$format, ["i", [], ["INTEGER length"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING filler"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function pads or truncates the argument ", <$format, ["i", [], ["string"], 'do_i]>, " to the length given with the argument ", <$format, ["i", [], ["length"], 'do_i]>, ". If the argument ", <$format, ["i", [], ["filler"], 'do_i]>, " is specified, then it is used to pad the string, otherwise a space is used. If ", <$format, ["i", [], ["length"], 'do_i]>, " is greater than the length of ", <$format, ["i", [], ["string"], 'do_i]>, ", then ", <$format, ["i", [], ["pad"], 'do_i]>, " adds filler characters on the right. If the length is a negative amount, filler will be added on the left instead. The function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_strfmt"]], ["strfmt()"], 'do_link]>], 'do_tt]>, " may also be used for string padding. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["pad(\"foo\", 6)", <$format, ["br", [], [], 'do_br]>, "=> \"foo \""], 'do_dfn]>, " ", <$format, ["dfn", [], ["pad(\"foobar\", 3)", <$format, ["br", [], [], 'do_br]>, "=> \"foo\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["pad(tostr(29), -4, \"0\")", <$format, ["br", [], [], 'do_br]>, "=> \"0029\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["pad(\"what\", 20, \"!?!\")", <$format, ["br", [], [], 'do_br]>, "=> \"what!?!!?!!?!!?!!?!!\""], 'do_dfn]>], #[['this, $help_func_pad]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["strfmt()", $help_func_strfmt]];
var $help_node nolist = 0;
var $root created_on = 855384457;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_pad];
var $root manager = $help_func_pad;


