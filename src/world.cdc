
new object $world: $utilities, $event_handler;

var $event_handler events = 0;
var $event_handler hooked = #[];
var $event_handler hooks = #[];
var $root created_on = 850845715;
var $root defined_settings = #[["starting-place", #[['parse, ['is_type, 'objnum]]]], ["heartbeat-rate", #[['parse, ['parse_heartbeat_rate]], ['get, ['get_heartbeat_rate]], ['set, ['set_heartbeat_rate]], ['format, ['fmt_heartbeat_rate]]]], ["weather-rate", #[['parse, ['parse_weather_rate]], ['get, ['get_weather_rate]], ['set, ['set_weather_rate]], ['format, ['fmt_weather_rate]]]], ["realms", #[['get, ['get_realms]], ['set, ['set_realms]], ['parse, ['parse_itemlist, 'parse_realms]], ['format, ['format_itemlist]]]], ["cleanup-disconnected-users", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$world];
var $root manager = $world;
var $root settings = #[["starting-place", $the_pit], ["weather-rate", 5000], ["cleanup-disconnected-users", 1]];
var $root trusted = [$realm];
var $world heartbeat_rate = 600;
var $world last_weather_change = 1011936170;
var $world realms = [$realm_of_creation];
var $world weather_rate = 5400;

root method .core_world() {
    .set_setting("realms", $world, "$realm_of_creation");
    .set_setting("starting-place", $world, $the_pit);
};

public method .fmt_heartbeat_rate() {
    arg data;
    
    return $time.to_english(data);
};

public method .fmt_weather_rate() {
    arg data;
    
    return $time.to_english(data);
};

public method .get_heartbeat_rate() {
    arg @args;
    
    return heartbeat_rate;
};

public method .get_realms() {
    arg @ignored;
    
    return realms;
};

public method .get_weather_rate() {
    arg @args;
    
    return weather_rate;
};

public method .parse_heartbeat_rate() {
    arg value, @args;
    
    value = (> $time.from_english(value) <);
    if (value < 1)
        throw(~set, "You cannot set the heartbeat rate to less than 1 second");
    return value;
};

public method .parse_realms() {
    arg value, action, @args;
    var obj, list;
    
    obj = (> $object_lib.to_dbref(value) <);
    if (!(obj.is($realm)))
        throw(~set, ("The object '" + obj) + "' is not a realm object.");
    return obj;
};

public method .parse_weather_rate() {
    arg value, @args;
    
    value = (> $time.from_english(value) <);
    if (value < 1)
        throw(~set, "You cannot set the weather rate to less than 1 second");
    return value;
};

public method .pulse() {
    var i, d, weather_ticked, t;
    
    (> .perms(sender(), $heart) <);
    t = time();
    weather_ticked = 0;
    if (t >= (last_weather_change + weather_rate)) {
        weather_ticked = 1;
        last_weather_change = t;
    }
    for i in (realms) {
        pause();
        catch any {
            i.advance_weather(weather_ticked);
        } with {
            (| (i.manager()).tell_traceback(traceback()) |);
            (| (i.manager()).tell(("Weather change failed for " + i) + ".") |);
        }
    }
};

public method .send_event() {
    arg @args;
    
    (> .perms(caller(), 'trusts) <);
    pass(@args);
};

protected method .set_heartbeat_rate() {
    arg name, definer, value;
    
    heartbeat_rate = value;
    if (heartbeat_rate > 0)
        $heart.add_heartbeat(heartbeat_rate);
};

protected method .set_realms() {
    arg name, definer, value;
    
    switch (value[1]) {
        case 'set:
            realms = value[2];
        case 'add:
            realms = setadd(realms, value[2]);
        case 'del:
            realms = setremove(realms, value[2]);
        default:
            throw(~type, "Unknown action: " + (value[1]));
    }
};

protected method .set_weather_rate() {
    arg name, definer, value;
    
    weather_rate = value;
};

public method .shutdown() {
    (> .perms(sender(), 'manager) <);
    $heart.del_heartbeat();
};

public method .starting_place() {
    return (| .get_setting("starting-place", $world) |) || $body_cave;
};

public method .startup() {
    arg @args;
    
    (> .perms(sender(), 'manager) <);
    if (heartbeat_rate > 0)
        $heart.add_heartbeat(heartbeat_rate);
    last_weather_change = 0;
};


