
new object $world_time: $foundation;

var $root created_on = 848446570;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_world_time;
var $root inited = 1;
var $root managed = [$world_time];
var $root manager = $world_time;
var $world_time speedup = 3;
var $world_time start_time = 873375987;
var $world_time time_units = [[31536000, "year", "years", "yr", "yrs"], [2592000, "month", "months", "mo", "mos"], [604800, "week", "weeks", "wk", "wks"], [86400, "day", "days", "dy", "dys"], [3600, "hour", "hours", "hr", "hrs"], [60, "minute", "minutes", "min", "mins"], [1, "second", "seconds", "sec", "secs"]];
var $world_time zone_offset = 0;

public method .current_season() {
    var t;
    
    // This is not very flexible, but works well enough. Note that southern
    // hemisphere needs another object, with opposite seasons.
    return ["spring", "summer", "fall", "winter"][(((.local_time()) / 2592000) % 4) + 1];
};

public method .daytime() {
    arg zone, dayscale;
    var t, t1, t2;
    
    t = (((.local_time()) / 3600) + zone) % 24;
    t1 = 6 - dayscale;
    t2 = 18 + dayscale;
    switch (t) {
        case 0 .. 2:
            return [t, 'night, 'night];
        case 3 .. t1 - 1:
            return [t, 'predawn, 'night];
        case t1:
            return [t, 'dawn, 'day];
        case t1 + 1 .. 11:
            return [t, 'morning, 'day];
        case 12:
            return [t, 'noon, 'day];
        case 13 .. t2 - 1:
            return [t, 'afternoon, 'day];
        case t2:
            return [t, 'sunset, 'day];
        case t2 + 1 .. 22:
            return [t, 'evening, 'night];
        case 23:
            return [t, 'night, 'night];
    }
};

public method .from_english() {
    arg string, @units;
    var words, len, nsec, n, i, entry, unit;
    
    [(units ?= time_units)] = units;
    words = string.explode();
    words = words.setremove_all(["and"]);
    if (listlen(words) == 1) {
        if (!(words = regexp(words[1], "^([0-9]+)(.*)$")))
            throw(~args, "Invalid time.");
    }
    len = listlen(words);
    if (len % 2)
        throw(~args, ("Unrecognized time '" + string) + "', no descriptor.");
    nsec = (n = 0);
    for i in [1 .. len] {
        if ((i % 2) == 1) {
            if ((words[i]).is_numeric())
                n = (words[i]).to_number();
            else if ((words[i]) in ["a", "an"])
                n = 1;
            else if ((words[i]) == "no")
                n = 0;
            else
                throw(~invarg, ("Invalid time element '" + n) + "'.");
        } else {
            unit = words[i];
            unit = unit.strip(",");
            nsec += (> (units[.parse_unit(unit, units)])[1] <) * n;
        }
    }
    return nsec;
};

public method .from_unit_list() {
    arg time, ulist;
    var t, s, i;
    
    s = [];
    for i in (ulist) {
        t = time / ((time_units[i])[1]);
        if (t)
            s += [((t + " ") + ((time_units[i])[2])) + ((t != 1) ? "s" : "")];
        time = time % ((time_units[i])[1]);
    }
    return s.to_english();
};

public method .local_time() {
    return (time() - start_time) * speedup;
};

public method .parse_unit() {
    arg unit, @units;
    var i;
    
    [(units ?= time_units)] = units;
    i = find i in [1 .. units.length()] where (unit in ((units[i]).subrange(2)));
    if (i)
        return i;
    throw(~invarg, ("Invalid time unit '" + unit) + "', no descriptor?");
};

public method .time_units() {
    return time_units;
};


