
new object $help_interface_format: $help_interface;

var $has_name name = ['prop, "Format", "Format"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "By default your output format is plaintext (text/plain). You can change this to other formats by setting your Content-Type. Currently supported alternate types are:", <$format, ["p", [], [], 'do_p]>, <$format, ["ul", [], [<$format, ["li", [], ["Plain Text (text/plain)"], 'do_li]>, <$format, ["li", [], ["ANSI Text (text/ansi)"], 'do_li]>, <$format, ["li", [], ["HTML Text (text/html)"], 'do_li]>, <$format, ["li", [], ["Pueblo Browser Text (text/pueblo)"], 'do_li]>, <$format, ["li", [], ["TkMoo Text (text/tkmoo)"], 'do_li]>, <$format, ["li", [], ["Wrapped Text (text/wrapped)"], 'do_li]>], 'do_ul]>, <$format, ["np", [], [], 'do_np]>, "These formats can easilly be extended to include others. To change your output format use the command:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["@set content-type=type"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Where ", <$format, ["i", [], ["type"], 'do_i]>, " is one of the MIME encodings of the above types ie: text/plain. Use text/wrapped if your client doesn't wrap text automaticly."], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 847664131;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_interface_format];
var $root manager = $help_interface_format;


