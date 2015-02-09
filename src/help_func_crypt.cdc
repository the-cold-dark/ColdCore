
new object $help_func_crypt: $help_funcs_str;

var $has_name name = ['prop, "crypt()", "crypt()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING"], 'do_i]>, " crypt(", <$format, ["i", [], ["STRING str"], 'do_i]>, "[, ", <$format, ["i", [], ["STRING salt"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function performs one-way encryption on ", <$format, ["i", [], ["str"], 'do_i]>, ", using the SHA encryption routine. If ", <$format, ["i", [], ["salt"], 'do_i]>, " is not specified, it is chosen randomly. The return value of ", <$format, ["tt", [], ["crypt()"], 'do_tt]>, " is the encrypted string. ", <$format, ["np", [], [], 'do_np]>, "The encryption performed by this function has the property that it is very difficult to find a string which will produce a given result; however, a given string and a given salt will always yield the same encrypted string. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["crypt(\"foo\", \"ab\")", <$format, ["br", [], [], 'do_br]>, "=> \"$2$ab$TmSIW.xT3sTkwqUhTLxCH192J37\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When matching an encrypted string versus a non-encrypted string, the function ", <$format, ["link", [["node", "$help_func_match_crypted"]], ["match_crypted()"], 'do_link]>, " should be used, as it will take into consideration any possible future changes to the crypt() implementation."], #[['links, #[["match_crypted()", "$help_func_match_crypted"]]]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["match_crypted()", $help_func_match_crypted]];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_crypt];
var $root manager = $help_func_crypt;


