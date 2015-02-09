
new object $generic_map: $note;

var $described prose = <$ctext_frob, [["This is generic map object - it's generic holder for area maps."], #[['this, $generic_map]]]>;
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Generic Map", "the Generic Map"];
var $has_text text = [];
var $located location = $void;
var $located obvious = 1;
var $root created_on = 840768594;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_generic_map;
var $root inited = 1;
var $root managed = [$generic_map];
var $root manager = $generic_map;
var $thing gender = $gender_neuter;

public method .view() {
    arg x, y, code, height, width;
    var text, i, out, pos, line;
    
    text = .text();
    pos = 0;
    out = [];
    for i in [y .. y + height] {
        line = (| ((text[i]).subrange(x + 1)).pad(width) |) || "";
        pos = pos || (code in line);
        out += [((line.left(width)).replace(code, "[]")).sed("[0-9]", " ", "g")];
    }
    return [@out, pos ? "Your position is '[]'." : "Your position is not shown on this map."];
};


