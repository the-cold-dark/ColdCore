
new object $channel_db: $db;

var $channel_db system_channels = ['Login, 'System, 'All];
var $db database = #[['all, ['All, 0, <$parent_lock_frob, [$admin]>, 0, $channel_db, [$channel_db], 0, 0]], ['admin, ['Admin, -1, <$parent_lock_frob, [$admin]>, 0, $channel_db, [$channel_db], "Administrator's Channel", 0]], ['system, ['System, 1, 0, 0, $channel_db, [$channel_db], "System wide messages like backup notifications.", 0]], ['login, ['Login, 2, 0, 0, $channel_db, [$channel_db], "User login and logout notifications.", 0]]];
var $root created_on = 845244416;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$channel_db];
var $root manager = $channel_db;
var $root trusted = [$channel_ui];

protected method .clean_db() {
    var x, d;
    
    d = #[];
    for x in (.database()) {
        pause();
        if ((x[2])[2])
            d = d.add(@x);
    }
    .set_database(d);
};

root method .core_channel_db() {
    var elem, key, value, d;
    
    d = #[];
    for elem in (.database()) {
        refresh();
        [key, value] = elem;
        if (!valid(value[5]))
            continue;
        if (filter elem in (value[6]) where (!valid(elem)))
            continue;
        d = d.add(key, value);
    }
    .set_database(d);
};

public method .search() {
    arg channel;
    var key;
    
    if (type(channel) != 'symbol)
        key = .strip_key(channel);
    else
        key = channel;
    catch ~keynf, ~matchnf
        return (> .exact_match(key) <);
    with
        throw(~keynf, "Unknown channel: " + channel);
};

public method .strip_key() {
    arg channel;
    var key;
    
    anticipate_assignment();
    return lowercase(tostr(channel)).to_symbol();
};

public method .system_channels() {
    return system_channels;
};


