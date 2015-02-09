
new object $help_cmd_paste: $help_cmds;

var $has_name name = ['prop, "@paste|@paste-to", "@paste|@paste-to"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@paste [to <target>]"], 'do_tt]>, <$format, ["p", [], [], 'do_p]>, <$format, ["p", [], [], 'do_p]>, "The non-VR interaction command ", <$format, ["tt", [], ["@paste"], 'do_tt]>, " is used to display blocks of text either to the room or to a specific person (<target>). If no target is specified, it is displayed to the room. You will be prompted for the text. When you are finished typing in the text, type a period at the beginning of a line, followed by no other characters. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["> @paste\nReceiving input. Enter \".\" to finish or \"@abort\" to abort.\n> USER     PID   %CPU %MEM   VSZ  RSS  COMMAND\n> brandon  10267  0.0 19.4  5800 5928  ./genesis\n> .\n-------------- Brandon (@paste's) ---------------\nUSER     PID   %CPU %MEM   VSZ  RSS  COMMAND\nbrandon  10267  0.0 19.4  5800 5928  ./genesis\n------------------- + Finis + -------------------\n2 lines of text pasted"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847044098;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_paste];
var $root manager = $help_cmd_paste;


