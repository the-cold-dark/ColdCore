
new object $help_coldc_types_buffers: $help_coldc_types;

var $has_name name = ['prop, "Buffer", "Buffer"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "A ", <$format, ["i", [], ["buffer"], 'do_i]>, " is an array of integers which are interpreted to unsigned eight-bit values. Keep this in mind, as the range of an integer in a buffer is only 0 through 255, any other number will be cast to an eight bit unsigned value. ", <$format, ["np", [], [], 'do_np]>, "Buffers are intended for handling character values outside of the normal printable range used by ColdC strings. A buffer is constructed by prefixing a list of integers with an accent mark (", <$format, ["tt", [], ["`"], 'do_tt]>, "), where each integer is the decimal value of the respective character. Buffers are logically true if not empty. The following buffer and string are equivalent:", <$format, ["p", [], [], 'do_p]>, <$format, ["dfn", [], ["`[98, 117, 102, 102, 101, 114]", <$format, ["br", [], [], 'do_br]>, "\"buffer\""], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 853698066;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_types_buffers];
var $root manager = $help_coldc_types_buffers;


