
new object $character: $thing;

var $character affiliation = 0;
var $character agl = 0;
var $character app = 0;
var $character awr = 0;
var $character cha = 0;
var $character cmb = 0;
var $character cra = 0;
var $character csrc = 0;
var $character dead = 0;
var $character deaths = 0;
var $character dmg = 0;
var $character end = 0;
var $character hum = 0;
var $character identity = 0;
var $character int = 0;
var $character itg = 0;
var $character kno = 0;
var $character lif = 0;
var $character lrn = 0;
var $character npc = 0;
var $character per = 0;
var $character rea = 0;
var $character src = 0;
var $character str = 0;
var $character wil = 0;
var $described prose = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "Generic Character", "Generic Character"];
var $located location = $nowhere;
var $located obvious = 1;
var $root created_on = 890933084;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$character];
var $root manager = $character;
var $thing gender = $gender_neuter;

public method .attribute() {
    arg attribute;
    
    if (caller() != definer())
        (> .perms(sender(), 'trusts) <);
    if (!(attribute in (.attributes())))
        throw(~invattr, "Invalid Attribute: " + attribute);
    return get_var(attribute) || [10, 10];
};

public method .attributes() {
    return ((.physical_attributes()) + (.mental_attributes())) + (.meta_attributes());
};

public method .dead() {
    return dead;
};

public method .fmta() {
    arg stat;
    var base, cur;
    
    [base, cur] = get_var(stat) || [10, 10];
    if (base == cur)
        return pad(tostr(cur), -2) + "    ";
    return strfmt("%2r/%2l", cur, base) + " ";
};

public method .fmts() {
    arg score;
    var v;
    
    v = get_var(score);
    switch (score) {
        case 'hum:
            if (v > 0)
                return pad("+" + v, 6);
    }
    return pad(tostr(v), 6);
};

public method .format_sheet() {
    var out, line;
    
    line = (("  Strength: " + (.fmta('str))) + " Intellect: ") + (.fmta('int));
    line += (("    Craft: " + (.fmta('cra))) + " STR DMG: ") + (.fmts('dmg));
    out = [line];
    line = (("   Agility: " + (.fmta('agl))) + "Perception: ") + (.fmta('per));
    line += (("Awareness: " + (.fmta('awr))) + " CMB REA: ") + (.fmts('cmb));
    out += [line];
    line = (("Appearance: " + (.fmta('app))) + "  Charisma: ") + (.fmta('cha));
    line += "   -------        NPC REA: " + (.fmts('npc));
    out += [line];
    line = ((" Integrity: " + (.fmta('itg))) + " Willpower: ") + (.fmta('wil));
    line += ((" Humanity: " + (.fmta('hum))) + "   Learn: ") + (.fmts('lrn));
    out += [line, ""];
    line = ((((((" Endurance: " + (.fmts('end))) + " Knowledge: ") + (.fmts('kno))) + "   Source: ") + (.fmts('src))) + " Cur Src: ") + (.fmts('csrc));
    out += [line];
    line = ("   ** Life: " + (.fmts('lif))) + "    DAMAGE: x/x    CRITICAL: x/x     HEALTH: x/x";
    return out + [line];
};

public method .init_character() {
    str = (agl = (app = (itg = (int = (per = (cha = (wil = (cra = (awr = [10, 10])))))))));
};

public method .lower_attr() {
    arg attribute, difference;
    var new;
    
    new = (get_var(attribute)[1]) - difference;
    set_var(attribute, get_var(attribute).replace(1, new));
};

public method .mental_attributes() {
    return ['int, 'per, 'cha, 'wil];
};

public method .meta_attributes() {
    return ['cra, 'awr];
};

public method .ok_to_lower_initial() {
    arg attr, amt;
    var end;
    
    end = ((get_var(attr) || [10])[1]) - amt;
    if (end < 6)
        return "Initial Attributes may not be less than 6";
    return end;
};

public method .ok_to_raise_initial() {
    arg attr, amt;
    var a, tot, phys, ment, meta, list, i, end;
    
    phys = .physical_attributes();
    ment = .mental_attributes();
    meta = .meta_attributes();
    for a in ((phys + ment) + meta) {
        if ((a = get_var(a)))
            tot += a[1];
        else
            tot += 10;
    }
    if (tot > 110)
        return "No initial points left, try reducing another attribute.";
    end = ((get_var(attr) || [10])[1]) + amt;
    if (end > 16)
        return "Initial Attributes may not be more than 16";
    if (attr in phys) {
        list = phys;
        i = [56, "Physical"];
    } else if (attr in ment) {
        list = ment;
        i = [56, "Mental"];
    } else if (attr in meta) {
        list = meta;
        i = [30, "Meta-Physical"];
    } else {
        throw(~invattr, "Invalid Attribute: " + attr);
    }
    tot = 0;
    for a in (list) {
        if ((a = get_var(a)))
            tot += a[1];
        else
            tot += 10;
    }
    if ((tot + amt) > (i[1]))
        return ((("This would go beyond the max (" + (i[1])) + ") for ") + (i[2])) + " Attributes";
    return end;
};

public method .physical_attributes() {
    return ['str, 'agl, 'app, 'itg];
};

public method .raise_attr() {
    arg attribute, difference;
    var new;
    
    new = (get_var(attribute)[1]) + difference;
    if (new > (get_var(attribute)[2]))
        new = get_var(attribute)[2];
    set_var(attribute, get_var(attribute).replace(1, new));
};

public method .set_attribute() {
    arg attribute, base;
    var cur;
    
    (> .perms(caller(), $player) <);
    if (!(attribute in (.attributes())))
        throw(~invattr, "Invalid Attribute: " + attribute);
    cur = get_var(attribute) || [10, 10];
    cur = replace(cur, 1, base);
    if ((cur[2]) > base)
        cur = replace(cur, 2, base);
    set_var(attribute, cur);
};


