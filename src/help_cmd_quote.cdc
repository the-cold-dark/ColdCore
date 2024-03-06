
new object $help_cmd_quote: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "quote", "quote"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "This interaction command allows you to quote (without any substitution by the system) a line of text. It can also be used via the '|' shortcut. ", <$format, ["np", [], [], 'do_np]>, " ", <$format, ["b", [], ["Examples:"], 'do_b]>, <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">quote Brandon giggles like a little schoolgirl.\nVampire | Brandon giggles like a little schoolgirl.\n\n>|Brandon beats Vampire with a wet noddle.\nVampire | Brandon beats Vampire with a wet noddle.\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #[];
var $root created_on = 874182075;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_cmd_quote];
var $root manager = $help_cmd_quote;


