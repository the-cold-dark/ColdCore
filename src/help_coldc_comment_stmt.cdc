
new object $help_coldc_comment_stmt: $help_coldc_simple_stmts;

var $has_name name = ['prop, "Comment", "Comment"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The ", <$format, ["i", [], ["comment statement"], 'do_i]>, " does nothing. A comment statement is used for including notes within ColdC code. It is formatted as two forward slashes followed by any characters up to the end of the line, such as:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["tt", [], ["// This is a comment."], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The interpreter ignores comment statements completely; they are for the benefit of human readers. Note that comments in ColdC are actual statements, unlike comments in other languages, which are usually discarded by the preprocessor."], #[['this, $help_coldc_comment_stmt]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854343841;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_comment_stmt];
var $root manager = $help_coldc_comment_stmt;


