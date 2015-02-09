
new object $help_msg_prop: $help_sys_message;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Message Propagation", "Message Propagation"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Messages can be propagated - i.e. transmitted through objects that partially garble or mute parts of the message. Each message has 'senses' associated with it - audibility, visibility, smell, and so on. A rule of the thumb would be that 0 is imperceptible, 10 is average, 20 corresponds to atomic blast, in every way. Propagating the message lowers the sense values, and can modify the text of the message. Once all the message's sense values are lowered below zero, it will stop propagating. ", <$format, ["np", [], [], 'do_np]>, "The general syntax of the message propagators is as follows: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n\nsense=value; sense=value; ... [/prefix or effect]"], 'do_quote]>], 'do_dfn]>, " ", <$format, ["np", [], [], 'do_np]>, "In the above, each sense will be decreased by given value after the propagation. Senses that aren't mentioned in the propagator specification are not propagated (use any=value to override this). Prefix, if specified, will be prepended to the message. Alternatively, specifying it as ", <$format, ["quote", [], ["/.method_name"], 'do_quote]>, " will call a method from $propagator_effects, allowing more thorough modification of the text. ", <$format, ["np", [], [], 'do_np]>, "Within message, {sense:name} will return the value of the sense, as perceived by the player. Combined with {switch}, this can be used for gradual garbling of the information the player receives."], #[]]>;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $root created_on = 863604499;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_msg_prop];
var $root manager = $help_msg_prop;


