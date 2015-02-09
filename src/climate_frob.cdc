
new object $climate_frob: $frob;

var $root created_on = 837904716;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$climate_frob];
var $root manager = $climate_frob;

public method ._distances() {
    arg self, from, season;
    var i, j, attr, w, refattr;
    
    w = self[3];
    refattr = (w[from])[1];
    return map i in (w.keys()) to ([i, ((map j in [1 .. (attr = (w[i])[1]).length()] to (abs((attr[j]) - (refattr[j]))).sum()) * 100) / (((w[i])[2])[season])]);
};

public method .add_weather() {
    arg self, name, attrs, probs, message, ch_messages;
    
    return (<this(), [self[1], self[2], (self[3]).add(name, [attrs, probs, message, ch_messages])]>);
};

public method .advance() {
    arg self, current, season, fuzz;
    var dists, i, w, s;
    
    w = self[3];
    dists = ._distances(self, current, season);
    dists = dists.sort(dists.slice(2));
    i = 1;
    while ((i < (dists.length())) && (random(20 + ((dists[i])[2])) < fuzz))
        i++;
    return (dists[i])[1];
};

public method .del_weather() {
    arg self, weather;
    
    return (<this(), [self[1], self[2], (self[3]).del(weather)]>);
};

public method .new_with() {
    arg attributes, seasons;
    
    return (<this(), [attributes, seasons, #[]]>);
};

public method .read_new() {
    arg user;
    var attrs, seasons, i;
    
    attrs = (> user.prompt("Weather attribute names (default:visibility severity):") <);
    if (attrs == "@abort")
        throw(~abort, "User aborted.");
    if (type(attrs) == 'symbol)
        throw(~engaged, "Already reading.");
    attrs = attrs || "visibility severity";
    attrs = (attrs.explode()).mmap('to_symbol);
    seasons = (> user.prompt("Season list (default:winter spring summer fall):") <);
    if (type(seasons) == 'symbol)
        throw(~engaged, "Already reading.");
    seasons = seasons || "winter spring summer fall";
    seasons = (seasons.explode()).mmap('to_symbol);
    return .new_with(attrs, seasons);
};

public method .read_weather() {
    arg self, user, weather;
    var attrs, probs, message, ch_messages, i;
    
    attrs = (> user.prompt("Attributes:") <);
    if (((self[1]).length()) != ((attrs = attrs.explode_quoted()).length()))
        throw(~parse, "Wrong number of attributes");
    attrs = map i in (attrs) to ((tostr(toint(i)) == i) ? toint(i) : i);
    probs = (> user.prompt("Seasonal probabilities [0-99]:") <);
    if (((self[2]).length()) != ((probs = probs.explode()).length()))
        throw(~parse, "Wrong number of attributes");
    probs = map i in (probs) to (toint(i));
    message = (> user.prompt("Weather description:") <);
    (> (message = $compiler.compile_cml(message)) <);
    ch_messages = user.read("Enter messages to be displayed during the change ('.' to finish)");
    if (type(ch_messages) == 'symbol)
        throw(~stop, "");
    (> (ch_messages = map i in (ch_messages) to ($compiler.compile_cml(i))) <);
    return .add_weather(self, weather, attrs, probs, message, ch_messages);
};

public method .show() {
    arg self;
    var out, seasons, attrs, weathers, x, i;
    
    attrs = self[1];
    seasons = self[2];
    weathers = self[3];
    out = [("Attributes: " + (attrs.to_english())) + ".", ("Seasons: " + (seasons.to_english())) + "."];
    for x in (weathers) {
        out += [((((" * " + (x[1])) + "> (probs) ") + (map i in [1 .. seasons.length()] to ((tostr(seasons[i]) + ":") + (((x[2])[2])[i])).join(", "))) + " (attrs) ") + (map i in [1 .. attrs.length()] to ((tostr(attrs[i]) + ":") + (((x[2])[1])[i])).join(", "))];
        out += ["   Description = " + ((((x[2])[3]).uncompile()).join())];
        if ((x[2])[4]) {
            out += ["   Change messages:"];
            for i in ((x[2])[4])
                out += ["      " + ((i.uncompile()).join())];
        }
    }
    return out;
};


