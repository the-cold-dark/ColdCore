
new object $help_cmd_page: $help_cmds;

var $has_name name = ['prop, "@page", "@page"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Syntax: ", <$format, ["tt", [], ["@page <who>[,<who>..] with <anything>"], 'do_tt]>, <$format, ["np", [], [], 'do_np]>, "The non-VR interaction command ", <$format, ["tt", [], ["@page"], 'do_tt]>, " is used to interact with one or more people not in the room. For convenience, the dash character may also be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @page Amy with dinner tonight?", <$format, ["br", [], [], 'do_br]>, "[to Amy] Brandon says, \"dinner tonight?\""], 'do_dfn]>, " ", <$format, ["dfn", [], ["> -Miro Hi", <$format, ["br", [], [], 'do_br]>, "[to Miro] Brandon says, \"Hi\""], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "The people receiving the message see your location inside the square brackets, instead of who it is being directed to, such as [from The Pit] instead of [to Amy]. The default style of interaction is speach (similar to ", <$format, ["link", [["node", "$help_cmd_say"]], ["say"], 'do_link]>, "), you can also ", <$format, ["link", [["node", "$help_cmd_emote"]], ["emote"], 'do_link]>, " in page, by beginning your message with a colon:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> @page Brian with :waves", <$format, ["br", [], [], 'do_br]>, "[to Brian] Brandon waves"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "As with any directed interaction command, you can double up the shortcut character to send to the last person you directed to. Example:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> -Brian :waves", <$format, ["br", [], [], 'do_br]>, "[to Brian] Brandon waves", <$format, ["br", [], [], 'do_br]>, "> --how goes it?", <$format, ["br", [], [], 'do_br]>, "[to Brian] Brandon says, \"how goes it?\""], 'do_dfn]>], #[['this, $help_cmd_page]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["say", $help_cmd_say], ["emote", $help_cmd_emote]];
var $root created_on = 847043729;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_page];
var $root manager = $help_cmd_page;


