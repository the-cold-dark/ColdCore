
new object $help_coldc_tokens: $help_coldc_lang;

var $has_name name = ['prop, "Tokens", "Tokens"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Tokens are the base elements of ColdC. Tokens are simply abstract groupings of text imbued with a specific meaning. There are many different types of tokens ranging from single characters to long words. The following characters and pairs of characters are tokens in ColdC: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n{   }   [   ]   #[  ]   `[  ]   (   )   (|  |)  (>  <)\n,   ;   =   +=  -=  *=  /=  !   -   +   *   /   %   ..\n==  !=  >   >=  <   <=  .   ||  &&  ?   |   @   --  ++"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "The above tokens are used as operators and punctuation in ColdC expressions and statements. ", <$format, ["subj", [["level", "3"]], ["Identifier"], 'do_subj]>, " ", <$format, ["p", [], [], 'do_p]>, "An ", <$format, ["i", [], ["identifier"], 'do_i]>, " is another type of ColdC token which is a sequence of alphabetic and numeric characters or underlines not beginning with a number. Identifiers in ColdC are case-sensitive, so the identifiers ", <$format, ["tt", [], ["Car"], 'do_tt]>, " and ", <$format, ["tt", [], ["car"], 'do_tt]>, " are not equivalent. The following are all valid identifiers: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\nwe_3_kings\nobj\na"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["p", [], [], 'do_p]>, "Without additional tokens, identifiers usually represent variables. However, certain identifiers have special meanings to the parser. These reserved words are used in writing certain kinds of statements and expressions. They are: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\nvar, if, else, while, for, switch, case, default,\nbreak, continue, return, catch, any, with handler,\npass, to, in"], 'do_quote]>], 'do_dfn]>], #[['this, $help_coldc_tokens]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 853698065;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_tokens];
var $root manager = $help_coldc_tokens;


