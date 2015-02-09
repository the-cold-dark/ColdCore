
new object $help_traceback_recording: $help_admin;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Traceback Recording", "Traceback Recording"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Tracebacks are recorded when they arise from certain actions, including all tracebacks caused by a command, and all tracebacks during creation and destruction of an object. The traceback is stored along with relevant information on the administrator-only mail list *tracebacks (limited to administrators because it may contain privileged information, such as commands typed by users). ", <$format, ["np", [], [], 'do_np]>, "To receive notification of the tracebacks as they occur, make sure to subscribe to the *tracebacks mailing list. ", <$format, ["np", [], [], 'do_np]>, "Whether a user see's tracebacks or not depends upon what their user class is, in relation to the system setting:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["$sys:traceback-for"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Which is a user class specifying what classes will see real tracebacks. If the user is not a descendant of this class, they will instead receive a polite message about the error."], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $root created_on = 909407321;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_traceback_recording];
var $root manager = $help_traceback_recording;


