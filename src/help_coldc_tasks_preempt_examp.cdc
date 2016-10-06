
new object $help_coldc_tasks_preempt_examp: $help_coldc_tasks_preempt;

var $has_name name = ['prop, "Example", "Example"];
var $help_node body = <$ctext_frob, [[<$format, ["np", [], [], 'do_np]>, "An example of suspending a task is when reading an indefinite amount of input from a connection. Input arrives through the ", <$format, ["i", [], ["parse"], 'do_i]>, " method on an object (see ", <$format, ["link", [["node", "$help_coldc_networking"]], ["Networking"], 'do_link]>, "), which we define as follows, assuming the object variables ", <$format, ["i", [], ["reading"], 'do_i]>, ", ", <$format, ["i", [], ["read"], 'do_i]>, ", ", <$format, ["i", [], ["buffer"], 'do_i]>, " and ", <$format, ["i", [], ["lines"], 'do_i]>, ". ", <$format, ["i", [], ["reading"], 'do_i]>, " is used to store a boolean value of true or false, depending upon if we are reading input or not. ", <$format, ["i", [], ["read"], 'do_i]>, " is used to store what we have already read from the connection. ", <$format, ["i", [], ["buffer"], 'do_i]>, " is used to store incoming information which is not yet parsable by the function ", <$format, ["i", [], ["buf_to_strings()"], 'do_i]>, " (i.e. there is no carriage return yet). ", <$format, ["i", [], ["lines"], 'do_i]>, " is used to buffer lines converted by ", <$format, ["i", [], ["buf_to_strings()"], 'do_i]>, " from the connection which we have not parsed yet. It is important to use an object variable for both ", <$format, ["i", [], ["buffer"], 'do_i]>, " and ", <$format, ["i", [], ["lines"], 'do_i]>, ", because if the task suspends all information stored in either variable would be suspended along with that instance of the task.", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["ind", "4"]], [<$format, ["quote", [], ["driver method .parse() {\n    arg incoming;\n    var line;\n\n    lines = buf_to_strings(buffer + incoming));\n    buffer = lines[listlen(lines)];\n    lines = delete(lines, listlen(lines));\n\n    // now parse the lines\n    for line in (buf_to_strings(incoming)) {\n        if (reading) {\n            if (line == \".\")\n                .done_reading();\n            else\n                read += [line];\n        } else {\n            .parse_line(line);\n        }\n    }\n}"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "We will not define the method ", <$format, ["i", [], ["parse_line"], 'do_i]>, ", just assume that it parses the line as a command. When an object wishes to start reading from the connection it calls the method ", <$format, ["i", [], [".read()"], 'do_i]>, " on the connection object:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["ind", "4"]], [<$format, ["quote", [], ["public method .read() {\n    // reading just has to be true, so lets save space and store the\n    // task id there as well, instead of storing it in another variable.\n    reading = task_id();\n\n    // make sure this is an empty list\n    read = [];\n\n    // suspend the task, have our return value be the return value\n    // of suspend (which is whatever resume() sends)\n    return suspend();\n}"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "When a period is found as the line being read, the connection is done reading (the period is insignificant, and is only used in this example for convenience), and the method ", <$format, ["i", [], ["done_reading"], 'do_i]>, " is called:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [["ind", "4"]], [<$format, ["quote", [], ["protected method .done_reading() {\n    var info, task;\n\n    // get a local copy of what we read, and the task id\n    info = read;\n    task = reading;\n\n    // reset the object variables first\n    read = [];\n    reading = 0;\n\n    // resume the task, send what we read as the return\n    // value for suspend()\n    resume(task, info);\n}"], 'do_quote]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Now, all that has to happen to read input from a connection is to call the method ", <$format, ["i", [], [".read()"], 'do_i]>, " on the connection object, and the input read is returned from the method call. ", <$format, ["np", [], [], 'do_np]>, "It is possible to set a task as ", <$format, ["i", [], ["atomic"], 'do_i]>, ". Atomic tasks cannot be preempted or suspended. If an attempt is made to preempt or suspend an atomic task the error ", <$format, ["tt", [], ["~atomic"], 'do_tt]>, " is thrown instead. However, calling ", <$format, ["tt", [], ["refresh()"], 'do_tt]>, " while executing atomically will always refresh the current frame's ticks. A task's atomic state is toggled using the function ", <$format, ["tt", [], [<$format, ["link", [["node", "$help_func_atomic"]], ["atomic()"], 'do_link]>], 'do_tt]>, ". ", <$format, ["np", [], [], 'do_np]>, <$format, ["b", [], ["Note:"], 'do_b]>, " be very cautious when using atomic tasks. Atomic tasks can easily disrupt the regular integrity of an online environment. See the section on ", <$format, ["link", [["node", "$help_coldc_security"]], ["Security"], 'do_link]>, "."], #[['this, $help_coldc_tasks_preempt_examp]]]>;
var $help_node group = 1;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 854946269;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_tasks_preempt_examp];
var $root manager = $help_coldc_tasks_preempt_examp;


