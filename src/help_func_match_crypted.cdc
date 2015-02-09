
new object $help_func_match_crypted: $help_funcs_str;

var $has_name name = ['prop, "match_crypted()", "match_crypted()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["LIST"], 'do_i]>, " match_crypted(", <$format, ["i", [], ["STRING crypted"], 'do_i]>, ", ", <$format, ["i", [], ["STRING matchwith"], 'do_i]>, ")"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function is used to match strings encrypted with the ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_crypt"]], ["crypt()"], 'do_link]>], 'do_tt]>, " function. This function should be used instead of directly comparing the result, as it will take into account possible older encryption methods. It returns one if there is a correct match, or zero if there is not. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["match_crypted(\"$SHA1$dEqOGo3d$.lpP/K19QevbwpgSiCsGVnCnrv2\", \"foo\")", <$format, ["br", [], [], 'do_br]>, "=> 1"], 'do_dfn]>], #[['this, $help_func_match_crypted]]]>;
var $help_node index = $help_index_function;
var $help_node links = #[["crypt()", $help_func_crypt]];
var $help_node nolist = 0;
var $root created_on = 855385456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_match_crypted];
var $root manager = $help_func_match_crypted;


