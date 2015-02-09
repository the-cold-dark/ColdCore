
new object $help_obj_has_text: $help_obj;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "has_text", "has_text"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "$has_text provides general services for handling text and is largely used in $note and $mail_message.", <$format, ["p", [], [], 'do_p]>, <$format, ["subj", [["level", "3"]], ["Settings"], 'do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["quote", [], ["plaintext"], 'do_quote]>], 'do_dt]>, <$format, ["dd", [], ["Is either yes or no. Yes indicates that the text is plaintext and no processing need be done. No indicates that the text is CML and needs to be handled as such."], 'do_dd]>], 'do_dl]>, <$format, ["subj", [["level", "3"]], [<$format, ["link", [["node", "$help_obj_has_text_methods"]], ["Methods"], 'do_link]>], 'do_subj]>, " ", <$format, ["subj", [["level", "3"]], ["Variables"], 'do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["quote", [], ["text"], 'do_quote]>], 'do_dt]>, <$format, ["dd", [], ["Stores the text in either plaintext or the internal representation of CML depending on the setting \"plaintext\"."], 'do_dd]>], 'do_dl]>], #[['links, #[["Methods", "$help_obj_has_text_methods"]]]]]>;
var $help_node group = 1;
var $help_node index = $help_index_objects;
var $help_node links = #[["Methods", $help_obj_has_text_methods]];
var $root created_on = 864411446;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_has_text];
var $root manager = $help_obj_has_text;


