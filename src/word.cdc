
new object $word: $utilities;

var $root created_on = 856377068;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root help_node = $help_sys_word;
var $root inited = 1;
var $root managed = [$word];
var $root manager = $word;
var $word firstcons = #[["th", 1], ["b", 5], ["f", 9], ["qu", 10]];
var $word lastcons = #[["bh", 1], ["d", 5], ["b", 9]];
var $word syllable_pat = #[[["V"], 2], [["V", "LC"], 6], [["C", "V"], 8]];
var $word syllables = #[[2, 3], [3, 4]];
var $word vowels = #[["a", 10], ["e", 20], ["i", 30]];

public method .firstcons() {
    return firstcons;
};

public method .format_chances() {
    return ((((((((.format_dict(syllables, "S")) + [""]) + (.format_dict(syllable_pat, "SP"))) + [""]) + (.format_dict(vowels, "V"))) + [""]) + (.format_dict(firstcons, "C"))) + [""]) + (.format_dict(lastcons, "LC"));
};

public method .format_dict() {
    arg dict, cmd;
    var out, v, last, num;
    
    out = [];
    for v in (dict) {
        num = (v[2]) - last;
        last = v[2];
        if ((type(v[1]) == 'string) && (" " in (v[1])))
            out += [(((cmd + " \"") + (v[1])) + "\" ") + num];
        if (type(v[1]) == 'list)
            out += [(((cmd + " ") + ((v[1]).join("-"))) + " ") + num];
        else
            out += [(((cmd + " ") + (v[1])) + " ") + num];
    }
    return out;
};

public method .generate() {
    var x, y, out, pat, p;
    
    out = "";
    for x in [1 .. .pick_value('syllables)] {
        pat = .pick_value('syllable_pat);
        for p in (pat) {
            switch (p) {
                case "V":
                    out += .pick_value('vowels);
                case "C":
                    out += .pick_value('firstcons);
                case "LC":
                    out += .pick_value('lastcons);
                default:
                    throw(~invpat, "Invalid syllable pattern: " + pat);
            }
        }
    }
    return out.capitalize();
};

public method .lastcons() {
    return lastcons;
};

public method .pick_value() {
    arg name;
    var top, pick, v, last;
    
    top = dict_values(get_var(name)).last();
    pick = random(top);
    for v in (get_var(name)) {
        if ((v[2]) > pick)
            return v[1];
        last = v[1];
    }
    return last;
};

public method .set_chances() {
    arg what, value;
    var out, last, v, chance;
    
    (> .perms(sender()) <);
    
    // chances are received as a #[["what", chance]] dict
    // which is converted where the chance is a cumulative range of the total
    out = #[];
    for v in (value) {
        chance = v[2];
        out = dict_add(out, v[1], chance + last);
        last += chance;
    }
    set_var(what, out);
    return get_var(what);
};

public method .submit_chances() {
    arg lines;
    var line, linec, s, sp, v, fc, lc, val, chance, vsp, part;
    
    s = (sp = (v = (fc = (lc = #[]))));
    for line in (lines) {
        linec++;
        if (match_regexp(line, " *#"))
            continue;
        line = line.explode_quoted();
        if (!line)
            continue;
        if (listlen(line) != 3)
            throw(~bad, (("Line " + linec) + ": Invalid config: ") + (line.join()));
        chance = toint(line[3]);
        if (!chance)
            throw(~bad, ("Line " + linec) + ": Chance must be one or more.");
        switch (line[1]) {
            case "S":
                val = toint(line[2]);
                if (!val)
                    throw(~bad, ("Line " + linec) + ": Syllables must be one or more.");
                s = s.add(val, chance);
            case "SP":
                val = line[2];
                val = explode(uppercase(strsed(val, "[^CVL-]+", "")), "-");
                if (filter part in (val) where (!(part in ["C", "V", "LC"])))
                    throw(~bad, ("Line " + linec) + ": Invalid syllable pattern");
                sp = sp.add(val, chance);
            case "C":
                if (!(line[2]))
                    throw(~bad, ("Line " + linec) + ": Invalid consanant");
                fc = fc.add(line[2], chance);
            case "LC":
                if (!(line[2]))
                    throw(~bad, ("Line " + linec) + ": Invalid consanant");
                lc = lc.add(line[2], chance);
            case "V":
                if (!(line[2]))
                    throw(~bad, ("Line " + linec) + ": Invalid vowel");
                v = v.add(line[2], chance);
            default:
                throw(~bad, (("Line " + linec) + ": Invalid directive: ") + (line[1]));
        }
        refresh();
    }
    .set_chances('syllables, s);
    .set_chances('syllable_pat, sp);
    .set_chances('firstcons, fc);
    .set_chances('lastcons, lc);
    .set_chances('vowels, v);
};

public method .syllable_pat() {
    return syllable_pat;
};

public method .syllables() {
    return syllables;
};

public method .vowels() {
    return vowels;
};


