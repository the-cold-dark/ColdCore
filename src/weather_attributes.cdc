
new object $weather_attributes: $has_commands, $weather_system;

var $has_commands local = #[];
var $has_commands remote = #[["@awa", [["@awa", "* values * to *", "@awa <any> values <any> to <this>", 'add_attrib_cmd, #[[1, ['any, []]], [3, ['any, []]], [5, ['this, []]]]]]], ["@dwa", [["@dwa", "* from *", "@dwa <any> from <this>", 'del_attrib_cmd, #[[1, ['any, []]], [3, ['this, []]]]]]], ["@lwa", [["@lwa", "*", "@lwa <this>", 'list_attribs_cmd, #[[1, ['this, []]]]]]], ["@aea", [["@aea", "* values * to *", "@aea <any> values <any> to <this>", 'add_extra_cmd, #[[1, ['any, []]], [3, ['any, []]], [5, ['this, []]]]]]], ["@add-weather-attribute", [["@add-weather-attribute", "* values * to *", "@add-weather-attribute <any> values <any> to <this>", 'add_attrib_cmd, #[[1, ['any, []]], [3, ['any, []]], [5, ['this, []]]]]]], ["@del-weather-attribute", [["@del-weather-attribute", "* from *", "@del-weather-attribute <any> from <this>", 'del_attrib_cmd, #[[1, ['any, []]], [3, ['this, []]]]]]], ["@list-weather-attributes", [["@list-weather-attributes", "*", "@list-weather-attributes <this>", 'list_attrib_cmd, #[[1, ['this, []]]]]]], ["@add-extra-attribute", [["@add-extra-attribute", "* values * to *", "@add-extra-attribute <any> values <any> to <this>", 'add_extra_cmd, #[[1, ['any, []]], [3, ['any, []]], [5, ['this, []]]]]]]];
var $has_commands shortcuts = #[];
var $root created_on = 855309872;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_sys_weather_attributes;
var $root inited = 1;
var $root managed = [$weather_attributes];
var $root manager = $weather_attributes;
var $weather_attributes attributes = #[["precipitation", ["fine", "drizzle", "rain", "shower", "snow"]], ["humidity", ["dry", "fine", "humid"]], ["temperature", ["hot", "warm", "cold", "freezing"]], ["visibility", ["clear", "hazy", "murky"]], ["clouds", ["clear", "cloudy", "overcast"]], ["wind", ["serene", "windy", "stormy"]]];
var $weather_attributes extra_attributes = #[];

public method .add_attrib_cmd() {
    arg cmdstr, cmd, name, p1, vals, p2, p3;
    
    (> .perms(sender()) <);
    vals = (vals.explode(";")).mmap('trim);
    attributes = (attributes || #[]).add(name, vals);
    return ("Defined attributes: " + ((attributes.keys()).to_english())) + ".";
};

public method .add_extra_cmd() {
    arg cmdstr, cmd, name, p1, vals, p2, p3;
    
    (> .perms(sender()) <);
    vals = (vals.explode(";")).mmap('trim);
    extra_attributes = (extra_attributes || #[]).add(name, vals);
    return ("Defined extra attributes: " + ((extra_attributes.keys()).to_english())) + ".";
};

public method .alist_dict() {
    arg attrlist;
    var i, k, v;
    
    k = attributes.keys();
    v = attributes.values();
    return hash i in [1 .. attrlist.length()] to ([k[i], (v[i])[attrlist[i]]]);
};

public method .del_attrib_cmd() {
    arg cmdstr, cmd, name, @rest;
    
    (> .perms(sender()) <);
    if ((| attributes.contains(name) |)) {
        attributes = attributes.del(name);
        return ("Attribute " + name) + " deleted.";
    } else if ((| extra_attributes.contains(name) |)) {
        extra_attributes = extra_attributes.del(name);
        return ("Extra attribute " + name) + " deleted.";
    } else {
        return name + " not found.";
    }
};

public method .extra_attributes() {
    return extra_attributes;
};

public method .list_attribs_cmd() {
    arg @who_cares;
    var i, a1, a2;
    
    a1 = attributes ? map i in (attributes) to ("@awa %l values %l to %l".format(i[1], (i[2]).join(";"), definer())) : [];
    a2 = extra_attributes ? map i in (extra_attributes) to ("@aea %l values %l to %l".format(i[1], (i[2]).join(";"), definer())) : [];
    return ["Weather attributes:", @a1, @a2, "---"];
};

public method .parse_attribute_list() {
    arg attrlist;
    var i, alist, akeys, out, m, key, val;
    
    alist = (attrlist.explode(";")).mmap('trim);
    akeys = attributes.keys();
    if (!("=" in attrlist)) {
        if ((alist.length()) != (akeys.length()))
            throw(~parse, "Can't parse those weather attributes.");
        alist = ([akeys, alist].transpose()).mmap('join, "=");
    }
    out = #[];
    for i in (alist) {
        if (!(m = i.match_pattern("*=*")))
            throw(~parse, "Entry not of the form attribute=value.");
        key = ((m[1]) in akeys) || find i in [1 .. akeys.length()] where ((akeys[i]).match_begin(m[1]));
        if (!key)
            throw(~parse, "No such attribute.");
        if (!(val = (m[2]) in (attributes[akeys[key]])))
            throw(~parse, "Illegal value for %l:%l.".format(akeys[key], m[2]));
        out = out.add(akeys[key], val);
    }
    if (!(((out.keys()).length()) == (akeys.length())))
        throw(~parse, "Missing attributes.");
    return map i in (akeys) to (out[i]);
};


