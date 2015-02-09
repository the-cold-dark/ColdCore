
new object $help_cmd_emote: $help_cmds;

var $has_name name = ['prop, "emote", "emote"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The interaction command ", <$format, ["tt", [], ["emote"], 'do_tt]>, " is used for free-form actions. For convenience, the colon character may also be used as a shortcut. Examples:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> emote waves to everybody", <$format, ["br", [], [], 'do_br]>, "Brandon waves to everybody"], 'do_dfn]>, " ", <$format, ["dfn", [], ["> :jumps up and down", <$format, ["br", [], [], 'do_br]>, "Brandon jumps up and down"], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "You can get rid of the space after your name, by doubling up the colon:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["> ::'s head hurts", <$format, ["br", [], [], 'do_br]>, "Brandon's head hurts"], 'do_dfn]>], #[['this, $help_cmd_emote]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 847043476;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_emote];
var $root manager = $help_cmd_emote;


