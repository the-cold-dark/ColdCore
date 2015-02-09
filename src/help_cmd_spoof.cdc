
new object $help_cmd_spoof: $help_cmds;

var $has_name name = ['prop, "spoof", "spoof"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The interaction command ", <$format, ["tt", [], ["spoof"], 'do_tt]>, " is used similar to ", <$format, ["link", [["node", "$help_cmd_emote"]], ["emote"], 'do_link]>, ", except your name does not start the line. This is usually used to format your actions in a different way, but can be used to 'spoof' actions from other players--which can be considered rude (be careful when using it so as to not offend anybody). If your name does not appear as a word in the line, it will be appended for attribution. For convenience, the exclaimation point may also be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> spoof Miro slips and falls.", <$format, ["br", [], [], 'do_br]>, "Miro slips and falls. -- Brandon"], 'do_dfn]>, " ", <$format, ["dfn", [], ["> !The big beast pounces on Brandon, pummelling him silly", <$format, ["br", [], [], 'do_br]>, "The big beast pounces on Brandon, pummelling him silly"], 'do_dfn]>], #[['links, #[["emote", "$help_cmd_emote"]]]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[["emote", $help_cmd_emote]];
var $root created_on = 847043939;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_spoof];
var $root manager = $help_cmd_spoof;


