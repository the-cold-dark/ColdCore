
new object $help_cml_customizing: $help_cml;

var $has_name name = ['prop, "Customizing Ctext", "Customizing Ctext"];
var $help_node body = <$ctext_frob, [[<$format, ["subj", [["level", "3"]], ["Interface"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "Ctext frobs are created by calling the .", <$format, ["method", [["compiler.compile_cml", 1]], ["compile_cml"], 'do_method]>, "() method off the cml compiler object. On a ctext frob, you may call .", <$format, ["method", [["ctext_frob.uncompile", 1]], ["uncompile"], 'do_method]>, "() to return the original text. A call to .", <$format, ["method", [["ctext_frob.eval_ctext", 1]], ["eval_ctext"], 'do_method]>, "() evaluates the generators, but will not touch the formatters. This is used to speed up message dispatching. Calling ", <$format, ["method", [["ctext_frob.format", 1]], ["format"], 'do_method]>, "() provides the final formatting of the ctext, evaluating everything, including the formatters. You can add/modify variables on a ctext frob by calling .", <$format, ["method", [["ctext_frob.set_var", 1]], ["set_var"], 'do_method]>, "(", <$format, ["var", [], ["variable"], 'do_var]>, ", ", <$format, ["var", [], ["value"], 'do_var]>, "), or .", <$format, ["method", [["ctext_frob.set_vars", 1]], ["set_vars"], 'do_method]>, "(", <$format, ["var", [], ["dict"], 'do_var]>, "), which does the same, but assigning multiple variables at once. ", <$format, ["subj", [["level", "3"]], ["Adding new evaluators"], 'do_subj]>, <$format, ["p", [], [], 'do_p]>, "An evaluator is an object which contains methods for generation or formatting. An evaluation object that is descended from a vanilla evaluator (like $bs_eval) will try to store the evaluation results in a list, and is therefore most suitable for adding new generators. On the other hand, evaluators descended from a formatter object create a string, and try to evaluate and concatenate lists until a string is obtained. Hence, they should be used for formatting. To add a new generator or formatter, simply add a do_format or gen_generator method on the object, where 'format' or 'generator' is the name of the new tag that you wish to add. Make sure that the object is in the evaluation path (by explicitly adding an 'evaluator, 'formatter or even an 'uncompiler field to the ctext frob.)"], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 837752811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cml_customizing];
var $root manager = $help_cml_customizing;


