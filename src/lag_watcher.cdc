
new object $lag_watcher: $utilities;

var $lag_watcher lags = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var $lag_watcher last_time = 935864056;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$lag_watcher];
var $root manager = $lag_watcher;

public method .lag() {
    var lag, total, weight, lag_i, lag_d;
    
    // the current lag floated
    total = 0;
    weight = 0;
    for lag in (lags) {
        ++weight;
        total += lag * weight;
    }
    lag_i = total / 55;
    lag_d = tostr(((total - (lag_i * 55)) * 10) / 55).subrange(1, 1);
    return (tostr(lag_i) + ".") + lag_d;
};

public method .lag_str() {
    return ("Current server lag is " + (.lag())) + " seconds.";
};

public method .pulse() {
    var lag;
    
    // Called by $heart every 15 seconds
    (> .perms(sender(), $heart) <);
    lag = time() - last_time;
    last_time = time();
    .update(lag);
};

public method .shutdown() {
    // Called by $sys.shutdown();
    (> .perms(sender(), 'manager) <);
    $heart.del_heartbeat();
    last_time = 0;
    lags = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
};

public method .startup() {
    arg @args;
    
    // Called by $sys.startup()
    (> .perms(sender(), 'manager) <);
    lags = [];
    last_time = time();
    $heart.add_heartbeat(14);
};

protected method .update() {
    arg lag;
    
    // Called by .pulse() every 15 minutes
    if (type(lags) != 'list)
        lags = [];
    while ((lags.length()) > 9)
        lags = lags.delete(1);
    lag = (lag > 15) ? (lag - 15) : 0;
    lags += [lag];
};

public method .value() {
    var lag, total, weight, lag_i;
    
    // unparsed lag value
    total = 0;
    weight = 0;
    for lag in (lags) {
        ++weight;
        total += lag * weight;
    }
    lag_i = total / 55;
    return lag_i;
};

public method .verbose_lag_str() {
    // returns lag as a string with verbosity
    return [("Current server lag is " + (.lag())) + " seconds.", toliteral(lags)];
};


