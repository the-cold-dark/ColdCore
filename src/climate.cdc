
new object $climate: $has_commands, $weather_system;

var $climate daylengths = [];
var $climate realm = $realm_of_creation;
var $climate seasons = [];
var $climate weathers = #[];
var $has_commands local = #[];
var $has_commands remote = #[["@list-climate", [["@list-climate", "*", "@list-climate <this>", 'show_cmd, #[[1, ['this, []]]]]]], ["@setup", [["@setup", "* seasons * daylengths *", "@setup <this> seasons <any> daylengths <any>", 'setup_cmd, #[[1, ['this, []]], [3, ['any, []]], [5, ['any, []]]]]]], ["@add-weather", [["@add-weather", "* type * prob?abilities *", "@add-weather <this> type <descendant of $weather> prob?abilities <any>", 'add_weather_cmd, #[[1, ['this, []]], [3, ['descendant, [$weather]]], [5, ['any, []]]]]]], ["@del-weather", [["@del-weather", "* type *", "@del-weather <this> type <descendant of $weather>", 'del_weather_cmd, #[[1, ['this, []]], [3, ['descendant, [$weather]]]]]]]];
var $has_commands shortcuts = #[];
var $root created_on = 839895133;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_sys_climate;
var $root inited = 1;
var $root managed = [$climate];
var $root manager = $climate;

public method ._probabilities() {
    arg from, season, fuzz;
    var i, j, attr, refattr, dists, sum, t;
    
    season = season in seasons;
    refattr = from.attributes();
    dists = map i in (weathers.keys()) to (refresh() && [i, (100 * ((weathers[i])[season])) / (fuzz + ((type((t = (| map j in [1 .. (attr = i.attributes()).length()] to (abs((attr[j]) - (refattr[j]))).sum() |))) == 'error) ? 1000000 : t))]);
    
    // normalize the list - the sum should be around 10,000
    sum = (dists.slice(2)).sum();
    return map i in (dists) to ([i[1], ((i[2]) * 10000) / sum]);
};

public method .add_weather_cmd() {
    arg cmdstr, cmd, this, p1, weather, p2, probs;
    var i;
    
    (> .perms(sender()) <);
    probs = map i in (probs.explode()) to (toint(i));
    if ((probs.length()) != (seasons.length()))
        throw(~parse, "Wrong number of probabilities.");
    weathers = weathers.add(weather, probs);
    return ("Weather `" + (weather.name())) + "' added.";
};

public method .advance() {
    arg current, season, dependancies;
    var dists, i, w, d, fuzz;
    
    fuzz = 3;
    dists = ._probabilities(current, season, fuzz);
    dists = dists.sort(dists.slice(2));
    for i in (dependancies) {
        d = (i[1]).get_setting("weather-time", $realm);
        dists += ((i[2]) * ((d[3])._probabilities(d[1], d[2], fuzz))) / 100;
    }
    w = random(10000);
    i = 1;
    d = 0;
    while ((i <= (dists.length())) && ((d += (dists[i])[2]) < w))
        i++;
    if (i > (dists.length()))
        i--;
    return (dists[i])[1];
};

public method .ctext_variables() {
    arg current, season;
    var vars;
    
    vars = #[["weather", current.name()], ["weather_desc", current.prose()], ["season", season]];
    vars = dict_union(vars, current.attribute_vars());
    return vars;
};

public method .daylength() {
    arg season;
    
    return daylengths[season in seasons];
};

public method .del_weather_cmd() {
    arg cmdstr, cmd, this, p1, weather;
    var i;
    
    (> .perms(sender()) <);
    if (!(weathers.contains(weather)))
        return "That weather doesn't belong to this climate.";
    weathers = weathers.del(weather);
    return ("Weather `" + (weather.name())) + "' removed.";
};

public method .match_weather() {
    arg weather_str;
    var i, out;
    
    if ((out = find i in (weathers.keys()) where ((i.name()) == weather_str)))
        return (weathers.keys())[out];
    if ((out = find i in (weathers.keys()) where (weather_str.match_begin(i.name()))))
        return (weathers.keys())[out];
    throw(~keynf, "No such weather in this climate.");
};

public method .realm() {
    return realm;
};

public method .setup_cmd() {
    arg cmdstr, cmd, this, p, vals, p, dls;
    var s, line, attrs, att2, extras, ex2, i;
    
    (> .perms(sender()) <);
    seasons = vals.explode();
    daylengths = map i in (dls.explode()) to (toint(i));
    weathers = #[];
    return ("Seasons: " + (seasons.to_english())) + ". The weather list has been wiped.";
};

public method .show_cmd() {
    arg cmdstr, cmd, this;
    var out, x, i, hdr;
    
    if (definer() == this())
        return "The base climate object does not define anything--refer to its children.";
    hdr = [];
    for x in [1 .. listlen(seasons)] {
        i = (((seasons[x]) + " (") + (daylengths[x])) + ")";
        hdr += [[i, pad("", strlen(i), "-")]];
    }
    return ((map i in (weathers) to ([(i[1]).name(), @i[2]]).transpose()).tabulate([["Weather type", "------------"]] + hdr)) + ["---"];
};


