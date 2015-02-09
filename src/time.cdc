
new object $time: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_time;
var $root inited = 1;
var $root managed = [$time];
var $root manager = $time;
var $time days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var $time months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var $time time_units = [[31536000, "year", "years", "yr", "yrs"], [2592000, "month", "months", "mo", "mos"], [604800, "week", "weeks", "wk", "wks"], [86400, "day", "days", "dy", "dys"], [3600, "hour", "hours", "hr", "hrs"], [60, "minute", "minutes", "min", "mins"], [1, "second", "seconds", "sec", "secs"]];

public method .dhms() {
    arg secs, @long;
    var ret_str, x;
    
    if (long)
        long = 1;
    if (secs > 86400) {
        x = secs / 86400;
        ret_str = x + (long ? (" day" + ((x < 2) ? "" : "s")) : "d");
    } else if (secs > 3600) {
        x = secs / 3600;
        ret_str = x + (long ? (" hr" + ((x < 2) ? "" : "s")) : "h");
    } else if (secs > 60) {
        x = secs / 60;
        ret_str = x + (long ? (" min" + ((x < 2) ? "" : "s")) : "m");
    } else {
        ret_str = secs + (long ? (" sec" + ((secs < 2) ? "" : "s")) : "s");
    }
    return ret_str;
};

public method .elapsed() {
    arg time, @flag;
    var str, t, p;
    
    // compares args[1] with time() and returns hh:mm elapsed
    // will eventually make flags do things like 'long etc.  For now its
    // just your own time, rather than time().
    [(flag ?= 'stopwatch)] = flag;
    
    // time = time() - time;
    switch (flag) {
        case 'long:
            return .to_english(time);
        default:
            if (time > 356400)
                p = 3;
            else
                p = 2;
            return strfmt("%2{0}r:%2{0}r:%2{0}r", time / 3600, (time % 3600) / 60, time % 60);
    }
};

public method .format(): native;

public method .from_english() {
    arg string;
    
    return $world_time.from_english(string, time_units);
};

public method .realm_time() {
    arg realm, @season;
    var d, lt, hr, pm, min, tm;
    
    d = realm.get_setting("weather-time", $realm);
    lt = ((d[5]).local_time()) + (d[6]);
    hr = ((lt / 3600) + (d[6])) % 24;
    if (hr >= 12) {
        pm = "PM";
        if (hr > 12)
            hr -= 12;
    } else {
        pm = "AM";
    }
    min = (lt / 60) % 60;
    tm = strfmt("%2{0}r:%2{0}r ", hr, min) + pm;
    return [tm + (season ? ((" (" + (d[2])) + "time)") : ""), (d[3]).realm()];
};

public method .to_english() {
    arg time, @reftime;
    var times, words, x, ctime, mnths, month, year, days, out, lt, rrk;
    
    // most of this was stolen from MOO (und ve are evil)
    if (time < 1)
        return "0 seconds";
    [(reftime ?= time())] = reftime;
    words = ["year", "month", "day", "hour", "minute", "second"];
    times = [];
    for x in ([60, 60, 24]) {
        times = [time % x, @times];
        time = time / x;
    }
    mnths = 0;
    lt = localtime(reftime);
    month = lt[6];
    if ((lt[7]) < 100)
        year = 1900 + (lt[7]);
    else
        year = lt[7];
    days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
    while (time >= (days + ((month == 2) && (((year % 4) == 0) && (!((year % 400) in [100, 200, 300])))))) {
        refresh();
        time -= days;
        mnths++;
        month++;
        if (month > 12) {
            year++;
            month = 1;
        }
    }
    times = [mnths / 12, mnths % 12, time, @times];
    out = [];
    for x in [1 .. 6] {
        if ((times[x]) > 0)
            out += [(((times[x]) + " ") + (words[x])) + (((times[x]) == 1) ? "" : "s")];
    }
    return out.to_english();
};


