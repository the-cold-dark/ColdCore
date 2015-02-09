
new object $cml_color: $utilities;

var $cml_color colors = #[["black", ["000000", "30", "40"]], ["red", ["ff0000", "31", "41"]], ["green", ["00ff00", "32", "42"]], ["yellow", ["ffff00", "33", "43"]], ["blue", ["0000ff", "34", "44"]], ["magenta", ["ff00ff", "35", "45"]], ["cyan", ["00ffff", "36", "46"]], ["white", ["ffffff", "37", "47"]]];
var $dmi_data descriptions = #[];
var $root created_on = 863559837;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$cml_color];
var $root manager = $cml_color;

public method .fmt_colors() {
    var c, out;
    
    out = ["COLOR        RGB     ANSI"];
    for c in (colors)
        out += [strfmt("%12s #%6l %3l", c[1], @c[2])];
    return out;
};

public method .get_color() {
    arg color;
    
    return colors[color];
};


