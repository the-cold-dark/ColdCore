
new object $weather: $described, $weather_system;

var $described prose = [];
var $foundation defined_msgs = #[["invoke", #[['branches, ["general"]]]]];
var $foundation msgs = #[["invoke", #[["general", <$ctext_frob, [["The weather has changed to ", <$generator, ["weather", [], [], 'gen_weather]>, "."], #[['this, $weather]]]>]]]];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Generic Weather", "the Generic Weather"];
var $root created_on = 855309306;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root defined_settings = #[["attributes", #[['parse, ['parse_setting_attributes]], ['format, ['format_setting_attributes]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_sys_weather;
var $root inited = 1;
var $root managed = [$weather];
var $root manager = $weather;

public method .attribute_vars() {
    var i, attr, extra, a;
    
    a = .attributes();
    attr = $weather_attributes.alist_dict(a);
    for i in ($weather_attributes.extra_attributes())
        dict_add(attr, @i);
    return attr;
};

public method .attributes() {
    return .get_setting("attributes", $weather);
};

public method .format_setting_attributes() {
    arg value;
    var i;
    
    return map i in ($weather_attributes.alist_dict(value)) to (((i[1]) + "=") + (i[2])).join("; ");
};

public method .parse_setting_attributes() {
    arg value;
    
    if (type(value) == 'list)
        value = (value.join()).trim();
    return (> $weather_attributes.parse_attribute_list(value) <);
};


