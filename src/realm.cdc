
new object $realm: $realm_settings, $event_handler, $has_name;

var $foundation defined_msgs = #[["night", #[['branches, ["general"]]]], ["predawn", #[['branches, ["general"]]]], ["dawn", #[['branches, ["general"]]]], ["morning", #[['branches, ["general"]]]], ["noon", #[['branches, ["general"]]]], ["afternoon", #[['branches, ["general"]]]], ["sunset", #[['branches, ["general"]]]], ["evening", #[['branches, ["general"]]]]];
var $foundation msgs = #[["afternoon", #[["general", <$ctext_frob, [["The sun descends toward the horizon."], #[]]>]]], ["dawn", #[["general", <$ctext_frob, [["The first rays of sun announce the new day."], #[]]>]]], ["evening", #[["general", <$ctext_frob, [["The sky darkens as sunlight fades."], #[]]>]]], ["morning", #[["general", <$ctext_frob, [["The temperature begins to rise as the morning sun lifts above the horizon."], #[]]>]]], ["night", #[["general", <$ctext_frob, [["The sky darkens to night."], #[]]>]]], ["noon", #[["general", <$ctext_frob, [["The sun peaks in the sky."], #[]]>]]], ["predawn", #[["general", <$ctext_frob, [["The sky to the east brightens."], #[]]>]]], ["sunset", #[["general", <$ctext_frob, [["The sun slowly dips beneath the horizon."], #[]]>]]]];
var $has_name name = ['uniq, "Realm", "the Realm"];
var $realm last_daytime = 0;
var $realm links = #[];
var $realm local = [];
var $root created_on = 796268969;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root defined_settings = #[["weather-time", #[['get, ['get_realm_setting]], ['parse, ['parse_weather_time]], ['format, ['format_weather_time]]]]];
var $root flags = ['methods, 'code, 'variables, 'core, 'fertile];
var $root help_node = $help_places_realms;
var $root inited = 1;
var $root managed = [$realm];
var $root manager = $realm;
var $root settings = #[["weather-time", [$weather_nice, "spring", $climate_creation, 0, $world_time, 0]], ["propagate", 0], ["map-position", 0]];
var $root trusted_by = [$world];

public method ._check_links() {
    arg @propagate_check;
    var i, j, k, d;
    
    (caller() == $realm_admin_ui) || (> .perms(caller(), $realm) <);
    d = #[];
    for i in (links || #[]) {
        for j in (i[2]) {
            // Run at low priority...
            refresh();
            if (!(j[4])) {
                if ((j[2]).is_connected_to(j[3]))
                    d = d.add_elem(i[1], j);
            } else if (((j[2]).is_connected_to((j[4])[1])) && ((!find k in [1 .. ((j[4]).length()) - 1] where (refresh() && (!(((j[4])[k]).is_connected_to((j[4])[k + 1]))))) && (((j[4]).last()).is_connected_to(j[3])))) {
                d = d.add_elem(i[1], j);
            }
        }
    }
    links = d;
    if (propagate_check)
        (| ((.parents())[1])._check_links(@propagate_check) |);
};

protected method ._get_msg() {
    arg name, definer;
    var msg;
    
    if ((msg = (| .get_local_msg(name) |)))
        return dict_union(definer.get_default_msg(name), msg);
    else if (this() == definer)
        return definer.get_default_msg(name);
    else
        return (parents()[1])._get_msg(name, definer);
};

public method .add_exit_to() {
    arg dest;
    
    (> .perms(caller(), $place) <);
    if ((dest.realm()) != this()) {
        links = links || #[];
    
        // Do a quick sanity check before adding a new cross-realm exit
        ._check_links();
    
        // The format is: links, source, destination, path source->dest
        links = links.add_elem(dest.realm(), [this(), sender(), dest, []]);
    }
};

public method .add_local() {
    arg new_dest;
    
    local = $list.setadd(.local(), new_dest);
};

public method .advance_weather() {
    arg ticked;
    var d, new;
    
    (caller() == $world) || (> .perms(sender()) <);
    d = .get_setting("weather-time", $realm);
    if (ticked) {
        d = d.replace(2, $world_time.current_season());
        new = (d[3]).advance(d[1], d[2], (d[4]) || []);
        if (new != (d[1])) {
            d = d.replace(1, new);
            .set_setting("weather-time", $realm, d);
            .realm_announce(new.eval_message("invoke", $weather, .ctext_variables()));
        }
    }
    new = ((d[5]).daytime(d[6], (d[3]).daylength(d[2])))[2];
    if (new != last_daytime) {
        last_daytime = new;
        .realm_announce(new);
    }
    d = d.replace(2, (d[5]).current_season());
};

public method .cleanup_local() {
    var i, t;
    
    t = this();
    local = filter i in (local) where ((| (i.realm()) == t |));
};

public method .core_realm() {
    links = #[];
    local = [];
};

public method .ctext_variables() {
    var climate, weather, season, depend, timeobj, timezone, ret;
    
    [weather, season, climate, depend, timeobj, timezone] = .get_setting("weather-time", $realm);
    ret = (| climate.ctext_variables(weather, season) |) || #[];
    ret = ret.add('daytime, timeobj.daytime(timezone, (| climate.daylength(season) |) || 0));
    ret = ret.add('evaluator, $realm_base_eval);
    return ret;
};

public method .format_weather_time() {
    arg value;
    var out, i;
    
    if (!value)
        return "None";
    out = "%l %l in %l%l, %l".format((value[1]).name(), value[2], (value[3]).namef('ref), (value[4]) ? (" influenced by " + (map i in (value[4]) to (((i[1]).name()) + (((i[2]) == 50) ? "" : ((" = " + (i[2])) + "%"))).join("; "))) : "", (value[5]).namef('ref));
    if ((value[6]) > 0)
        out += "+";
    if ((value[6]) != 0)
        out += value[6];
    return out;
};

public method .get_msg() {
    arg name, definer;
    var get;
    
    // can only inherit if they use the default 'getter
    if ((get = (| definer.get_msg_attr(name, 'getter) |)))
        return .(get)(name, definer);
    return ._get_msg(name, definer);
};

public method .init_realm() {
    local = [];
    links = #[];
};

public method .is_buildable_by() {
    arg whom;
    
    if (.trusts(whom))
        return 1;
    else if (this() == definer())
        return 0;
    else
        return (parents()[1]).is_buildable_by(whom);
};

public method .local() {
    return local;
};

frob method .name() {
    arg @args;
    
    return (> pass(@args) <);
};

public method .new() {
    var i;
    
    (sender().is($place)) || throw(~place, sender() + " is not a place.");
    local = local.setadd(sender());
    .cleanup_local();
    return this();
};

public method .parse_weather_time() {
    arg value;
    var m, climate, depend, i, obj, tmp, str;
    
    if (type(value) == 'list)
        return value;
    if ((!value) || (value == "none"))
        return 0;
    value = (| (value.regexp("^(.+) (.+) in (.+),([^+-]+)([+-] *[0-9]+)?$")).mmap('trim) |);
    if (!value)
        throw(~type, "Value is not parsable as weather/time data.");
    if ((value.length()) < 5)
        value += ["0"];
    if ((m = (value[3]).match_pattern("* influenced by *"))) {
        value = value.replace(3, (m[1]).trim());
        depend = [];
        for i in ((((m[2]).trim()).split(";")).mmap('trim)) {
            refresh();
            [tmp, (str ?= "=50%")] = (i.regexp("([^=]+)(= *[0-9]+%)?")).mmap('trim);
            str = toint(((str.match_pattern("=*%"))[1]).trim());
            if (!(obj = $place_lib.match_realm(tmp)))
                throw(~match, ("Can't find realm " + tmp) + ".");
            depend += [[obj, str]];
        }
        depend ?= 0;
    } else {
        depend = 0;
    }
    if ((m = (value[3]).match_pattern("*($*)")))
        value = value.replace(3, "$" + (m[2]));
    if ((m = (value[4]).match_pattern("*($*)")))
        value = value.replace(4, "$" + (m[2]));
    climate = (> $object_lib.to_dbref(value[3]) <);
    return (> [climate.match_weather(value[1]), value[2], climate, depend, $object_lib.to_dbref(value[4]), toint((value[5]).replace(" ", ""))] <);
};

public method .place_destroyed() {
    arg @args;
    
    (sender() == (.manager())) || (> .perms(caller(), $place) <);
    (| (local = local.setremove(sender())) |);
};

public method .realm_announce() {
    arg message;
    
    (caller() == this()) || (> .perms(sender()) <);
    $world.send_event('realm_announce, message);
};

public method .realm_name() {
    var realms;
    
    realms = .realms();
    if ((realms.length()) > 2)
        realms = [realms[1], realms.last()];
    return realms.join(", ");
};

public method .realms() {
    var r;
    
    if (definer() == this())
        return [];
    return [.name()] + (((.parents())[1]).realms());
};

protected method .set_realm_local() {
    arg new;
    
    local = new;
};

root method .uninit_realm() {
    var x;
    
    for x in (local)
        (| x.set_realm($realm_of_creation) |);
};

root method .uninit_realms_frob() {
    var x;
    
    for x in (local)
        (| (x[1]).set_realm($realm_of_creation) |);
};


